//
//  ViewController2.swift
//  Letter4Letter V1
//
//  Created by Anand Ganeshalingam on 2015-08-13.
//  Copyright (c) 2015 AnAPPand. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    

    @IBOutlet var scorePOne: UILabel!
    
    @IBOutlet var scorePTwo: UILabel!
    
    
    @IBAction func resetScores(sender: AnyObject) {
        
        pOneScore = 0
        
        pTwoScore = 0
        
        scorePOne.text = "\(pOneScore)"
        
        scorePTwo.text = "\(pTwoScore)"
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scorePOne.text = "\(pOneScore)"
        
        scorePTwo.text = "\(pTwoScore)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
