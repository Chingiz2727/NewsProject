//
//  NewsDetailViewController.swift
//  NewsProject
//
//  Created by Shyngys Kuandyk on 9/27/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {
    var news : NewsDetailView?
    var article : Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        news?.module = article
    }
    

    override func loadView() {
        super.loadView()
        self.view = NewsDetailView(frame: self.view.bounds)
        news = self.view as? NewsDetailView
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
