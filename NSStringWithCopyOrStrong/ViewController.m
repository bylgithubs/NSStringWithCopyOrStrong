//
//  ViewController.m
//  NSStringWithCopyOrStrong
//
//  Created by Civet on 2020/7/30.
//  Copyright © 2020 PersonalONBYL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong,nonatomic)NSString *testStr;

@property (copy,nonatomic)NSString *testStrCopy;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *testStr = [NSString stringWithFormat:@"%@",@"abbbbbbbc"];
    
    NSLog(@"testStr内存地址： %p",testStr); //0xa000000000000611
    
    self.testStr = testStr;
    
    NSLog(@"self.testStr内存地址： %p",self.testStr);//0xa000000000000611   浅拷贝
    
    self.testStrCopy = testStr;
    
    NSLog(@"self.testStrCopy内存地址： %p",self.testStrCopy);//0xa000000000000611  浅拷贝
    
    NSMutableString *testStr1 = [NSMutableString stringWithFormat:@"%@",@"abbbbbbbc"];
    
    NSLog(@"testStr1内存地址： %p",testStr1);  //0x608000078a00  与上面的str1 0x60000007c5c0也不一样，MutableCopy是重新创建了地址
    
    self.testStr = testStr1;
    
    NSLog(@"self.testStr内存地址： %p",self.testStr);//0x608000078a00 strong指向同一个地址
    
    NSLog(@"retain count = %lu\n",CFGetRetainCount((__bridge CFTypeRef)(testStr))); // 打印无符号长整型
    NSLog(@"retain count = %ld\n",CFGetRetainCount((__bridge CFTypeRef)(testStr))); // 打印有符号长整型
    NSLog(@"retain count = %@\n",[testStr valueForKey:@"retainCount"]); // 打印无符号长整型
    
    self.testStrCopy = testStr1;
    NSLog(@"retain count = %lu\n",CFGetRetainCount((__bridge CFTypeRef)(testStr))); // 打印无符号长整型
    NSLog(@"retain count = %ld\n",CFGetRetainCount((__bridge CFTypeRef)(testStr))); // 打印有符号长整型
    NSLog(@"retain count = %@\n",[testStr valueForKey:@"retainCount"]); // 打印无符号长整型
    
    NSLog(@"self.testStrCopy内存地址： %p",self.testStrCopy);//0xa000000000000611 虽然地址变了，但还是指向原来的地址,不超过9个字符成立，位于常量区，超过9个字符地址改变

    [testStr1 appendString:@"b"];
    NSLog(@"testStr1===========内存地址： %p",testStr1);
    
    NSLog(@"self.testStr内存地址： %p",self.testStr);
    NSLog(@"self.testStrCopy内存地址： %p",self.testStrCopy);
    
    NSLog(@"self.testStr=====---------========%@",self.testStr);
    NSLog(@"self.testStrCopy=======--------======%@",self.testStrCopy);
    
    NSMutableString *str11 = [NSMutableString stringWithFormat:@"%@",@"aa"];
    NSLog(@"=======  %p",str11);
    NSLog(@"self.testStr内存地址： %p",_testStr);
    NSLog(@"self.testStrCopy内存地址： %p",_testStrCopy);
    
    self.testStr = str11;
    
    NSLog(@"self.testStr内存地址111111111： %p",_testStr);
    
    
    self.testStrCopy = str11;
    
    NSLog(@"self.testStrCopy内存地址222222222： %p",_testStrCopy);
    NSLog(@"self.testStrCopy内存地址111111111： %p",self.testStrCopy);
    
    NSLog(@"self.testStr=============%@",self.testStr);
    NSLog(@"self.testStrCopy=============%@",self.testStrCopy);
    

    [str11 appendString:@"b"];
    
    NSLog(@"self.testStr=====---------========%@",self.testStr);
    NSLog(@"self.testStrCopy=======--------======%@",self.testStrCopy);
    
    
    
}


@end
