//
//  myTableViewCell.swift
//  dynamic_table_view
//
//  Created by soyounglee on 2020/10/04.
//

import UIKit

class MyTableViewCell : UITableViewCell {
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userContentLabel: UILabel!
    
    // 셀이 렌더링(그릴 때) 될 때
    override func awakeFromNib() {
        super.awakeFromNib()
        
        print("MyTableViewCell - awakeFromNib() called")
        userProfileImage.layer.cornerRadius = userProfileImage.frame.height / 2
    }
}
