//
//  FieldSurveyJSONLoader.swift
//  FieldSurvey
//
//  Created by Mercy Housh on 7/18/19.
//  Copyright © 2019 Mercy Housh. All rights reserved.
//

import Foundation

class FieldSurveyJSONLoader {
    
    class func load(filename: String) -> [FieldSurvey] {
        var surveys = [FieldSurvey]()
        
        if let path = Bundle.main.path(forResource: filename, ofType: "json"),
        let data = try? Data(contentsOf: URL(fileURLWithPath: path))
        {
            surveys = FieldSurveysJSONParser.parse(data)
        }
        return surveys
    }
}
