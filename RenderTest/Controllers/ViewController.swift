//
//  ViewController.swift
//  RenderTest
//
//  Created by Thomas Noury on 26/07/2017.
//  Copyright © 2017 Kisio. All rights reserved.
//

import UIKit
import Render

class ViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewController.styleNavigationBar(viewController: self)
        view.backgroundColor = config.colors.tertiary
        title = String(describing: type(of: self)).replacingOccurrences(of: "ViewController", with: "")
    }
    
    static func styleNavigationBar(viewController vc: UIViewController) {
        vc.navigationController?.navigationBar.isTranslucent = true
        vc.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.green]
        vc.navigationController?.navigationBar.barTintColor = UIColor.black
        vc.navigationController?.navigationBar.tintColor = UIColor.green
        vc.navigationController?.navigationBar.shadowImage = UIImage()
    }
}

enum ControllerError : Error {
    case MissingArgument(String)
}
