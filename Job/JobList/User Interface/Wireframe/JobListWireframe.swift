//
//  JobListWireframe.swift
//  Job
//
//  Created by Mac on 6/22/20.
//Copyright © 2020 Amrit Duwal. All rights reserved.
//

import UIKit

class JobListWireframe {
     weak var view: UIViewController!
}

extension JobListWireframe: JobListWireframeInput {
    
    var storyboardName: String {return "JobList"}
    
    func getMainView() -> UIViewController {
        let service = JobListService()
        let interactor = JobListInteractor(service: service)
        let presenter = JobListPresenter()
        let viewController = viewControllerFromStoryboard(of: JobListViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
}
