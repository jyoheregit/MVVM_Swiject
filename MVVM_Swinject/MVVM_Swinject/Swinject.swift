//
//  Swinject.swift
//  MVVM_Swinject
//
//  Created by Joe on 19/05/19.
//  Copyright © 2019 Joe. All rights reserved.
//

import Foundation
import UIKit
import Swinject

class Swinject {
    
    static private let container = Container()
    
    static func setup() {
    
        container.register(ViewModel.self) { (resolver) -> ViewModel in
            return ViewModel()
        }
    
        container.register(ViewController.self) { (resolver) -> ViewController in
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = storyboard.instantiateInitialViewController() as? ViewController
            return vc!
        }.initCompleted { (resolver, viewController) in
            viewController.viewModel = resolver.resolve(ViewModel.self)
        }
    }
    
    static func resolve<Service>(_ type : Service.Type) -> Service? {
        return container.resolve(type)
    }
}
