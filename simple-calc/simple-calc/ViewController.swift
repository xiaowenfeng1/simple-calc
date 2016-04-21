//
//  ViewController.swift
//  simple-calc
//
//  Created by Xiaowen Feng on 4/20/16.
//  Copyright © 2016 Xiaowen Feng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var num : Double = 0.0
    var prevOper : String = ""
    var oper : String = ""
    var result : Double = 0.0
    var nums = [Double]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        output.text = "\(result)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // number 0 - 9 button pressed function
    @IBAction func input(sender: UIButton) {
        num = num * 10 + strToNum(sender.titleLabel!.text!)
        output.text = "\(num)"
        
    }
    
    // outputs the result
    @IBOutlet weak var output: UITextField!
    
    
    @IBAction func operation(sender: UIButton) {
        if (prevOper == "avg" || prevOper == "count") && prevOper != oper {
            print("Invaild operator, please use same operator when using avg or count")
            
        }
        
        nums.append(num)
        oper = sender.titleLabel!.text!
        switch oper {
            case "=" :
                switch prevOper {
                    case "+":
                        result = nums[0] + nums[1]
                    case "-":
                        result = nums[0] - nums[1]
                    case "*":
                        result = nums[0] * nums[1]
                    case "/":
                        result = nums[0] / nums[1]
                    case "%":
                        result = nums[0] % nums[1]
                    case "avg":
                        result = avg()
                    case "count":
                        result = Double(nums.count)
                    
                    default: break
                }
                output.text = "\(result)"
            
            case "fact" :
                if nums.count == 1 && num % 1 == 0.0 {
                    result = Double(fact(Int(num)))
                    output.text = "\(result)"
                } else {
                    print("Please enter one integer for factorial calculation.")
                }
            
            default:
                prevOper = oper
                num = 0
        }
    }

    // Reset button to clear previous calculation
    @IBAction func Clear(sender: UIButton) {
        num = 0
        result = 0.0
        output.text = "\(result)"
        nums = [Double]()
        prevOper = ""
        oper = ""
    }
    
    // calculates the average for numbers
    func avg() -> Double {
        var sum = 0.0
        for n in nums {
            sum +=  n
        }
        return sum / Double(nums.count)
    }
    
    // calcutes the factorial for a number
    func fact(n: Int) -> Int {
        var value = n
        var fact = 1
        while (value != 0) {
            fact *= value
            value -= 1
        }
        return fact
    }
    
    // converts the given string to a double
    func strToNum(str: String) -> Double{
        return Double(str)!
    }

}

