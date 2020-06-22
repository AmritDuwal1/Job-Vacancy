//
//  JobListViewController.swift
//  Job
//
//  Created by Mac on 6/22/20.
//Copyright © 2020 Amrit Duwal. All rights reserved.
//

import UIKit

class JobListViewController: UIViewController {
    
    // MARK: Properties
    var presenter: JobListModuleInterface?
    var jobList = [JobBodyViewModel]()
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: VC's Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewIsReady()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: IBActions
    
    // MARK: Other Functions
}

// MARK: JobListViewInterface
extension JobListViewController: JobListViewInterface {
    func show(jobList: [JobBodyViewModel]) {
        self.jobList = jobList
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showLoading() {
        self.showProgressHud()
    }
    
    func hideLoading() {
        self.hideProgressHud()
        
    }
    
    func show(error: Error) {
        alert(message: error.localizedDescription, okAction: {})
        
    }
    
}

// MARK: UITableViewDelegate
extension JobListViewController: UITableViewDelegate {
    
}
// MARK: UITableViewDataSource
extension JobListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobListTableViewCell", for: indexPath) as! JobListTableViewCell
        cell.setData(job: jobList[indexPath.row])
        return cell
    }
    
    
}

