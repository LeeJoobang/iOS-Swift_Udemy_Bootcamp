//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
     
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!//이렇게 표시한 후 타입을 살펴보면 바로 형태를 알 수 있구나.
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        // IBAction 내에서 버튼을 눌렀을 때 값을 증가하고, updateUI()를 출력한다.
        if userGotItRight {
            print("Right")
            sender.backgroundColor = .green
        } else { 
            print("Wrong")
            sender.backgroundColor = .red
        }
        quizBrain.nextQuestion()
        updateUI()
    }
    
    func updateUI(){

        self.questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: { [self] in
            self.trueButton.backgroundColor = UIColor.clear
            self.falseButton.backgroundColor = UIColor.clear
        })
    }
}

