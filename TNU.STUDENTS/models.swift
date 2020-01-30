//
//  models.swift
//  TNU.STUDENTS
//
//  Created by mac on 1/30/20.
//  Copyright © 2020 Istiqlol Soft. All rights reserved.
//

import Foundation

struct Message: Codable {
    var message: String?
}

struct StudentsInfo: Codable {
    var RecordBookNumber: String?
    var FullName: Language
    var Faculty: Language
    var Specialty: Language
    var CodeSpecialty: String?
    var Trainingform: String?
    var TrainingLevel: String?
    var Course: Int8?
    var Group: String?
    var YearUniversityEntrance: String?
    var TrainingPeriod: Int8?
}

struct Language: Codable {
    var TJ: String?
    var RU: String?
}
