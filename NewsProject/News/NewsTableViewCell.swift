//
//  NewsTableViewCell.swift
//  NewsProject
//
//  Created by Shyngys Kuandyk on 9/27/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import SnapKit

class NewsTableViewCell: UITableViewCell {
    let title = UILabel()
    let descript = UILabel()
    let img = ImageLoader()
    lazy var stack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [title,descript])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 6
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    var data : Article? {
    willSet {
        guard let art = data else {return}
        title.text = art.title ?? ""
        descript.text = art.articleDescription ?? ""
        guard let url = art.urlToImage else {return}
        img.loadImageWithUrl(URL(string: url)!)
    }
        
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
        descript.text = nil
        img.image = nil
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addview() {
        self.addSubview(stack)
        self.addSubview(img)
        img.snp.makeConstraints { (cons) in
            cons.right.top.equalToSuperview().inset(10)
            cons.width.height.equalTo(100)
        }
        stack.snp.makeConstraints { (cons) in
            cons.left.top.bottom.equalToSuperview().inset(10)
            cons.right.equalTo(img.snp.left).offset(-20)
        }
        self.backgroundColor = .white
        stack.sizeToFit()
        stack.layoutIfNeeded()
        title.font = UIFont.boldSystemFont(ofSize: 16)
        descript.numberOfLines = 3
        title.numberOfLines = 0
    }
   
    

}
