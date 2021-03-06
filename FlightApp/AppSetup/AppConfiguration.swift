//
//  AppSetup.swift
//  FlightApp
//
//  Created by João Palma on 31/07/2020.
//  Copyright © 2020 João Palma. All rights reserved.
//

import UIKit

struct AppConfiguration {
    static func initializeApp() {
        Core.initialize()
        _setViewAppearance()
        Core.startApp()
    }
    
    private static func _setViewAppearance() {
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = UIColor.Theme.mainBlue
            appearance.titleTextAttributes = [.foregroundColor: UIColor.Theme.white]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.Theme.white, .shadow: CustomUIExtensions.textShadow()]
            
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            UIBarButtonItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.Theme.white], for: .normal)
        } else {
            UINavigationBar.appearance().tintColor = UIColor.Theme.white
            UINavigationBar.appearance().barTintColor = UIColor.Theme.white
            UINavigationBar.appearance().isTranslucent = false
        }
    }
    
    static func customNavbarAppearence() -> UINavigationBarAppearance {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.Theme.white]
        navBarAppearance.backgroundColor = UIColor.Theme.mainBlue
        navBarAppearance.shadowColor = .clear
        navBarAppearance.shadowImage = UIImage()
        
        return navBarAppearance
    }
}
