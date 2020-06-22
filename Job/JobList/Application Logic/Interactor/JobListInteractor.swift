//
//  JobListInteractor.swift
//  Job
//
//  Created by Mac on 6/22/20.
//Copyright © 2020 Amrit Duwal. All rights reserved.
//

import Foundation

class JobListInteractor {
    
    // MARK: Properties
    weak var output: JobListInteractorOutput?
    private let service: JobListServiceType
    
    // MARK: Initialization
    init(service: JobListServiceType) {
        self.service = service
    }
    
    // MARK: Converting entities
    private func convert(model: JobBody) -> JobBodyStructure {
        return JobBodyStructure(testJobs: model.testJobs, title: model.title, bodyDescription: model.bodyDescription, address: model.address, postedDate: model.postedDate.components(separatedBy: "T").first ?? model.postedDate, active: model.active)
    }
}

// MARK: JobList interactor input interface

extension JobListInteractor: JobListInteractorInput {
    func getJoblist() {
        service.notice(success: { [weak self]  (job) in
            guard let self = self else {return}
            let structures = job.body.map(self.convert)
            self.output?.obtained(jobList: structures)
        }) {[weak self] (error) in
            self?.output?.obtained(error: error)
        }
    }
    
    
}
