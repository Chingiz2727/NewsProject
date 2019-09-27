//
//  NewsViewModel.swift
//  NewsProject
//
//  Created by Shyngys Kuandyk on 9/27/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
import UIKit
class NewsViewModel : NSObject {
    weak var viewController: UIViewController?
    private var cellid = "cellid"
    
       weak var tableView: UITableView? {
           didSet {
                
               tableView?.delegate = self
               tableView?.dataSource = self
            tableView?.register(NewsTableViewCell.self, forCellReuseIdentifier: cellid)
           }
       }
    
    
    var module : [Article]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView?.reloadData()

            }
        }
    }
    
    
    var numOfRow = 5
    private var count : Int {
        guard let count = module?.count else {
            return 0
        }
        return count
    }
    
    
}



extension NewsViewModel:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numOfRow
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
           if indexPath.row == numOfRow - 1 {
               if count > numOfRow {
                   var index = numOfRow
                   numOfRow = index + 5
                while index <= count {
                    index = index + 1
                }
                if numOfRow > count {
                    self.numOfRow = count
                }
                   
                   self.perform(#selector(loadTable), with: nil, afterDelay: 1.0)
               }
           }
       }
    
    
    @objc func loadTable() {
        self.tableView?.reloadData()
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid) as! NewsTableViewCell
        guard let article = module?[indexPath.row] else {return UITableViewCell()}
        cell.data = article
        cell.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        return cell
    }
    
    
    
    
}


extension NewsViewModel:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var control = NewsDetailViewController()
        guard let art = module?[indexPath.row] else {return}
        control.article = art
        viewController?.navigationController?.pushViewController(control, animated: true)
    }
    
}
