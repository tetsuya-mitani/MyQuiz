//
//  QuestionViewController.swift
//  MyQuiz
//
//  Created by 三谷 哲也 on 2016/12/31.
//  Copyright © 2016年 Tetsuya Mitani. All rights reserved.
//

import UIKit
import AudioToolbox

class QuestionViewController: UIViewController {

    var questionData: QuestionData!
    
    @IBOutlet weak var questionNoLavel: UILabel!
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    
    @IBOutlet weak var correctImageView: UIImageView!
    @IBOutlet weak var incorrectImageView: UIImageView!
    
    @IBAction func tapAnswer1Button(_ sender: Any) {
        questionData.userChoiceAnswerNumber = 1
        goNextQuestionWithAnimation()
    }
    @IBAction func tapAnswer2Button(_ sender: Any) {
        questionData.userChoiceAnswerNumber = 2
        goNextQuestionWithAnimation()
    }
    @IBAction func tapAnswer3Button(_ sender: Any) {
        questionData.userChoiceAnswerNumber = 3
        goNextQuestionWithAnimation()
    }
    @IBAction func tapAnswer4Button(_ sender: Any) {
        questionData.userChoiceAnswerNumber = 4
        goNextQuestionWithAnimation()
    }
    
    func goNextQuestionWithAnimation() {
        if(questionData.isCorrect()) {
            goNextQuestionWithCorrectAnimation()
        }
        else {
            goNextQuestionWithIncorrectAnimation()
        }
    }
    
    func goNextQuestionWithCorrectAnimation() {
        AudioServicesPlayAlertSound(1025)
        UIView.animate(withDuration: 2.0, animations: {
            self.correctImageView.alpha = 1.0
        }) { (Bool) in
            self.goNextQuestion()
        }
    }
    
    func goNextQuestionWithIncorrectAnimation() {
        AudioServicesPlayAlertSound(1006)
        UIView.animate(withDuration: 2.0, animations: {
            self.incorrectImageView.alpha = 1.0
        }) { (Bool) in
            self.goNextQuestion()
        }
    }
    
    func goNextQuestion() {
        guard let nextQuestion = QuestionDataManager.sharedInstance.nextQuestion()
            else {
                if let  resultViewController = storyboard?.instantiateViewController(withIdentifier: "result") as? ResultViewController {
                    present(resultViewController, animated: true, completion: nil)
                }
                return
        }
        
        if let  nextQuestionViewController = storyboard?.instantiateViewController(withIdentifier: "question") as? QuestionViewController {
            nextQuestionViewController.questionData = nextQuestion
            present(nextQuestionViewController, animated: true, completion: nil)
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        questionNoLavel.text = "Q.\(questionData.questionNo)"
        questionTextView.text = questionData.question
        answer1Button.setTitle(questionData.answer1, for: UIControlState.normal)
        answer2Button.setTitle(questionData.answer2, for: UIControlState.normal)
        answer3Button.setTitle(questionData.answer3, for: UIControlState.normal)
        answer4Button.setTitle(questionData.answer4, for: UIControlState.normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
