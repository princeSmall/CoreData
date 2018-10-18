//
//  User+CoreDataProperties.m
//  CoreData
//
//  Created by 李敏 on 2018/4/17.
//  Copyright © 2018年 iOS. All rights reserved.
//
//

#import "User+CoreDataProperties.h"

@implementation User (CoreDataProperties)

+ (NSFetchRequest<User *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"User"];
}

@dynamic password;
@dynamic userName;

@end
