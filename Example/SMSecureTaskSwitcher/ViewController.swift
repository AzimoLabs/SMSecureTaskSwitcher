//
//  ViewController.swift
//  SMSecureTaskSwitcher_Example
//
//  Created by Miroslaw Stanek on 25/10/2021.
//  Copyright © 2021 Mateusz Kuźnik. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addHideKeyboardEventHandler()
    }
    
    private func addHideKeyboardEventHandler() {
        let tapGestureRecognizer: UITapGestureRecognizer =
        UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGestureRecognizer.numberOfTouchesRequired = 1
        self.view.addGestureRecognizer(tapGestureRecognizer)
        self.view.isUserInteractionEnabled = true
    }
    
    @objc
    private func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    @IBAction func secure(_ sender: Any) {
        self.view.backgroundColor = UIColor(
            hue: ( CGFloat(arc4random() % 256) / 256.0 ),  //  0.0 to 1.0,
            saturation: ( CGFloat(arc4random() % 128) / 256.0 ) + 0.5,  //  0.5 to 1.0, away from white
            brightness: ( CGFloat(arc4random() % 128) / 256.0 ) + 0.5,  //  0.5 to 1.0, away from black
            alpha: 1
        )
    }
}
