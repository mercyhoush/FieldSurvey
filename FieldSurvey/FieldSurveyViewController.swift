//
//  FieldSurveyViewController.swift
//  FieldSurvey
//
//  Created by Mercy Housh on 7/18/19.
//  Copyright © 2019 Mercy Housh. All rights reserved.
//

import UIKit

class FieldSurveyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var fieldSurveyTableView: UITableView!
    
    let fieldSurveys = FieldSurveyJSONLoader.load(filename: "field_observations")
    
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fieldSurveys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fieldSurveyCell", for: indexPath)
        
        if let cell = cell as? FieldSurveyTableViewCell {
            let fieldSurvey = fieldSurveys[indexPath.row]
            cell.surveyIconImageView.image = fieldSurvey.classification.image
            cell.descriptionLabel.text = fieldSurvey.description
            cell.classificationLabel.text = fieldSurvey.title
            cell.dateLabel.text = dateFormatter.string(from: fieldSurvey.date)
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FieldSurveyDetailViewController,
            let row = fieldSurveyTableView.indexPathForSelectedRow?.row
        {
            destination.fieldSurvey = fieldSurveys[row]
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
