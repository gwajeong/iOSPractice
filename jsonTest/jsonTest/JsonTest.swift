//
//  JsonTest.swift
//  jsonTest
//
//  Created by soyounglee on 2020/09/21.
//  Copyright © 2020 soyounglee. All rights reserved.
//

import UIKit

let myname = loadData()
private func loadData() -> [Name] {
    let decoder = JSONDecoder()
    if let dataAsset = NSDataAsset.init(name : "our") {
        do {
            let name = try decoder.decode([Name].self, from: dataAsset.data)
            return name
        } catch {
            print(error.localizedDescription)
        }
        
        
    }
    
    return [Name]()
    
}



