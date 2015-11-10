//
//  ViewController.swift
//  Letter4Letter V1
//
//  Created by Anand Ganeshalingam on 2015-08-06.
//  Copyright (c) 2015 AnAPPand. All rights reserved.
//

import UIKit

//score variables 
var pOneScore = Int(0)

var pTwoScore = Int(0)

class ViewController: UIViewController, UITextFieldDelegate {

    //Label to keep track of the word so far
    @IBOutlet var wordSoFar: UILabel!
    
    //variable to keep track of the word being constructed
    var gameWord = NSString(string: "")
    
    //message will either be "Enter a letter:" or "Enter the word:"
    @IBOutlet var message: UILabel!
    
    //text field that lets user input the letter
    @IBOutlet var enteredLetter: UITextField!
    
    //player name keeps track of player's turn
    @IBOutlet var playerName: UILabel!
    
    //response text for wins or losses
    @IBOutlet var returnIfWord: UILabel!
    
    //function to check if a word exists in Apple's dictionary
    func isWordReal(currentWord: NSString) -> Bool {
        
        let checker = UITextChecker()
        
        let range = NSMakeRange(0, currentWord.length)
        
        let misspelledRange = checker.rangeOfMisspelledWordInString(currentWord as String, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
        
    }
    
    //function to update player tracker 
    func updatePlayerTracker() {
        
        if self.playerName.text == "Player 1" {
            
            self.playerName.text = "Player 2"
            
        } else{
            
            self.playerName.text = "Player 1"
            
        }
        
    }
    
    //score update function
    func updateScore() {
        
        if playerName.text == "Player 1" {
            
            pOneScore++
            
            print(pOneScore)
            
        } else {
            
            pTwoScore++
            
            print(pTwoScore)
            
        }
        
    }
    
    //addLetter function -> doesn't work see error messages in comments below (commented out function)
//    func addLetter(word:NSString, letter:NSString, side:String) -> NSString {

//        if side == "left" {
            
//            word = letter + word
            //cannot assign to 'let' value 'word'
//        } else {
         
//            word = word + letter
            //cannot assign to 'let' value 'word'
//        }
        
//    }
    
    //adds entered letter to the left of gameWord
    @IBAction func addLeft(sender: AnyObject) {
        
        let enteredLetters = NSString(string: enteredLetter.text!)
        
        if enteredLetters.length == 1 {
        
        //clears big blue message and adds left
        returnIfWord.text = ""
        
        gameWord = enteredLetter.text! + (gameWord as String)
        
        wordSoFar.text = gameWord as String
        
        //if statement to update Player tracker
        updatePlayerTracker()
        
        enteredLetter.text = ""
        
        //checks if the gameWord is a real word
        if isWordReal(gameWord) && gameWord.length > 3 {
            
            returnIfWord.text = playerName.text! + " Wins!"
            
            gameWord = ""
            
            //add a score keeper here
            updateScore()
            
        }
            
        } else {
            
            returnIfWord.text = "Please enter 1 letter only"
            
            enteredLetter.text = ""
            
        }

    }
    
    //adds entered letter to the right of gameWord
    @IBAction func addRight(sender: AnyObject) {
        
        let enteredLetters = NSString(string: enteredLetter.text!)
        
        if enteredLetters.length == 1 {
            
        //clears big blue message
        returnIfWord.text = ""
        
        gameWord = (gameWord as String) + enteredLetter.text!
        
        wordSoFar.text = gameWord as String
        
        //if statement to update Player tracker
        updatePlayerTracker()
        
        enteredLetter.text = ""
        
        //checks if the gameWord is a real word
        if isWordReal(gameWord) && gameWord.length > 3 {
            
            returnIfWord.text = playerName.text! + " Wins!"
            
            gameWord = ""
            
            //add a score keeper here
            updateScore()
            
        }
            
        } else {
            
            returnIfWord.text = "Please enter 1 letter only"
            
            enteredLetter.text = ""
            
        }
        
    }
    
    //Player calls out other Player to see if they have a word
    @IBAction func realChallenge(sender: AnyObject) {
        
        returnIfWord.text = "Hit GO!"
        
        updatePlayerTracker()
        
        message.text = "Enter the word:"
        
    }
   
    //Player hits GO to submit the word they have in mind
    @IBAction func challengeChecker(sender: AnyObject) {
        
        let theWord = NSString(string: enteredLetter.text!)
        
        //checks if entered work is real and includes the gameWord
        if isWordReal(theWord) && theWord.containsString(gameWord as String) {
            
            returnIfWord.text = playerName.text! + " Wins!"
            
            gameWord = enteredLetter.text!
            
            wordSoFar.text = gameWord as String
            
            enteredLetter.text = ""
            
            //add a score keeper here
            updateScore()
            
        } else{
            
            updatePlayerTracker()
            
            returnIfWord.text = playerName.text! + " Wins!"

            enteredLetter.text = ""
            
            //add a score keeper here
            updateScore()
            
        }
        
    }
    
    
    //resets everything
    @IBAction func newGame(sender: AnyObject) {
        
        returnIfWord.text = "Left or Right to start"
        
        gameWord = ""
        
        wordSoFar.text = ""
        
        enteredLetter.text = ""
        
        message.text = "Enter a letter:"
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
        
    }


}

