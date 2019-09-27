//
//  NewsDetailView.swift
//  NewsProject
//
//  Created by Shyngys Kuandyk on 9/27/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class NewsDetailView: UIView {
    var module : Article? {
        didSet {
            guard let mod = module else {
                return
            }
            
            title.text = mod.title ?? ""
            descript.text = mod.articleDescription ?? ""
            guard let url = mod.urlToImage else {return}
            img.loadImageWithUrl(URL(string: url)!)
        }
    }
    
    lazy var scrollView  = UIScrollView()
    let title = UILabel()
    let descript = UILabel()
    let img = ImageLoader()
    lazy var stack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [title,descript])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    func addview() {
        self.addSubview(scrollView)
        scrollView.addSubview(img)
        scrollView.addSubview(stack)
        
        scrollView.snp.makeConstraints { (cons) in
            cons.edges.equalToSuperview()
        }
        
        img.snp.makeConstraints { (cons) in
            cons.centerX.equalToSuperview()
            cons.top.equalToSuperview().inset(20)
            cons.width.height.equalTo(150)
        }
        title.font = UIFont.boldSystemFont(ofSize: 16)
        stack.sizeToFit()
        title.numberOfLines = 0
        descript.numberOfLines = 0
        
        stack.snp.makeConstraints { (cons) in
            cons.top.equalTo(img.snp.bottom).offset(20)
            cons.left.right.equalTo(self).inset(20)
            cons.bottom.equalToSuperview().inset(100)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
