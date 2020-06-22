//
//  JobListViewInterface.swift
//  Job
//
//  Created by Mac on 6/22/20.
//Copyright © 2020 Amrit Duwal. All rights reserved.
//

protocol JobListViewInterface: class {
    func showLoading()
    func hideLoading()
    func show(error: Error)
    func show(jobList: [JobBodyViewModel])
}
