//
//  ViewController.swift
//  NewsProject
//
//  Created by Shyngys Kuandyk on 9/27/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     var tableView = UITableView()
    private let module = NewsViewModel()
    
    var network = NetworkManager()
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addview()
        loadData()
    }
    

    func addview() {
        self.view.addSubview(tableView)
        tableView.frame = self.view.bounds
        module.tableView = tableView
        module.viewController = self
        self.tableView.rowHeight = UITableView.automaticDimension

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = self.view.bounds

    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.view.layoutSubviews()

           super.viewWillTransition(to: size, with: coordinator)
           if UIDevice.current.orientation.isLandscape {
           
               print("Landscape")
              self.tableView.reloadData()

           } else {
            self.tableView.reloadData()

               print("Portrait")
           }
       }
    
    
    func loadData() {
        network.getNews { [weak self] (error, module) in
            self?.module.module = module?.articles
         }
     }

}

