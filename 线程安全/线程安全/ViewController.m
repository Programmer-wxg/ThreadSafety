//
//  ViewController.m
//  线程安全
//
//  Created by xhkj on 2018/8/16.
//  Copyright © 2018年 WXG. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (atomic,strong) NSString *theard_Str;

@property (nonatomic,strong) NSString *theard_Str2;

@property (strong) NSString *theard_Str3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.theard_Str = @"哈哈";
//
//    self.theard_Str2 = @"哈哈2";
//
//    self.theard_Str3 = @"嘻嘻";
//
//    NSLog(@"%@",self.theard_Str);
//
//    NSLog(@"%@",self.theard_Str2);
//
//    NSLog(@"%@",self.theard_Str3);
//
//    self.theard_Str = @"hah";
//
//    NSLog(@"%@",self.theard_Str);
    
    __weak ViewController *weakSelf = self;
    
    dispatch_queue_t queue = dispatch_queue_create("SOS", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        weakSelf.theard_Str = @"haha3";
        //weakSelf.theard_Str2 = @"哈哈3";
        weakSelf.theard_Str3 = @"嘻嘻3";
        NSLog(@"weakSelf.theard_Str == %@",weakSelf.theard_Str);
        //NSLog(@"%@",weakSelf.theard_Str2);
        NSLog(@"weakSelf.theard_Str3 = %@",weakSelf.theard_Str3);
    });
    dispatch_async(queue, ^{
        weakSelf.theard_Str = @"haha4";
        //weakSelf.theard_Str2 = @"哈哈4";
        weakSelf.theard_Str3 = @"嘻嘻4";
        NSLog(@"weakSelf.theard_Str == %@",weakSelf.theard_Str);
        //NSLog(@"%@",weakSelf.theard_Str2);
        NSLog(@"weakSelf.theard_Str3 = %@",weakSelf.theard_Str3);
    });
//    dispatch_async(queue, ^{
//        weakSelf.theard_Str = @"haha5";
//        weakSelf.theard_Str2 = @"哈哈5";
//        weakSelf.theard_Str3 = @"嘻嘻5";
//        NSLog(@"weakSelf.theard_Str == %@",weakSelf.theard_Str);
//        NSLog(@"%@",weakSelf.theard_Str2);
//        NSLog(@"%@",weakSelf.theard_Str3);
//    });
//    dispatch_async(queue, ^{
//        weakSelf.theard_Str = @"haha6";
//        weakSelf.theard_Str2 = @"哈哈6";
//        weakSelf.theard_Str3 = @"嘻嘻6";
//        NSLog(@"weakSelf.theard_Str == %@",weakSelf.theard_Str);
//        NSLog(@"%@",weakSelf.theard_Str2);
//        NSLog(@"%@",weakSelf.theard_Str3);
//    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
