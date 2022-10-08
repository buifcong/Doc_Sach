//
//  ReCode.swift
//  Reavol_copy
//
//  Created by bùi thành công on 25/07/2022.
//

import Foundation
import UIKit
import MBProgressHUD
import SDWebImage

func cornerAndBorder(view:[UIView],corner:CGFloat,border:Bool,borderWith:CGFloat?,borderColor:CGColor?){
    for view in view {
        view.clipsToBounds = true
        view.layer.cornerRadius = corner
        if border == true {
            
            view.layer.borderWidth = borderWith ?? 0
            view.layer.borderColor = borderColor
        }
    }
}

func leftAndRightView(textField:[UITextField], x:CGFloat, y:CGFloat, width:CGFloat, heigh:CGFloat){
    for tf in textField {
        tf.leftView = UIView(frame: CGRect(x: x, y: y, width: width, height: heigh))
        tf.leftViewMode = .always
        tf.rightView = UIView(frame: CGRect(x: x, y: y, width: width, height: heigh))
        tf.rightViewMode = .always
        
    }
    
}
func alertNoActionType(title:String?,message:String?,titleAction:String)->UIAlertController{
    let al = UIAlertController(title: title, message: message, preferredStyle: .alert)
    al.addAction(UIAlertAction(title: titleAction, style: .default))
    return al
}

extension UIViewController {
    func showLoading(text: String?){
        DispatchQueue.main.async {
            let progressHub = MBProgressHUD.showAdded(to: self.view, animated: true)
            progressHub.label.text = text ?? ""
            progressHub.contentColor = .darkGray
        }
    }
    func hiddenLoading(){
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
}

extension UIImageView {
    func loadImage(url: String?, placeholderImage: UIImage? = nil, completed: ((_ image: UIImage?) -> Void)? = nil) {
        if let link = url?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), !link.isEmpty {
            let url = URL(string: link)
            self.sd_setImage(with: url, placeholderImage: placeholderImage, completed: {image, error, _, _ in
                if error != nil {
                    print("loadImage", error?.localizedDescription ?? "")
                }
                completed?(image)
            })
        } else {
            self.image = UIImage(named: "thumbnail")
        }
    }
}
