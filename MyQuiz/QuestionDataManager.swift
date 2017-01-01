//
//  QuestionDataManager.swift
//  MyQuiz
//
//  Created by 三谷 哲也 on 2016/12/31.
//  Copyright © 2016年 Tetsuya Mitani. All rights reserved.
//

import Foundation

class QuestionDataManager {
    static let sharedInstance = QuestionDataManager()
    
    var questionDataArray = [QuestionData]()
    var nowQuestionIndex: Int = 0
    
    private init() {
        //シングルトンであることを保証するためにprivateで宣言しておく
    }
    
    func loadQuestion() {
        //初期化
        questionDataArray.removeAll()
        nowQuestionIndex = 0
        
        guard let csvFilePath = Bundle.main.path(forResource: "question", ofType: "csv") else {
            print("CSVファイルが存在しません")
            return
        }
        
        do {
            let csvStringData = try String(contentsOfFile: csvFilePath, encoding: String.Encoding.utf8)
            
            csvStringData.enumerateLines(invoking: { (line, stop) in
                let questionSourceDataArray = line.components(separatedBy: ",")
                
                let questionData = QuestionData(questionSourceDataArray: questionSourceDataArray)
                
                self.questionDataArray.append(questionData)
                
                questionData.questionNo = self.questionDataArray.count
            })

        }
        catch {
            print("csvファイル読み込みエラー")
            return
        }
    }
    
    func nextQuestion() -> QuestionData? {
        if nowQuestionIndex < questionDataArray.count {
            let nextQuestion = questionDataArray[nowQuestionIndex]
            nowQuestionIndex += 1
            return nextQuestion
        }
        return nil        
    }
}
