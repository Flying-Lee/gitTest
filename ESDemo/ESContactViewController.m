//
//  ESContactViewController.m
//  ESDemo
//
//  Created by 李鹏飞 on 2017/7/14.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "ESContactViewController.h"
#import "RCDContactTableViewCell.h"
#import "ESUserInfo.h"
#import "RCDUtilities.h"
#import "BaseViewController.h"
#import "ESLibrary.h"
#import "LPFTableDataSource.h"
#import <RongIMKit/RongIMKit.h>

#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ESContactViewController ()

@property(strong, nonatomic) NSMutableArray *matchFriendList;
@property(strong, nonatomic) NSArray *defaultCellsTitle;
@property(strong, nonatomic) NSArray *defaultCellsPortrait;
@property(nonatomic, assign) BOOL hasSyncFriendList;
@property(nonatomic, assign) BOOL isBeginSearch;
@property(nonatomic, strong) NSMutableDictionary *resultDic;
/**
 <#Property Name#>
 */
@property (nonatomic, strong) LPFTableDataSource *dataSource;

@end

@implementation ESContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
}

- (void)setUp {
    // 数据源
    self.defaultCellsTitle = @[@"新朋友", @"群组"];
    self.defaultCellsPortrait = @[@"newFriend", @"defaultGroup"];
    
    self.friendsTabelView.dataSource = self;
    self.friendsTabelView.delegate = self;
    
    self.baseNavigationController.title = @"联系人";
}

/**
 返回
 @author 李鹏飞
 */
- (void)btnLeftOnClick {
    [self.baseNavigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rows = 0;
    if (section == 0) {
        if (_isBeginSearch == YES) {
            rows = 0;
        }
        else
        {
            rows = 2;
        }
    } else {
        NSString *letter = self.resultDic[@"allKeys"][section -1];
        rows = [self.allFriendSectionDic[letter] count];
    }
    return rows;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.resultDic[@"allKeys"] count] + 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 21.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1f;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    view.frame = CGRectMake(0, 0, self.view.frame.size.width, 22);
    view.backgroundColor = [UIColor clearColor];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectZero];
    title.frame = CGRectMake(13, 3, 15, 15);
    title.font = [UIFont systemFontOfSize:15.f];
    title.textColor = HEXCOLOR(0x999999);
    
    [view addSubview:title];
    
    if (section == 0) {
        title.text = nil;
    } else {
        title.text = self.resultDic[@"allKeys"][section - 1];
    }
    
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSString *isDisplayID = [[NSUserDefaults standardUserDefaults] objectForKey:@"isDisplayID"];
    static NSString *reusableCellWithIdentifier = @"RCDContactTableViewCell";
    RCDContactTableViewCell *cell = [self.friendsTabelView
                                     dequeueReusableCellWithIdentifier:reusableCellWithIdentifier];
    if (cell == nil) {
        cell = [[RCDContactTableViewCell alloc] init];
    }
    
    if (indexPath.section == 0 && indexPath.row < 2) {
        cell.nicknameLabel.text = _defaultCellsTitle[indexPath.row];
        [cell.portraitView
         setImage:[UIImage
                   imageNamed:[NSString
                               stringWithFormat:
                               @"%@",
                               [_defaultCellsPortrait
                                objectAtIndex:indexPath.row]]]];
    }
    if ([RCIM sharedRCIM].globalConversationAvatarStyle == RC_USER_AVATAR_CYCLE &&
        [RCIM sharedRCIM].globalMessageAvatarStyle == RC_USER_AVATAR_CYCLE) {
        cell.portraitView.layer.masksToBounds = YES;
        cell.portraitView.layer.cornerRadius = 20.f;
    } else {
        cell.portraitView.layer.masksToBounds = YES;
        cell.portraitView.layer.cornerRadius = 5.f;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    cell.portraitView.contentMode = UIViewContentModeScaleAspectFill;
    cell.nicknameLabel.font = [UIFont systemFontOfSize:15.f];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55.5;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.resultDic[@"allKeys"];
}

- (void)sortAndRefreshWithList:(NSArray *)friendList {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        self.resultDic = [RCDUtilities sortedArrayWithPinYinDic:friendList];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.allFriendSectionDic = self.resultDic[@"infoDic"];
            [self.friendsTabelView reloadData];
        });
    });
}

// git remote rm origin 移除远程库

//- (void)tableView:(UITableView *)tableView
//didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    ESUserInfo *user = nil;
//    if (indexPath.section == 0) {
//        switch (indexPath.row) {
//            case 0: {
//                RCDAddressBookViewController *addressBookVC = [RCDAddressBookViewController addressBookViewController];
//                [self.navigationController pushViewController:addressBookVC animated:YES];
//                return;
//            } break;
//                
//            case 1: {
//                RCDGroupViewController *groupVC = [[RCDGroupViewController alloc]init];
//                [self.navigationController pushViewController:groupVC animated:YES];
//                return;
//                
//            } break;
//                
//            case 2: {
//                RCDPublicServiceListViewController *publicServiceVC =
//                [[RCDPublicServiceListViewController alloc] init];
//                [self.navigationController pushViewController:publicServiceVC
//                                                     animated:YES];
//                return;
//                
//            } break;
//                
//            case 3: {
//                RCDPersonDetailViewController *detailViewController =
//                [[RCDPersonDetailViewController alloc]init];
//                [self.navigationController pushViewController:detailViewController
//                                                     animated:YES];
//                detailViewController.userId = [RCIM sharedRCIM].currentUserInfo.userId;
//                return;
//            }
//                
//            default:
//                break;
//        }
//    }
//    NSString *letter = self.resultDic[@"allKeys"][indexPath.section -1];
//    NSArray *sectionUserInfoList = self.allFriendSectionDic[letter];
//    user = sectionUserInfoList[indexPath.row];
//    if (user == nil) {
//        return;
//    }
//    RCUserInfo *userInfo = [RCUserInfo new];
//    userInfo.userId = user.userId;
//    userInfo.portraitUri = user.portraitUri;
//    userInfo.name = user.name;
//    
//    RCDPersonDetailViewController *detailViewController = [[RCDPersonDetailViewController alloc]init];
//    detailViewController.userId = user.userId;
//    [self.navigationController pushViewController:detailViewController
//                                         animated:YES];
//}

@end
