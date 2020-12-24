//
//  ViewController.swift
//  MultipleAppIconsPractice
//
//  Created by soyounglee on 2020/12/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapAppIcon(_ sender: UIButton) {
        
        if sender.tag == 1 {
            UIApplication.shared.setAlternateIconName("christmas") { error in
                guard error == nil else {
                    print("Something went worng")
                    return
                }
                print("icon updated")
            }
        }
        else if sender.tag == 0 {
            UIApplication.shared.setAlternateIconName(nil) { error in
                guard error == nil else {
                    print("Something went worng")
                    return
                }
                print("icon updated")
            }
        }
        
    }
    
}

