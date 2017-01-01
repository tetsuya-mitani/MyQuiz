//
//  StartViewController.swift
//  MyQuiz
//
//  Created by 三谷 哲也 on 2016/12/31.
//  Copyright © 2016年 Tetsuya Mitani. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        QuestionDataManager.sharedInstance.loadQuestion()
        
        guard let nextViewController = segue.destination as? QuestionViewController else {
            // 取得できずに終了
            return
        }
        
        guard  let questionData = QuestionDataManager.sharedInstance.nextQuestion() else {
            return
        }
        
        nextViewController.questionData = questionData
    }
    
    @IBAction func goToTitle(segue: UIStoryboardSegue) {
        
    }

}
