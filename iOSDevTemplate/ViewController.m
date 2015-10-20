//
//  ViewController.m
//  iOSDevTemplate
//
//  Created by zhucuirong on 15/7/5.
//  Copyright (c) 2015年 SINOFAKE SINEP. All rights reserved.
//

#import "ViewController.h"
#import "AppUtils.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"\n appIcon:%@, \n appName:%@, \n bundleName:%@, \n appVersion:%@, \n buildVersion:%@, \n deviceName:%@, \n deviceSize:%@, \n deviceVersion:%@", [AppUtils appIcon], [AppUtils appName], [AppUtils bundleName], [AppUtils appVersion], [AppUtils buildVersion], [AppUtils deviceName], DeviceSizeNames[[AppUtils deviceSize]], DeviceVersionNames[[AppUtils deviceVersion]]);
    
    NSLog(@"[UIDevice currentDevice]: \n name:%@, \n model:%@, \n localizedModel:%@, \n systemName:%@, \n systemVersion:%@", [[UIDevice currentDevice] name], [[UIDevice currentDevice] model], [[UIDevice currentDevice] localizedModel], [[UIDevice currentDevice] systemName], [[UIDevice currentDevice] systemVersion]);
    /**
     appIcon:(null),
     appName:(null),
     bundleName:iOSDevTemplate,
     appVersion:1.0,
     buildVersion:1,
     deviceName:iPhone7,2,
     deviceSize:4.7 inch,
     deviceVersion:iPhone 6
     -------
     <ViewController.m : 23> -[ViewController viewDidLoad]
     2015-10-20 23:08:27.885 iOSDevTemplate[6514:2344895] [UIDevice currentDevice]:
     name:荣荣的iPhone,
     model:iPhone,
     localizedModel:iPhone,
     systemName:iPhone OS,
     systemVersion:9.0.2,
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
