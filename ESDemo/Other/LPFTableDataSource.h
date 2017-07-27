//
//  LPFTableDataSource.h
//  ESDemo
//
//  Created by 李鹏飞 on 2017/7/26.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^CellconfigureBlock)(id cell ,id item);

@interface LPFTableDataSource : NSObject <UITableViewDataSource>

/**
 dataSource Block
 */
@property (nonatomic, copy) CellconfigureBlock cellconfigureBlock;

/**
 数据源
 */
@property (nonatomic, strong) NSArray *dataArray;

/**
 初始化

 @param dataArray 数据源
 @param reuseIdentifier 标识符
 @param configureBlock 回调
 */
- (instancetype)initWithDataArray:(NSArray *)dataArray
              cellReuseIdentifier:(NSString *)reuseIdentifier
               cellConfigureBlock:(CellconfigureBlock)configureBlock;

/**
 得到对应 indexPath 的Model
 */
- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
