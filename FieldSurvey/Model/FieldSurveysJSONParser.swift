//
//  FieldSurveysJSONParser.swift
//  FieldSurvey
//
//  Created by Mercy Housh on 7/18/19.
//  Copyright © 2019 Mercy Housh. All rights reserved.
//

import Foundation

class FieldSurveysJSONParser {
    
    static let dateFormatter = DateFormatter()
    
    class func parse(_ data: Data) -> [FieldSurvey]{
        var fieldSurveys = [FieldSurvey]()
        
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let root = json as? [String: Any],
            let status = root["status"] as? String,
            status == "ok"
        {
            if let events = root["events"] as? [Any] {
                for event in events {
                    if let event = event as? [String: String] {
                        if let classificationName = event["classification"],
                            let title = event["title"],
                            let description = event["description"],
                            let dateString = event["date"],
                            let date = dateFormatter.date(from: dateString)
                        {
                            if let fieldSurvey = FieldSurvey(classificationName: classificationName, title: title, description: description, date: date) {
                                fieldSurveys.append(fieldSurvey)
                            }
                        }
                    }
                }
            }
        }
        
        return fieldSurveys
    }
}
