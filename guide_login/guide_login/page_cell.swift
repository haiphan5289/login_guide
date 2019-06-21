//
//  page_cell.swift
//  guide_login
//
//  Created by HaiPhan on 6/20/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class page_cell: UICollectionViewCell {

    var page: page! {
        didSet {
            image_show.image = UIImage(named: page.image)
//            text_view_show.text = page.title + "\n\n\n" + page.des
            
            //setup font cho title &
            let color = UIColor(white: 0.2, alpha: 1)
            let attribute = NSMutableAttributedString(string: page.title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium), NSAttributedString.Key.foregroundColor: color])
            attribute.append(NSMutableAttributedString(string: "\n\n\n" + page.des, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: color ]))
            
            //setup font ở giữa
            let parastyle = NSMutableParagraphStyle()
            parastyle.alignment = .center
            let lenght = attribute.string.count
            attribute.addAttribute(NSAttributedString.Key.paragraphStyle, value: parastyle, range: NSRange(location: 0, length: lenght))
            
            text_view_show.attributedText = attribute
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
//        image_show_autolayout()
        setup_view()

    }
    
    func setup_view(){
        text_view_show_autolayout()
        image_show_autolayout()

        

    }
    
    //add textivew
    let text_view_show : UITextView = {
        let t = UITextView()
        t.text = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
        t.isEditable = false
        t.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        return t
    }()
    func text_view_show_autolayout(){
        addSubview(text_view_show)
        text_view_show.translatesAutoresizingMaskIntoConstraints = false
        
        text_view_show.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        text_view_show.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
//        text_view_show.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        text_view_show.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12).isActive = true
        text_view_show.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/3).isActive = true
//        text_view_show.topAnchor.constraint(equalTo: image_show.bottomAnchor, constant: 0).isActive = true
    }
    
    //add image
    let image_show: UIImageView = {
       let img = UIImageView()
        img.image = UIImage(named: "1")
        img.contentMode = UIImageView.ContentMode.scaleToFill
        img.clipsToBounds = true
        img.layer.borderColor = UIColor.darkGray.cgColor
        img.layer.borderWidth = 1
        return img
    }()
    
    //autolayout image
    func image_show_autolayout(){
        addSubview(image_show)
        image_show.translatesAutoresizingMaskIntoConstraints = false
        
        image_show.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        image_show.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        image_show.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        image_show.bottomAnchor.constraint(equalTo: text_view_show.topAnchor, constant: 0).isActive = true
//        image_show.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2/3).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
