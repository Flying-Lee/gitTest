//
//  ESContactViewController.h
//  ESDemo
//
//  Created by 李鹏飞 on 2017/7/14.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import <RongIMLib/RongIMLib.h>
#import "ESLibrary.h"

@interface ESContactViewController : BaseTableViewController<
UISearchBarDelegate, UISearchControllerDelegate>

@property(nonatomic, strong) UISearchBar *searchFriendsBar;
@property (weak, nonatomic) IBOutlet UITableView *friendsTabelView;

@property(nonatomic, strong) NSDictionary *allFriendSectionDic;

@property(nonatomic, strong) NSArray *seletedUsers;

@property(nonatomic, strong) NSString *titleStr;

@property(nonatomic, strong) void (^selectUserList)(NSArray<RCUserInfo *> *selectedUserList);

@end
