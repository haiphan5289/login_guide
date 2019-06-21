//
//  ViewController.swift
//  guide_login
//
//  Created by HaiPhan on 6/20/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //đổi sang biể lazy var thì mơi khỏi tạo delegate, datasource: let >> lazy var
    lazy var collect: UICollectionView = {
        //khơi tạo layout thì collective mới hoạt động
        let layout = UICollectionViewFlowLayout()
        //sang chế đô horizontal
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        //khoảng cách giữ cách cell = 0
        layout.minimumLineSpacing = 0
        let v = UICollectionView(frame: .zero, collectionViewLayout: layout)
        v.backgroundColor = UIColor.white
        v.dataSource = self
        v.delegate = self
        //hiển thị kiểu page
        v.isPagingEnabled = true
        
        return v
    }()
    
    //add UIPageControl
    var page_control: UIPageControl!
    //add button next
    var next_button: UIButton!
    //add button skip
    var skip_button: UIButton!
    let CellWithReuseIdentifier = "cell"
    //thêm 1 cell cho login
    //phải đăng ky cell này trong collection
    let login = "login"
    var array_page: [page] = [page]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(collect)
        
        collect.register(page_cell.self, forCellWithReuseIdentifier: CellWithReuseIdentifier)
        collect.register(login_cell.self, forCellWithReuseIdentifier: login)
        
        collect.translatesAutoresizingMaskIntoConstraints = false
        collect.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        collect.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        collect.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        collect.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        
        create_array_page()
        page_control_setup_autolayout()
        next_button_setup_autolayout()
        skip_button_setup_autolayout()
        handle_keyboard_appears()
    }
    
    func create_array_page(){
        let page1 = page(image: "1", title: "AAAAAAAAAAAA", des: "AAAAAAAAAAAA22222222222222222222222222222222222222222222222222222222222222")
        let page2 = page(image: "2", title: "22222222222222222", des: "22222222222222222222222222222222222222222222222222222222222222")
        let page3 = page(image: "3", title: "33333333333333", des: "3333333333333333")
        let page4 = page(image: "4", title: "444444444444444", des: "44444444444444")
        self.array_page.append(page1)
        self.array_page.append(page2)
        self.array_page.append(page3)
        self.array_page.append(page4)
    }
    var skip_top: NSLayoutConstraint!
    //setup & autolayout button skip
    func skip_button_setup_autolayout(){
        skip_button = UIButton(type: .system)
        skip_button.setTitle("Skip", for: .normal)
        skip_button.addTarget(self, action: #selector(skip_page), for: .touchUpInside)
        self.view.addSubview(skip_button)
        
        skip_button.translatesAutoresizingMaskIntoConstraints = false
        skip_top = skip_button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10)
        skip_top.isActive = true
        skip_button.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 8).isActive = true
        skip_button.widthAnchor.constraint(equalToConstant: 60).isActive = true
        skip_button.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    //nhảy otiws page cuối cừng
    @objc func skip_page(){
        //check nếu là page kế cuối
        //page hiện tại là page kế cuối
        page_control.currentPage = self.array_page.count - 1
        if page_control.currentPage == self.array_page.count - 1 {
            page_bottom.constant = 40
            skip_top.constant = -40
            next_top.constant = -40
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        let indexPath = IndexPath(item: self.array_page.count, section: 0)
        self.collect.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    var next_top: NSLayoutConstraint!
    //setup & autolayout button next
    func next_button_setup_autolayout(){
        next_button = UIButton(type: .system)
        next_button.setTitle("Next", for: .normal)
        next_button.addTarget(self, action: #selector(next_page), for: .touchUpInside)
        self.view.addSubview(next_button)
        
        next_button.translatesAutoresizingMaskIntoConstraints = false
        next_top = next_button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10)
        next_top.isActive = true
        next_button.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -8).isActive = true
        next_button.widthAnchor.constraint(equalToConstant: 60).isActive = true
        next_button.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    @objc func next_page(){
        //Nếu là page cuối thì không làm gì cả
        if page_control.currentPage == self.array_page.count {
            return
        }
        
        //check nếu là page kế cuối
        if page_control.currentPage == self.array_page.count - 1 {
            page_bottom.constant = 40
            skip_top.constant = -40
            next_top.constant = -40
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        
        let indexPath = IndexPath(item: page_control.currentPage + 1, section: 0)
        self.collect.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        page_control.currentPage += 1
    }
    var page_bottom: NSLayoutConstraint!
    //setup & autolayout page control
    func page_control_setup_autolayout(){
        page_control = UIPageControl()
        //        page_control.backgroundColor = UIColor.lightGray
        page_control.pageIndicatorTintColor = .lightGray
        page_control.currentPageIndicatorTintColor = UIColor(red: 247/255, green: 154/255, blue: 27/255, alpha: 1)
        page_control.numberOfPages = array_page.count + 1
        self.view.addSubview(page_control)
        
        page_control.translatesAutoresizingMaskIntoConstraints = false
        page_control.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        page_bottom = page_control.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
        page_bottom.isActive = true
        page_control.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        page_control.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func handle_keyboard_appears(){
        NotificationCenter.default.addObserver(self, selector: #selector(handle_will_show), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handle_hide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func handle_will_show(notification: Notification){
        if let key_board_size = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue{
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y = -50
            }
        }
    }
    @objc func handle_hide(notification: Notification){
        if let key_board_size = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue{
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
        }
    }
}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array_page.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //Nếu thứ tự item = count thì sẽ có thêm cell, nếu không bị craash app
        if indexPath.item == array_page.count {
            let cell = collect.dequeueReusableCell(withReuseIdentifier: login, for: indexPath) as! login_cell
            return cell
        }
        
        let cell = collect.dequeueReusableCell(withReuseIdentifier: CellWithReuseIdentifier, for: indexPath) as! page_cell
        cell.page = self.array_page[indexPath.row]
        return cell
    }
    //tắt bàn phím khi
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        //Hiển thị page curent
        var page_number = targetContentOffset.pointee.x / self.view.frame.width
        page_control.currentPage = Int(page_number)
        //Check view hiển thị khi cell là cuối cùng
        if page_number == CGFloat(array_page.count) {
            page_bottom.constant = 40
            skip_top.constant = -40
            next_top.constant = -40
        } else {
            page_bottom.constant = 0
            skip_top.constant = 10
            next_top.constant = 10
        }
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height)
    }
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        //autolayout cho landscape
        self.collect.collectionViewLayout.invalidateLayout()
        let indexpath = IndexPath(item: page_control.currentPage, section: 0)
        DispatchQueue.main.async {
            //scroll full màn hình cho page hiện tại
            self.collect.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
        }
        
    }
    
}


