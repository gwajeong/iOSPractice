//
//  PopUpViewController.swift
//  popupPractice
//
//  Created by soyounglee on 2020/10/07.
//

import UIKit

class PopUpViewController: UIViewController {
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var bgBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func didTapdisMissBtn(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
