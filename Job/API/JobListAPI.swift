//
//  JobListAPI.swift
//  Job
//
//  Created by ekbana on 12/26/19.
//  Copyright © 2019 ekbana. All rights reserved.
//

import Foundation

protocol JobListAPI {
    func notice(success: @escaping (Job) -> (), failure: @escaping (Error) -> () )
}

extension JobListAPI {
    func notice(success: @escaping (Job) -> (), failure: @escaping (Error) -> () ) {
        guard let url = URL(string: "http://3.18.25.237/api/Test/GetJobList?SessionGuid=7f156c65-fc33-4c8f-bb86-ec3fb94d2bf1") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        session.dataTask(with: request){ (data, response, error) in
            if let data = data {
                do {
                    let mainData = try JSONDecoder().decode(Job.self, from: data)
                    success(mainData)
                } catch {
                    failure(error)
                }
            }
        }.resume()
        
    }
}
