//
//  ViewController.swift
//  TextFieldPractice
//
//  Created by soyounglee on 2020/12/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    
    private let maxLength = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(textDidChange(_:)),
                                               name: UITextField.textDidChangeNotification,
                                               object: textField)
    }


    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {return false}
        
        // 중간에 추가되는 텍스트 막기
        if text.count >= maxLength && range.length == 0 && range.location < maxLength {
            return false
        }
        
        return true
    }
    
    @objc private func textDidChange(_ notification: Notification) {
        if let textField = notification.object as? UITextField {
            if let text = textField.text {
                
                if text.count > maxLength {
                    // 8글자 넘어가면 자동으로 키보드 내려감
                    textField.resignFirstResponder()
                }
                
                // 초과되는 텍스트 제거
                if text.count >= maxLength {
                    let index = text.index(text.startIndex, offsetBy: maxLength)
                    let newString = text[text.startIndex..<index]
                    textField.text = String(newString)
                }
                
                else if text.count < 2 {
                    warningLabel.text = "2글자 이상 8글자 이하로 입력해주세요"
                    warningLabel.textColor = .red
                    
                }
                else {
                    warningLabel.text = "사용 가능한 닉네임입니다."
                    warningLabel.textColor = .green

                }
            }
        }
    }
    
}

