//
//  ViewController.swift
//  SwiftCoreData
//
//  Created by 李敏 on 2018/4/17.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.inquireCoreData()
        self.updateCoreData()
        self.updateCoreData()
        self.deleteCoreData()
        self.updateCoreData()
        self.saveCoreData()
        self.inquireCoreData()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func saveCoreData() -> Void {
        let appDelegate:AppDelegate = UIApplication.shared.delegate as!AppDelegate
        let managed = appDelegate.persistentContainer.viewContext
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Entity", into: managed)as!Entity
        newUser.userName = "iOS"
        newUser.password = "123456"
        
        do {
            try managed.save()
            print("保存成功")
        } catch  {
            print("保存失败")
        }
    }
    func deleteCoreData() -> Void {
        let appDelegate:AppDelegate = UIApplication.shared.delegate as!AppDelegate
        let managed = appDelegate.persistentContainer.viewContext
        let entity:NSEntityDescription =  NSEntityDescription.entity(forEntityName: "Entity", in: managed)!
        let request = NSFetchRequest<Entity>(entityName: "Entity")
        request.fetchOffset = 0
        request.fetchLimit = 10
        request.entity = entity;
        
        let predicate = NSPredicate(format: "userName = 'iOS'")
        request.predicate = predicate
        do {
            print("删除成功")
            let results:[AnyObject]? = try managed.fetch(request)
            for user:Entity in results as![Entity] {
                managed.delete(user)
            }
        } catch  {
            print("删除失败")
        }
    }
    func updateCoreData() -> Void {
        let appDelegate:AppDelegate = UIApplication.shared.delegate as!AppDelegate
        let managed = appDelegate.persistentContainer.viewContext
        let entity:NSEntityDescription =  NSEntityDescription.entity(forEntityName: "Entity", in: managed)!
        let request = NSFetchRequest<Entity>(entityName: "Entity")
        request.fetchOffset = 0
        request.fetchLimit = 10
        request.entity = entity;
        
        let predicate = NSPredicate(format: "userName = 'iOS'")
        request.predicate = predicate
        do {
            print("更新成功")
            let results:[AnyObject]? = try managed.fetch(request)
            for user:Entity in results as![Entity] {
                user.password = "1111111"
                try managed.save()
            }
        } catch  {
            print("更新失败")
        }
    }
    func inquireCoreData() -> Void {
        let appDelegate:AppDelegate = UIApplication.shared.delegate as!AppDelegate
        let managed = appDelegate.persistentContainer.viewContext
        let entity:NSEntityDescription =  NSEntityDescription.entity(forEntityName: "Entity", in: managed)!
        let request = NSFetchRequest<Entity>(entityName: "Entity")
        request.fetchOffset = 0
        request.fetchLimit = 10
        request.entity = entity;
        
        let predicate = NSPredicate(format: "userName = 'iOS'")
        request.predicate = predicate
        do {
            print("查询成功")
            let results:[AnyObject]? = try managed.fetch(request)
            for user:Entity in results as![Entity] {
                print("userName = \(String(describing: user.userName))")
                print("userName = \(String(describing: user.password))")
            }
        } catch  {
            print("查询失败")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

