//
//  ViewController.swift
//  Placeholder
//
//  Created by Lucas Clahar on 9/11/20.
//  Copyright © 2020 Tsahai Clahar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var networkManager = NetworkManager()
    var refresher: UIRefreshControl!
    var data: [Data] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // create refresher and add it to subview
        refresher = UIRefreshControl()
        //refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refresher.addTarget(self, action: #selector(ViewController.refreshTableView), for: UIControl.Event.valueChanged)
        tableView.addSubview(refresher)
        
        
        networkManager.fetchData()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.data = self.networkManager.fetchedData
            self.tableView.reloadData()
            
        }
    }
   
 
    //  ths function clears tableview, then fetch data to reload tableview
    @objc func refreshTableView() {
        refresher.endRefreshing()
        data.removeAll()
        tableView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.data = self.networkManager.fetchedData
            self.tableView.reloadData()
            
        }
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as! DataCell
        
        cell.setInfo(data: data[indexPath.row])
        return cell
    }
    
    
}

