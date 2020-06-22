//
//  JobListPresenter.swift
//  Job
//
//  Created by Mac on 6/22/20.
//Copyright © 2020 Amrit Duwal. All rights reserved.
//

import Foundation

class JobListPresenter {
    
    // MARK: Properties
    weak var view: JobListViewInterface?
    var interactor: JobListInteractorInput?
    var wireframe: JobListWireframeInput?
    
    // MARK: Converting entities
    private func convert(model: JobBodyStructure) -> JobBodyViewModel {
        return JobBodyViewModel(testJobs: model.testJobs, title: model.title, bodyDescription: model.bodyDescription, address: model.address, postedDate: model.postedDate, active: model.active)
    }
}

// MARK: JobList module interface

extension JobListPresenter: JobListModuleInterface {
    func viewIsReady() {
        DispatchQueue.main.async {
            self.view?.showLoading()
        }
        interactor?.getJoblist()
        
    }
    
    
}

// MARK: JobList interactor output interface
extension JobListPresenter: JobListInteractorOutput {
    func obtained(jobList: [JobBodyStructure]) {
        DispatchQueue.main.async {
            self.view?.hideLoading()
        }
        let viewModels = jobList.map(convert)
        self.view?.show(jobList: viewModels)
    }
    
    func obtained(error: Error) {
        DispatchQueue.main.async {
            self.view?.hideLoading()
            self.view?.show(error: error)
        }
        
    }
}
