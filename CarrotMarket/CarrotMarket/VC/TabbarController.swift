//
//  TabbarController.swift
//  CarrotMarket
//
//  Created by 고두영 on 2022/12/14.
//

import UIKit
import Then

class CarrotTabbar: UITabBar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class TabbarController: UITabBarController {
    
    var defaultIndex = 0 {
        didSet {
            self.selectedIndex = defaultIndex
        }
    }
    
    private let carrotTabbar = CarrotTabbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.selectedIndex = defaultIndex
        self.setValue(carrotTabbar, forKey: "tabBar")
        object_setClass(self.tabBar, CarrotTabbar.self)
        self.tabBar.itemPositioning = .centered
    }
}

extension TabbarController : UITabBarControllerDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width:self.tabBar.frame.size.width, height: 1))
        lineView.backgroundColor = .linegray2
        self.tabBar.addSubview(lineView)
        
        let HomeViewController = ViewController()
        let HomeNavigationController =  UINavigationController(rootViewController: HomeViewController)
        HomeNavigationController.navigationBar.isHidden = true
        HomeNavigationController.tabBarItem.title = "홈"
        
        let chatViewController = FakeViewController()
        let chatNavigationController = UINavigationController(rootViewController: chatViewController)
        chatNavigationController.navigationBar.isHidden = true
        chatNavigationController.tabBarItem.title = "동네생활"
        
        let sharpViewController = FakeViewController()
        let sharpNavigationController = UINavigationController(rootViewController: sharpViewController)
        sharpNavigationController.navigationBar.isHidden = true
        sharpNavigationController.tabBarItem.title = "내근처"
        
        let shopViewController = FakeViewController()
        let shopNavigationController = UINavigationController(rootViewController: shopViewController)
        shopNavigationController.navigationBar.isHidden = true
        shopNavigationController.tabBarItem.title = "채팅"
        
        let moreViewController = FakeViewController()
        let moreNavigationController = UINavigationController(rootViewController: moreViewController)
        moreNavigationController.navigationBar.isHidden = true
        moreNavigationController.tabBarItem.title = "나의당근"
        
        let viewControllers = [
            HomeNavigationController,
            chatNavigationController,
            sharpNavigationController,
            shopNavigationController,
            moreNavigationController
        ]
        
        self.setViewControllers(viewControllers, animated: true)
        
        let tabBar: UITabBar = self.tabBar
        tabBar.backgroundColor = UIColor.white
        tabBar.barStyle = UIBarStyle.default
        tabBar.barTintColor = UIColor.white
        
        
        let imageNames = [
            "ios_icon_home_unselected",
            "ios_icon_town_unselected",
            "ios_icon_myplace_unselected",
            "ios_icon_chat_unselected",
            "ios_icon_my_unselected"
        ]
        
        let imageSelectedNames = [
            "and_icon_home_selected",
            "ios_icon_town_selected",
            "ios_icon_myplace_selected",
            "ios_icon_chat_selected",
            "ios_icon_my_selected"
        ]
        
        
        for (index, value) in (tabBar.items?.enumerated())! {
            let tabBarItem: UITabBarItem = value as UITabBarItem
            
            tabBarItem.image = UIImage(named: imageNames[index])?.withRenderingMode(.alwaysOriginal)
            tabBarItem.selectedImage = UIImage(named: imageSelectedNames[index])?.withRenderingMode(.alwaysOriginal)
            tabBarItem.accessibilityIdentifier = imageNames[index]
        }
    }
}
