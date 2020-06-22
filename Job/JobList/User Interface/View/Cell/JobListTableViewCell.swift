//
//  JobListTableViewCell.swift
//  Job
//
//  Created by Mac on 6/22/20.
//  Copyright © 2020 Amrit Duwal. All rights reserved.
//

import UIKit

class JobListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var createdDateLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.shadowColor = UIColor.gray.cgColor
        backView.layer.shadowOpacity = 1
        backView.layer.shadowOffset = .zero
        backView.layer.shadowRadius = 10
        backView.layer.cornerRadius = 10
        backView.layer.shadowOpacity = 0.2
    }
    
    func setData(job: JobBodyViewModel){
        titleLabel.text = job.title
        descriptionLabel.text = job.bodyDescription
        createdDateLabel.text = job.postedDate
        addressLabel.text = job.address
    }

}
