//
//  main.m
//  objc-debug
//
//  Created by Cooci on 2019/10/9.
//

#import <Foundation/Foundation.h>
#import "LGPerson.h"




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        LGPerson *object = [LGPerson alloc];
        NSLog(@"Hello, World! %@",object);
    }
    return 0;
}
