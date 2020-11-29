//
//  ViewController.swift
//  Server_Project
//
//  Created by soyounglee on 2020/11/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        API.shared.getinfo { (response) in
            switch  response {
            
            case .success(let res):
                print(res)
            case .requestErr(let res):
                print(res)
            case .pathErr:
                print(123)
            case .serverErr:
                print(222)
            case .networkFail:
                print(333)
            }
        }
    }

    

}

