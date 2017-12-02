//
//  ViewController.swift
//  GuessNumber_0331
//
//  Created by Student on 17/3/31.
//  Copyright © 2017年 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var numberInput: UITextField!
    
    @IBOutlet weak var BtnGuess: UIButton!
    
    @IBOutlet weak var BtnReset: UIButton!
    
    @IBOutlet weak var Msg01: UILabel!
    
    @IBOutlet weak var Msg02: UILabel!
    
    @IBOutlet weak var Msg03: UILabel!
    
    @IBOutlet weak var Msg04: UILabel!
    
    @IBOutlet weak var Msg05: UILabel!
    
    @IBOutlet weak var Msg06: UILabel!
    
    private var AnswerString:String="";
    
    
    @IBAction func TouchView(_ sender: Any) {
        
        numberInput.resignFirstResponder()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resetHandler()
        BtnReset.addTarget(self, action: #selector(resetHandler), for: .touchUpInside)
        BtnGuess.addTarget(self, action: #selector(guessHandler), for: .touchUpInside)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func guessHandler()
    {
       let userInput = numberInput.text
        
        if userInput != nil
        {
            let result = getString4(str1: AnswerString, str2: userInput!)
            
            Msg01.text=result;
        }
        
        
        Msg02.text="第2次尝试"
        Msg03.text="第3次尝试"
        Msg04.text="..."
        Msg05.text="第5次尝试"
        Msg06.text="第6次尝试"
        
    }
    
    func resetHandler()
    {
        Msg01.text="第1次尝试"
        Msg02.text="第2次尝试"
        Msg03.text="第3次尝试"
        Msg04.text="第4次尝试"
        Msg05.text="第5次尝试"
        Msg06.text="第6次尝试"
        
        
        AnswerString=gen4Number();
        
        print(AnswerString)
        
    }

    //判断一个数字是否存在于一个数组中
    //有2个参数，第一个参数是一个数字，第二个参数是一个数组
    func numberInArray(number:Int,array:[Int])->Bool
    {
        //通过数组的遍历，查阅里面有没有number这个元素
        for n in array{
            if n==number
            {
                return true;
            }
        }
        
        return false;
    }
    
    
    
    func gen4Number()->String{
        
        var num:[Int]=[Int]();
        
        for _ in 0...3
        {
            //产生一个随机数
            var rand=Int(arc4random_uniform(10));
            
            //能跳出这个循环，则说明，num数组中，不存在刚刚生成的随机数rand
            while numberInArray(number: rand, array: num)
            {
                rand=Int(arc4random_uniform(10));
            }
            
            //追加到数组末位
            num.append(rand)
        }
        
        var str:String="";
        
        for i in num
        {
            str.append(String(i))
            
        }
        
        return str;
        
        
    }

    func getString4(str1:String,str2:String)->String{
        var array1:[Character]=[Character]();
        for c in str1.characters
        {
            array1.append(c)
        }
        
        var array2:[Character]=[Character]();
        for c in str2.characters
        {
            array2.append(c)
        }
        
        var Acounter=0;
        var Bcounter=0;
        
        
        for i in 0...3
        {
            if array1[i]==array2[i]
            {
                Acounter+=1;
            }
            else
            {
                //包含子串
                if str1.contains(String(array2[i]))
                {
                    Bcounter+=1;
                }
            }
        }
        
        return "\(Acounter)A\(Bcounter)B"
        
    }

    
    
    
    
}

