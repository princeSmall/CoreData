//
//  ViewController.m
//  CoreData
//
//  Created by 李敏 on 2018/4/17.
//  Copyright © 2018年 Tongle. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "User+CoreDataClass.h"
#import "User+CoreDataProperties.h"

@interface ViewController ()
@property (nonatomic , strong)NSManagedObjectContext * managedObjectcontext;
@property (nonatomic , strong)NSFetchRequest * fetchRequest;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self deleteCurrentObject];
    [self inquireCurrentObject];
    [self saveCurrentObject];
    [self updateCurrentObject];
    [self inquireCurrentObject];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark - lazy
- (NSManagedObjectContext *)managedObjectcontext{
    if (_managedObjectcontext == nil) {
        AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        _managedObjectcontext = appDelegate.persistentContainer.viewContext;
    }
    return _managedObjectcontext;
}

/**
 request
 
         创建fecthRequest 获取请求;
     NSFetchRequest * fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"User"];
         用语数据查询的偏移位置;
     fetchRequest.fetchOffset = 0;
         查询的数据总量;
     fetchRequest.fetchLimit = 10;
         获取托管对象上下文的User实体;
     NSEntityDescription * entityDescription = [NSEntityDescription entityForName:@"User" inManagedObjectContext:self.managedObjectcontext];
         设置查询条件;
     fetchRequest.entity = entityDescription;

 @return request
 */
- (NSFetchRequest *)fetchRequest{
    if (_fetchRequest == nil) {
        _fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"User"];
        _fetchRequest.fetchOffset = 0;
        _fetchRequest.fetchLimit = 10;
        _fetchRequest.predicate = nil;
        _fetchRequest.entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:self.managedObjectcontext];
    }
    return _fetchRequest;
}

#pragma mark - delete-update-save-inquire
- (void)deleteCurrentObject{
   
    NSError *error = nil;
    //    发起查询请求并返回查询结果;
    NSArray * result = [self.managedObjectcontext executeFetchRequest:self.fetchRequest error:&error];
    if (error) {
        NSLog(@"删除数据失败--%@",error);
    }else{
        NSLog(@"删除数据成功");
        for (User * user in result) {
            [self.managedObjectcontext deleteObject:user];
            [self.managedObjectcontext save:&error];
        }
        
    }
}
- (void)updateCurrentObject{
    //    设置查询条件;
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"userName = 'tongle'"];
    self.fetchRequest.predicate = predicate;
    NSError *error = nil;
    //    发起查询请求并返回查询结果;
    NSArray * result = [self.managedObjectcontext executeFetchRequest:self.fetchRequest error:&error];
    if (error) {
        NSLog(@"更新数据失败--%@",error);
    }else{
        NSLog(@"更新数据成功");
        for (User * user in result) {
            user.password = @"11111111";
            [self.managedObjectcontext save:&error];
            NSLog(@"%@",user.userName);
            NSLog(@"%@",user.password);
        }
    }
}
- (void)inquireCurrentObject{

    //    设置查询条件;
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"userName = 'tongle'"];
    self.fetchRequest.predicate = predicate;
    NSError *error = nil;
    //    发起查询请求并返回查询结果;
    NSArray * result = [self.managedObjectcontext executeFetchRequest:self.fetchRequest error:&error];
    if (error) {
        NSLog(@"获取数据失败--%@",error);
    }else{
        NSLog(@"获取数据成功");
        for (User * user in result) {
            NSLog(@"%@",user.userName);
            NSLog(@"%@",user.password);
        }
    }
}
- (void)saveCurrentObject{
   
    //    获取Entity对象;
    User * user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.managedObjectcontext];
    user.userName = @"tongle";
    user.password = @"123456";
    NSError *error = nil;
    //    保存;
    [self.managedObjectcontext save:&error];
    if (error) {
        NSLog(@"保存失败--%@",error.userInfo);
    } else{
        NSLog(@"保存成功");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
