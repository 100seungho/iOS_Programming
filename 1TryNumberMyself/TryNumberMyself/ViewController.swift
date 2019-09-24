//
//  ViewController.swift
//  TryNumberMyself
//
//  Created by 백승호 on 04/09/2019.
//  Copyright © 2019 백승호. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        startNewGame()
    }

    @IBAction func showAlert(){
        let difference = abs(targetValue - currentValue)
        // swift에서 let은 변경될 일 없는 변수를 선언할 때 사용한다.
        var point = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "Perfact!"
            point += 100
        } else if difference < 5 {
            title = "You almost had it!"
            point += 50
        } else if difference < 10 {
            title = "Preety good!"
        } else {
            title = "not even close..."
        }
        
        score += point
        
        let message = "Current Point: \(point)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
        })
        // 특정 함수의 파라미터로 넘어가는 이름이 없는 함수(anonymous func)를 closure라고 한다.
        // closure 안에서 instance func을 호출할 때는 명시적으로 해야 한다. (.self)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderMoved(_ slider:UISlider) {
        print("Current Value: \(slider.value)")
        
        currentValue = Int(slider.value.rounded())
    }
    
    func startNewRound(){
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        
        updateLabels()
        round += 1
    }
    
    @IBAction func startNewGame() {
        round = 0
        score = 0
        startNewRound()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

