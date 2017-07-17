//
//  ViewController.swift
//  Card Counter
//
//  Created by Alex Asher on 17/07/2017.
//  Copyright © 2017 Appsher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cardView: UIImageView!
    @IBOutlet weak var countLbl: UILabel!
    @IBOutlet weak var showCountBtn: UIButton!
    
    var tap: UITapGestureRecognizer!
    var count = 0
    var countShown = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup card tap detection
        tap = UITapGestureRecognizer(target: self, action: #selector(self.handleCardTap(_:)))
        tap.isEnabled = true
        cardView.addGestureRecognizer(tap)
        
    }
    
    @IBAction func resetBtnTap(_ sender: Any) {
        //Reset
        cardView.image = UIImage(named: "red_joker")
        count = 0
        if countShown {
            countLbl.text = String(count)
        }
    }

    @IBAction func showCountBtnTap(_ sender: Any) {
        if countLbl.text == "" {
            countLbl.text = String(count)
            showCountBtn.setTitle("Hide Count", for: .normal)
            countShown = true
        } else {
            countLbl.text = ""
            showCountBtn.setTitle("Show Count", for: .normal)
            countShown = false
        }
        
    }
    
    func handleCardTap(_  sender: UITapGestureRecognizer){
        print("Card tapped")
        let card: Int = randomNum()
        cardView.image = UIImage(named: "\(card)")
        if (card < 6) || (13 < card && card < 19) || (26 < card && card < 32) || (39 < card && card < 45){
            count += 1
            print("Change: +1")
        } else if (card > 5 && card < 9) || (card > 18 && card < 22) || (card > 31 && card < 35) || (card > 44 && card < 48) {
            print ("Change: 0")
        } else {
            count -= 1
            print("Change: -1")
        }
        
        if countShown {
            countLbl.text = String(count)
        }
        print("Count: \(count)")
    }
    
    func randomNum() -> Int {
        let cardNum  = (arc4random_uniform(51) + 1)
        return Int(cardNum)
    }

}

