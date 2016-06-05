//
//  QSFPSLabel.swift
//  QFFPS
//
//  Created by zhangping on 15/12/5.
//  Copyright © 2015年 zhangping. All rights reserved.
//

import UIKit

// 关联对象的key,只能放到外面.因为extension里面不能有属性
var fpsViewKey = "fpsViewKey"

// 扩展 UIView, 添加属性(利用runtime关联对象)
public extension UIView {
    
    // 添加属性
    var fpsView: QSFPSLabel? {
        get {
            // 从self中获取 fpsViewKey 关联的对象
            if let fps = objc_getAssociatedObject(self, &fpsViewKey) as? QSFPSLabel {
                // 获取到关联的对象,直接返回
                return fps
            } else {    // 没有获取到关联的对象
                // 创建一个 QSFPSLabel 对象
                let fps = QSFPSLabel()
                
                // 添加到当前view里面
                self.addSubview(fps)
                
                // 调用set 方法来将 fps 关联到 fpsViewKey 上面
                self.fpsView = fps
                
                // 返回 fps
                return fps
            }
        }
        
        set {
            // 将 newValue 对象 关联到 fpsViewKey
            objc_setAssociatedObject(self, &fpsViewKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// 在自定位置显示
    func show(origin: CGPoint) {
        fpsView?.frame.origin = origin
    }
    
    /// 在左上角显示
    func show() {
        show(CGPointZero)
    }
    
    /// 在控件中心显示
    func showInCenter() {
        let center = CGPoint(x: frame.width / 2, y: frame.height / 2)
        show(center)
    }
}

// 自定义 QSFPSLabel,显示view的帧率
public class QSFPSLabel: UILabel {
    
    // fpsLabel的大小
    private var FPSSize = CGSize(width: 65, height: 20)
    
    // 帧数的 Font
    private var textFont: UIFont? = UIFont.systemFontOfSize(14)
    
    // FPS文字的 Font
    private var subTextFont: UIFont? = UIFont.systemFontOfSize(14)
    
    // CADisplayLink
    private var link: CADisplayLink?
    
    // 上一次计算帧数的时间
    private var lastTime: NSTimeInterval = 0
    
    // 一秒内调用了多少次
    private var count = 0
    
    // FPS 文字
    private let FPSText = "FPS"
    
    // 构造方法
    override init(var frame: CGRect) {
        // 判断外面调用的时候是否有传frame进来
        if frame.size.width == 0 && frame.size.height == 0 {
            frame.size = FPSSize
        }
        
        super.init(frame: frame)
        
        // 设置图层的圆角
        layer.cornerRadius = 5
        clipsToBounds = true
        
        // 设置文字居中显示
        textAlignment = NSTextAlignment.Center
        
        // 设置背景颜色
        backgroundColor = UIColor(white: 0, alpha: 0.7)
        
        // 获取字体大小
        textFont = UIFont(name: "Menlo", size: 14)
        if let _ = textFont {
            subTextFont = UIFont(name: "Menlo", size: 12)
        } else {
            textFont = UIFont(name: "Courier", size: 14)
            subTextFont = UIFont(name: "Courier", size: 12)
        }
        
        // 创建 CADisplayLink 并加入 NSRunLoop
        link = CADisplayLink(target: self, selector: "tick:")
        link?.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSRunLoopCommonModes)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        link?.invalidate()
    }
    
    override public func sizeThatFits(size: CGSize) -> CGSize {
        return FPSSize
    }
    
    // 每帧调用
    func tick(link: CADisplayLink) {
        // 判断是否是第一次调用,第一次调用,设置 上一次计算帧数的时间
        if lastTime == 0 {
            lastTime = link.timestamp
            return
        }
        
        // 调用次数++
        count++
        
        // 计算距离上次计算帧数的时间
        let delta = link.timestamp - lastTime
        
        // 没有到1秒钟
        if delta < 1 {
            return
        }
        
        // 到一秒钟, 计算帧数
        let fps = Double(count) / delta
        
        // 赋值最后一次计算帧数时间
        lastTime = link.timestamp
        
        // 清空帧数
        count = 0
        
        // 计算比例,显示颜色
        let progress = fps / 60.0

        // 计算 帧数 颜色
        let color = UIColor(hue: CGFloat(0.27 * (progress - 0.2)), saturation: 1, brightness: 0.9, alpha: 1)
        
        let fpsString = String(format: "%.1f", arguments: [fps])
        
        // 设置内容
        let content = "\(fpsString) \(FPSText)"
        
        // 创建属性文本
        let attr = NSMutableAttributedString(string: "\(content)")

        // 添加属性
        attr.addAttribute(NSForegroundColorAttributeName, value: color, range: NSRange(location: 0, length: attr.length - FPSText.characters.count))
        
        let range = (content as NSString).rangeOfString(FPSText)
        attr.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: range)
        
        attr.addAttribute(NSFontAttributeName, value: textFont!, range: NSRange(location: 0, length: attr.length))
        
        attr.addAttribute(NSFontAttributeName, value: subTextFont!, range: range)
        
        // 赋值文本
        attributedText = attr
    }
}
