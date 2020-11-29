//
//  ViewController.swift
//  Lottie_Practice
//
//  Created by soyounglee on 2020/11/29.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    let animationView = AnimationView(name: "38739-trackuni") // AnimationView(name: "lottie json 파일 이름")으로 애니메이션 뷰 생성
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView.frame = CGRect(x: 0, y: 0, width: 300, height: 300) // 애니메이션뷰의 크기 설정
        animationView.center = self.view.center // 애니메이션뷰의 위치설정
        animationView.contentMode = .scaleAspectFill // 애니메이션뷰의 콘텐트모드 설정
            
        view.addSubview(animationView) // 애니메이션뷰를 메인뷰에 추가
        
       
    }

    @IBAction func lottieClicked(_ sender: Any) {
    
        
        animationView.play() // 애미메이션뷰 실행
        
    }
    
}

