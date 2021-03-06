//
//  RCGlobalConfig.m
//  JLRubyChina
//
//  Created by ccjoy-jimneylee on 13-12-10.
//  Copyright (c) 2013年 jimneylee. All rights reserved.
//

#import "RCGlobalConfig.h"
#import "RCLoginC.h"

static NSString* myToken = nil;
static NSString* myLoginId = nil;
@implementation RCGlobalConfig

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Global Data

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSString*)myToken
{
    return myToken;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (void)setMyToken:(NSString*)token
{
    myToken = [token copy];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSString*)myLoginId
{
    return myLoginId;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (void)setMyLoginId:(NSString*)loginId
{
    myLoginId = [loginId copy];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Global UI

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MBProgressHUD*)HUDShowMessage:(NSString*)msg addedToView:(UIView*)view
{
    static MBProgressHUD* hud = nil;
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    }
    hud.mode = MBProgressHUDModeText;
    hud.labelText = msg;
    hud.hidden = NO;
    hud.alpha = 1.0f;
    [hud hide:YES afterDelay:1.0f];
    return hud;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (UIBarButtonItem*)createBarButtonItemWithTitle:(NSString*)buttonTitle Target:(id)target action:(SEL)action
{
    UIBarButtonItem* item = nil;
    item = [[UIBarButtonItem alloc] initWithTitle:buttonTitle
                                            style:UIBarButtonItemStylePlain
                                           target:target
                                           action:action];
    return item;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (UIBarButtonItem*)createMenuBarButtonItemWithTarget:(id)target action:(SEL)action
{
    //return [RCGlobalConfig createBarButtonItemWithTitle:@"菜单" Target:target action:action];
    return [[UIBarButtonItem alloc] initWithImage:[UIImage nimbusImageNamed:@"icon_menu.png"]
                                            style:UIBarButtonItemStylePlain
                                           target:target action:action];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (UIBarButtonItem*)createRefreshBarButtonItemWithTarget:(id)target action:(SEL)action
{
    UIBarButtonItem* item = nil;
    item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                         target:target action:action];
    return item;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (void)showLoginControllerFromNavigationController:(UINavigationController*)navigationController
{
    RCLoginC* loginC = [[RCLoginC alloc] initWithStyle:UITableViewStyleGrouped];
    [navigationController pushViewController:loginC animated:YES];
}

@end
