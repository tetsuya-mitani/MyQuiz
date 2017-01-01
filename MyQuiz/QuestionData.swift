//
//  QuestionData.swift
//  MyQuiz
//
//  Created by 三谷 哲也 on 2016/12/31.
//  Copyright © 2016年 Tetsuya Mitani. All rights reserved.
//

import Foundation

class QuestionData {
    
    //csvファイルの内容
    var question: String
    
    var answer1: String
    var answer2: String
    var answer3: String
    var answer4: String
    
    var correctAnswerNumber: Int
    
    //ユーザーが選択肢した選択肢の番号
    var userChoiceAnswerNumber: Int?
    
    //問題番号
    var questionNo: Int = 0
    
    init(questionSourceDataArray: [String]) {
        question = questionSourceDataArray[0]
        answer1 = questionSourceDataArray[1]
        answer2 = questionSourceDataArray[2]
        answer3 = questionSourceDataArray[3]
        answer4 = questionSourceDataArray[4]
        correctAnswerNumber = Int(questionSourceDataArray[5])!
    }
    
    func isCorrect() -> Bool {
        if correctAnswerNumber == userChoiceAnswerNumber {
            return true
        }
        return false
    }
    
}
