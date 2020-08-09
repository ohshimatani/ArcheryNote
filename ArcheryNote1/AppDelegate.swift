//
//  AppDelegate.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/06/27.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        //---------------------------------------
//        var config = Realm.Configuration()
//        config.migrationBlock = { migration, oldSchemaVersion in
//            // 設定していなければ oldSchemaVersion はゼロがデフォルトです
//            if oldSchemaVersion < 1 {
//                // 保存されている User 全てを列挙
//                migration.enumerateObjects(ofType: PointsOneEndList.className()) { (oldObject, newObject) in
//
//                }
//            }
//        }
//        // 現在のRealmファイルの schemaVersion と、下記で設定した schemaVersion が違うと、マイグレーションが実行される
//        config.schemaVersion = 1
//        Realm.Configuration.defaultConfiguration = config
//
//        //-----------------------------------------
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

