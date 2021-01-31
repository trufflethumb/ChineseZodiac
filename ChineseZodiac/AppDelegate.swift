//
//  AppDelegate.swift
//  ChineseZodiac
//
//  Created by Kevin on 2017-05-30.
//  Copyright © 2017 Monorail Apps. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var dataManager: PersonDataManager?
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    dataManager = PersonDataManager.shared
    window = UIWindow(frame: UIScreen.main.bounds)
    if #available(iOS 11.0, *) {
      window?.tintColor = UIColor(named: "AccentColor")
    } else {
      window?.tintColor = #colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1)
    }

    let tabBarController = UITabBarController()

    let zodiacTableViewController = MainViewController()
    let zodiacNavigation = UINavigationController(
        rootViewController: zodiacTableViewController
    )
    let tabBarItemImageList = UIImage(named: "Tab Bar Icon 0 Wide")
    zodiacNavigation.tabBarItem = .init(title: "List", image: tabBarItemImageList, tag: 0)

    let matchCollectionViewController = MatchVC()
    let matchNavigation = UINavigationController(
        rootViewController: matchCollectionViewController
    )
    let tabBarItemImageMatch = UIImage(named: "Tab Bar Icon 1 Wide")
    matchNavigation.tabBarItem = .init(title: "Match", image: tabBarItemImageMatch, tag: 0)

    tabBarController.viewControllers = [zodiacNavigation, matchNavigation]
    window?.rootViewController = tabBarController
    window?.makeKeyAndVisible()

    return true
  }
  
  func applicationWillTerminate(_ application: UIApplication) {
    PersistentController.shared.saveContext()
  }
}


