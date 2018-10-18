//
//  User+CoreDataProperties.h
//  CoreData
//
//  Created by 李敏 on 2018/4/17.
//  Copyright © 2018年 iOS. All rights reserved.
//
//

#import "User+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

+ (NSFetchRequest<User *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *password;
@property (nullable, nonatomic, copy) NSString *userName;

@end

NS_ASSUME_NONNULL_END
