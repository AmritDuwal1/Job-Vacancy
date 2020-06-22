//
//  JobListInteractorIO.swift
//  Job
//
//  Created by Mac on 6/22/20.
//Copyright © 2020 Amrit Duwal. All rights reserved.
//

protocol JobListInteractorInput: class {
    func getJoblist()
}

protocol JobListInteractorOutput: class {
    func obtained(error: Error)
    func obtained(jobList: [JobBodyStructure])
}
