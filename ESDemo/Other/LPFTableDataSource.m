//
//  LPFTableDataSource.m
//  ESDemo
//
//  Created by 李鹏飞 on 2017/7/26.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "LPFTableDataSource.h"

@interface LPFTableDataSource()

/**
 标识符
 */
@property (nonatomic, copy) NSString *cellReuseIdentifier;

@end

@implementation LPFTableDataSource

- (instancetype)initWithDataArray:(NSArray *)dataArray cellReuseIdentifier:(NSString *)reuseIdentifier cellConfigureBlock:(CellconfigureBlock)configureBlock {
    
    if (!self) return nil;
    _dataArray = dataArray;
    _cellReuseIdentifier = reuseIdentifier;
    _cellconfigureBlock = [configureBlock copy];
    
    return self;
    
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.dataArray == nil || self.dataArray.count == 0) return nil;
    return self.dataArray[indexPath.row];
}

#pragma mark - UITableView DataSource
- (NSInteger) tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id cell = [tableView dequeueReusableCellWithIdentifier:self.cellReuseIdentifier forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    self.cellconfigureBlock(cell, item);
    
    return cell;
}

@end
