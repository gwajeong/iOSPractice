//
//  FourthViewController.swift
//  presentPractice
//
//  Created by soyounglee on 2020/10/17.
//

import UIKit

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func fourBtnClicked(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
        // 주황색 화면으로 돌아감.
    }
}
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

