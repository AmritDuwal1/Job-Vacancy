//
//  JobViewModel.swift
//  Job
//
//  Created by Mac on 6/22/20.
//  Copyright © 2020 Amrit Duwal. All rights reserved.
//

import Foundation

// MARK: - JobBody
struct JobBodyViewModel: Codable {
    let testJobs: Int
    let title, bodyDescription, address, postedDate: String
    let active: Bool

    enum CodingKeys: String, CodingKey {
        case testJobs, title
        case bodyDescription = "description"
        case address, postedDate, active
    }
}
