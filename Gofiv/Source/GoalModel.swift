//
//  GoalModel.swift
//  Gofiv
//
//  Created by Chrismanto Natanail Manik on 28/07/22.
//

import Foundation

struct GoalModel:Hashable, Identifiable{
    let id : UUID
    var title: String
    var reminder: String? //Date
    var target: String
    var sessions: [SessionModel]?
    var totalSession: Int?
    
    var total: Int?
}

struct SessionModel:Hashable, Identifiable{
    let id: UUID
    let titleGoal: String
    let targetGoal: String
    let timeSession: String
    var startTime: String
    var endTime: String
    var breakTime: String?
    var questionPractice: Int?
    var note: String?
}
