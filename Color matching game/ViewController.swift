//
//  ViewController.swift
//  Color matching game
//
//  Created by user on 07.06.16.
//  Copyright © 2016 Roborzoid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    
   // @IBOutlet weak var rightLabel: UILabel!
    
   // @IBOutlet weak var wrongLabel: UILabel!
    
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var wrongLabel: UILabel!
    
    
    let colorArray = [UIColor.blackColor(), UIColor.blueColor(), UIColor.brownColor(), UIColor.grayColor(), UIColor.greenColor(), UIColor.magentaColor(), UIColor.orangeColor(), UIColor.purpleColor(), UIColor.redColor(), UIColor.yellowColor()]
    
    let textArray = ["black", "blue", "brown", "gray","green", "magenta", "orange", "purple", "red", "yellow" ]
    
    
    var textIndex: Int!
    var colorIndex: Int!
    
    var countTrue = 0
    var countFalse = 0
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        showQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func returnRandomNumber() -> Int {
        let random = Int(arc4random_uniform(UInt32(colorArray.count)))
        return random
    }
    
    func showQuestion(){
        textIndex = returnRandomNumber()
        colorIndex = returnRandomNumber()
        
        textLabel.text = textArray[textIndex]
        colorLabel.text = textArray[returnRandomNumber()]
        colorLabel.textColor = colorArray[colorIndex]
        
        rightLabel.text = String(countTrue)	
        wrongLabel.text = String(countFalse)
        
    
        
        
        clearButtons()
        toggleButtons(true)
    }
    
    func toggleButtons(toggle: Bool){
        yesButton.userInteractionEnabled = toggle
        noButton.userInteractionEnabled = toggle
    }
    
    
    
    func clearButtons(){
        yesButton.backgroundColor = UIColor.clearColor()
        noButton.backgroundColor = UIColor.clearColor()
    }
    
    
    @IBAction func yesButtonPressed(sender: UIButton) {
        toggleButtons(false)
        
        if textIndex == colorIndex{
            sender.backgroundColor = UIColor.greenColor()
            countTrue = countTrue + 1
            
        }else{
            sender.backgroundColor = UIColor.redColor()
            countFalse = countFalse + 1
        }
    }
    
    @IBAction func noButtonPressed(sender: UIButton) {
        toggleButtons(false)
        
        if textIndex == colorIndex{
            sender.backgroundColor = UIColor.redColor()
            countFalse = countFalse + 1
            
        }else{
            sender.backgroundColor = UIColor.greenColor()
            countTrue = countTrue + 1
        }
    }
    
    @IBAction func nextQuestionButtonPressed() {
        showQuestion()
    }
}

