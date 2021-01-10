//
//  QuizModel.swift
//  Quiz App
//
//  Created by sadiq qasmi on 03/01/2021.
//

import Foundation
struct Question {
    let question:String
    let ans:[String]
    let correctAns:String
    init(q:String, a:[String], correctAnswer:String) {
        question = q
        ans = a
        correctAns = correctAnswer
    }
}
