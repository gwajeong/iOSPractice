//
//  ViewController.swift
//  scrollViewAutolayout
//
//  Created by soyounglee on 2020/10/12.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToBlogClicked(_ sender: Any) {
        
        guard let url = URL(string: "https://blog.naver.com/sso_0022") else { return }
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func goToGithubClicked(_ sender: Any) {
        guard let url = URL(string: "https://github.com/gwajeong") else { return }
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
    }
    
}

