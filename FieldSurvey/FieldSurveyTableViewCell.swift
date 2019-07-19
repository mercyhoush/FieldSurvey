//
//  FieldSurveyTableViewCell.swift
//  FieldSurvey
//
//  Created by Mercy Housh on 7/18/19.
//  Copyright © 2019 Mercy Housh. All rights reserved.
//

import UIKit

class FieldSurveyTableViewCell: UITableViewCell {
    @IBOutlet weak var surveyIconImageView: UIImageView!
    @IBOutlet weak var classificationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
