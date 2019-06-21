//
//  login_cell.swift
//  guide_login
//
//  Created by HaiPhan on 6/21/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class login_cell: UICollectionViewCell {
    var image_login: UIImageView!
    var txt_email: UITextField!
    var txt_pass: UITextField!
    var login_button: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup_view()
    }
    
    func setup_view(){
        image_login_setup_autolayout()
        txt_email_setup_autolayout()
        txt_pass_setup_autolayout()
        login_button_setup_autolayout()
    }
    
    //setup - login button
    func login_button_setup_autolayout(){
        login_button = UIButton(type: .system)
        login_button.setTitle("login", for: .normal)
        login_button.backgroundColor = UIColor(red: 247/255, green: 154/255, blue: 27/255, alpha: 1)
        addSubview(login_button)
        
        login_button.translatesAutoresizingMaskIntoConstraints = false
        login_button.topAnchor.constraint(equalTo: txt_pass.bottomAnchor, constant: 10).isActive = true
        login_button.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        login_button.widthAnchor.constraint(equalToConstant: 300).isActive = true
        login_button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    //setup - txt pass
    func txt_pass_setup_autolayout(){
        txt_pass = lef_pad_text_field()
        txt_pass.placeholder = "Enter your email"
        txt_pass.font = UIFont.boldSystemFont(ofSize: 16)
        txt_pass.layer.borderColor = UIColor.lightGray.cgColor
        txt_pass.layer.borderWidth = 1
        addSubview(txt_pass)
        
        txt_pass.translatesAutoresizingMaskIntoConstraints = false
        txt_pass.topAnchor.constraint(equalTo: txt_email.bottomAnchor, constant: 10).isActive = true
        txt_pass.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        txt_pass.widthAnchor.constraint(equalToConstant: 300).isActive = true
        txt_pass.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    //setup - txt emai
    func txt_email_setup_autolayout(){
        txt_email = lef_pad_text_field()
        txt_email.placeholder = "Enter your email"
        txt_email.font = UIFont.boldSystemFont(ofSize: 16)
        txt_email.layer.borderColor = UIColor.lightGray.cgColor
        txt_email.layer.borderWidth = 1
        addSubview(txt_email)
        
        txt_email.translatesAutoresizingMaskIntoConstraints = false
        txt_email.topAnchor.constraint(equalTo: image_login.bottomAnchor, constant: 10).isActive = true
        txt_email.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        txt_email.widthAnchor.constraint(equalToConstant: 300).isActive = true
        txt_email.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    //setup - image
    func image_login_setup_autolayout(){
        image_login = UIImageView()
        image_login.image = UIImage(named: "1")
        image_login.contentMode = .scaleAspectFill
        addSubview(image_login)
        
        image_login.translatesAutoresizingMaskIntoConstraints = false
        image_login.centerXAnchor.constraint(equalToSystemSpacingAfter: self.centerXAnchor, multiplier: 0).isActive = true
        image_login.topAnchor.constraint(equalTo: self.topAnchor, constant: 150).isActive = true
        image_login.widthAnchor.constraint(equalToConstant: 200).isActive = true
        image_login.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class lef_pad_text_field: UITextField {
    //place holder sẽ cách trai,phai
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y   , width: bounds.width, height: bounds.height)
    }
    //when input sẽ cách trai,phai
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y   , width: bounds.width, height: bounds.height)
    }
}
