//
//  Utility.swift
//  CollectionViewDemo
//
//  Created by Gourishanker on 05/10/23.
//

//
//  Utility.swift
//  PickerViewDemo
//
//  Created by Gourishanker on 04/10/23.
//

import Foundation
import UIKit

extension UIViewController{
    
    func showAlert(title : String?,msg: String?){
        
        let alertVC = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alertVC.addAction(okAction)
        
        present(alertVC, animated: false)
        
    }
    
    func showActionSheet(title: String?,msg:String?)
    {
        let alertVC = UIAlertController(title: title, message: msg
                                        , preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertVC.addAction(okAction)
        present(alertVC,animated: false)
    }
}
