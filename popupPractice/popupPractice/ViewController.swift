//
//  ViewController.swift
//  popupPractice
//
//  Created by soyounglee on 2020/10/07.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var createPopUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func didTapPopUpButton(_ sender: Any) {
        
        //스토리보드 가져오기
        let storyboard = UIStoryboard.init(name:"PopUp", bundle: nil)
        // 스토리보드를 통해 뷰컨트롤러 가져오기
        let alertPopUpVC = storyboard.instantiateViewController(identifier: "AlertPopupVC") as! PopUpViewController
        // 뷰 컨트롤러가 보여지는 스타일
        alertPopUpVC.modalPresentationStyle = .overCurrentContext
        // 뷰 컨트롤러가 사라지는 스타일
        alertPopUpVC.modalTransitionStyle = .crossDissolve
        
        
        
        self.present(alertPopUpVC, animated: true, completion: nil)
    }

}


