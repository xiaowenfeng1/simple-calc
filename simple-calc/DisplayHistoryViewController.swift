//
//  DisplayHistoryViewController.swift
//  simple-calc
//
//  Created by Xiaowen Feng on 4/24/16.
//  Copyright © 2016 Xiaowen Feng. All rights reserved.
//

import UIKit

class DisplayHistoryViewController: UIViewController {
    
    

    @IBOutlet weak var history: UILabel!
    @IBOutlet weak var ScrollView: UIScrollView!
    var receivedStr : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        history.text = receivedStr
        
        
        ScrollView.contentSize.height = 4000
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let calculatorView: ViewController = segue.destinationViewController as! ViewController
        
        calculatorView.history.append(receivedStr)
    }
    
    func createLabels () {
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
