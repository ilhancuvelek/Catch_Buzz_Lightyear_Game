//
//  ViewController.swift
//  CatchBuzz
//
//  Created by İlhan Cüvelek on 1.12.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func easyModeButton(_ sender: Any) {
        performSegue(withIdentifier: "toEasyMode", sender: nil)
    }
    
    @IBAction func mediumModeButton(_ sender: Any) {
        performSegue(withIdentifier: "toMediumMode", sender: nil)
    }
    
    @IBAction func difficultModeButton(_ sender: Any) {
        performSegue(withIdentifier: "toDifficultMode", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="toEasyMode"{
            let destinationVC = segue.destination as? EasyModeViewController
        }
    }
}

