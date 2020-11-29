//
//  ViewController.swift
//  Keyboard_Practice
//
//  Created by soyounglee on 2020/11/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //키보드가 나타날 때 keyboardWillAppear 실행
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(_:)), name: UIResponder.keyboardWillShowNotification , object: nil)
        //키보드가 사라질 때 keyboardWillDisappear 실행
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear(_:)), name: UIResponder.keyboardWillHideNotification , object: nil)
        // Do any additional setup after loading the view.
    }


    // 키보드 올라가면 view가 같이 올라간다.
    @objc func keyboardWillAppear(_ sender: NotificationCenter){
            self.view.frame.origin.y -= 150
        }
    
    // 키보드 내려가면 view가 같이 내려간다.
    @objc func keyboardWillDisappear(_ sender: NotificationCenter){
            self.view.frame.origin.y += 150
        }
    
    //텍스트 필드 외부를 터치하면 텍스트필드 포커스가 사라지면서 키보드가 내려간다.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.myTF.resignFirstResponder()
    }
    
}

