//
//  DifficultModeViewController.swift
//  CatchBuzz
//
//  Created by İlhan Cüvelek on 1.12.2023.
//

import UIKit

class DifficultModeViewController: UIViewController {
    
    @IBOutlet weak var buzz1: UIImageView!
    @IBOutlet weak var buzz2: UIImageView!
    @IBOutlet weak var buzz3: UIImageView!
    @IBOutlet weak var buzz4: UIImageView!
    @IBOutlet weak var buzz5: UIImageView!
    @IBOutlet weak var buzz6: UIImageView!
    @IBOutlet weak var buzz7: UIImageView!
    @IBOutlet weak var buzz8: UIImageView!
    @IBOutlet weak var buzz9: UIImageView!
    @IBOutlet weak var buzz10: UIImageView!
    @IBOutlet weak var buzz11: UIImageView!
    @IBOutlet weak var buzz12: UIImageView!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var yourScoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    var timer=Timer()
    var buzzTimer=Timer()
    var counter=0
    var score=0
    var highScore=0
    var buzzArray : [UIImageView]=[]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if let highScoreString = UserDefaults.standard.string(forKey: "high_score_difficult") {
            if let highScoreInt = Int(highScoreString) {
                highScoreLabel.text="High Score : \(highScoreString)"
                highScore = highScoreInt
            }
        }
        
        counter=20
        timeLabel.text="Time : \(counter)"

        buzzArray.append(buzz1)
        buzzArray.append(buzz2)
        buzzArray.append(buzz3)
        buzzArray.append(buzz4)
        buzzArray.append(buzz5)
        buzzArray.append(buzz6)
        buzzArray.append(buzz7)
        buzzArray.append(buzz8)
        buzzArray.append(buzz9)
        buzzArray.append(buzz10)
        buzzArray.append(buzz11)
        buzzArray.append(buzz12)
        
        for buzz in buzzArray {
            buzz.isUserInteractionEnabled=true
            buzz.isHidden=true
            let gestureRecognizer=UITapGestureRecognizer(target: self, action: #selector(buzzAction))
            buzz.addGestureRecognizer(gestureRecognizer)
        }
        
        timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        buzzTimer=Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(buzzTimerFunction), userInfo: nil, repeats: true)
    }
    @objc func buzzTimerFunction(){
        
        if timer.isValid{
            let randomIndex=Int.random(in: 0...11)
            for i in 0...11 {
                if i==randomIndex{
                    buzzArray[i].isHidden=false
                }else{
                    buzzArray[i].isHidden=true
                }
            }
        }
    }
    
    @objc func timerFunction(){
        counter-=1
        timeLabel.text="Time : \(counter)"
        
        buzzTimerFunction()
        
        if counter==0{
            timer.invalidate()
            showAlert(title: "Time's Over", message: yourScoreLabel.text!)
            if highScore<score{
                UserDefaults.standard.setValue(score, forKey: "high_score_difficult")
                highScoreLabel.text="High Score : \(score)"
            }else{
                UserDefaults.standard.setValue(highScore, forKey: "high_score_difficult")
                highScoreLabel.text="High Score : \(highScore)"
            }
        }
    }
    @objc func buzzAction(){
        score+=1
        yourScoreLabel.text="Your Score : \(score)"
    }
    func showAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle:UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }


}
