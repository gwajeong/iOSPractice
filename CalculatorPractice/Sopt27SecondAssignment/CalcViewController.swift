//
//  CalcViewController.swift
//  Sopt27SecondAssignment
//
//  Created by soyounglee on 2020/10/17.
//

import UIKit

class CalcViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    
    var num1 : String = ""
    var num2 : String = ""
    var intNum1 : Float = 0
    var intNum2 : Float = 0
    var state : Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func numButtonClicked(_ sender: UIButton) {
        
        if state == -1 {
            
            print(sender.tag)
            num1 += "\(String(describing: sender.tag))"
            
            resultLabel.text = num1
            intNum1 = Float(num1)!
            print("intNum1 : \(intNum1)")
        } else {
            num2 += "\(String(describing: sender.tag))"
            
            resultLabel.text = num2
            intNum2 = Float(num2)!
            print("intNum2 : \(intNum2)")
        }
    }
    
    
    @IBAction func calcButtonClicked(_ sender: UIButton) {
        let calc = state
        
        switch calc {
        case 0:
            intNum1 /= intNum2
        case 1:
            intNum1 *= intNum2
        case 2:
            intNum1 += intNum2
        case 3:
            intNum1 -= intNum2
        case 4:
            print("result")
        default:
            print("a")
        }
        num2 = ""
        
        resultLabel.text = intNum1 - Float(Int(intNum1)) > 0 ? String(format: "%.1f", intNum1) : String(Int(intNum1))
        
        
        state = sender.tag
    }
    
    @IBAction func acBtnClicked(_ sender: Any) {
        state = -1
        num1 = ""
        num2 = ""
        intNum1 = 0
        intNum2 = 0
        resultLabel.text = "0"
    }
    

    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
