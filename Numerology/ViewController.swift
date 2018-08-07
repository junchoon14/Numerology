//
//  ViewController.swift
//  Numerology
//
//  Created by Jason Hsu on 2018/8/7.
//  Copyright © 2018 junchoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var birthday: Date!
    var chr: Character?
    var i: Int?
    var birthNum: String?
    var birthAry = [Int]()
    var timesAry = [Int]()
    var totalNum: String = ""
    
    var num1: Int = 0
    var num2: Int = 0
    var num3: Int = 0
    var num4: Int = 0
    var num5: Int = 0
    var num6: Int = 0
    var num7: Int = 0
    var num8: Int = 0
    var num9: Int = 0
    
    @IBOutlet var circleImageView: [UIImageView]!
    
    
    @IBOutlet weak var numbersView: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var earlyNumLabel: UILabel!
    @IBOutlet weak var laterNumLabel: UILabel!
    @IBOutlet weak var lifePathNumLabel: UILabel!
    
    @IBOutlet weak var line24ImageView: UIImageView!
    @IBOutlet weak var line26ImageView: UIImageView!
    @IBOutlet weak var line48ImageView: UIImageView!
    @IBOutlet weak var line68ImageView: UIImageView!
    @IBOutlet weak var line123ImageView: UIImageView!
    @IBOutlet weak var line147ImageView: UIImageView!
    @IBOutlet weak var line159ImageView: UIImageView!
    @IBOutlet weak var line357ImageView: UIImageView!
    @IBOutlet weak var line369ImageView: UIImageView!
    @IBOutlet weak var line789ImageView: UIImageView!
    @IBOutlet weak var line258ImageView: UIImageView!
    @IBOutlet weak var line456ImageView: UIImageView!
    
    @IBAction func okButtonClick(_ sender: UIButton) {
        
        numbersView.isHidden = false
        //得到日期
        birthday = datePicker.date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        birthNum = formatter.string(from: birthday)
        //將年月日中的零去掉，得到先天數
        earlyNumLabel.text = birthNum!.replacingOccurrences(of: "0", with: "")
        //計算後天數
        getLaterNum()
        //計算主命數
        getLifePathNum()
        //繪製圖型
        getDrawing()
        
        if sender.currentTitle == "OK" {
            sender.setTitle("CLEAR", for: .normal)
        } else {
            numbersView.isHidden = true
            lineIsHidden()
            numsToZero()
            for i in 0...8 {
                circleImageView[i].image = UIImage(named: "")
            }
            sender.setTitle("OK", for: .normal)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numbersView.isHidden = true
        lineIsHidden()
    }
   //計算後天數
    func getLaterNum() {
        var sum = 0
            for chr in birthNum! {
                sum = sum + Int(String(chr))!
            }
            laterNumLabel.text = "\(sum)"
    }
    //計算主命數
    func getLifePathNum() {
        var sum = 0
        for chr in laterNumLabel.text! {
            sum = sum + Int(String(chr))!
        }
        lifePathNumLabel.text = "\(sum)"
    }
    
    func lineIsHidden() {
        line24ImageView.isHidden = true
        line26ImageView.isHidden = true
        line48ImageView.isHidden = true
        line68ImageView.isHidden = true
        line123ImageView.isHidden = true
        line147ImageView.isHidden = true
        line159ImageView.isHidden = true
        line357ImageView.isHidden = true
        line369ImageView.isHidden = true
        line789ImageView.isHidden = true
        line258ImageView.isHidden = true
        line456ImageView.isHidden = true
    }
    //九宮格圖案顯示函數
    func getDrawing() {
        totalNum = earlyNumLabel.text! + laterNumLabel.text! + lifePathNumLabel.text!
        print(totalNum)
        for chr in totalNum {
            if chr == "1" { num1 += 1 }
            if chr == "2" { num2 += 1 }
            if chr == "3" { num3 += 1 }
            if chr == "4" { num4 += 1 }
            if chr == "5" { num5 += 1 }
            if chr == "6" { num6 += 1 }
            if chr == "7" { num7 += 1 }
            if chr == "8" { num8 += 1 }
            if chr == "9" { num9 += 1 }
        }
        timesAry = [num1, num2, num3, num4, num5, num6, num7, num8, num9]
        //顯示數字的個數
        for i in 0...8 {
            
            circleImageView[i].image = UIImage(named: "c" + String(timesAry[i]))
        }
        //數字連線
        if num2 > 0 && num4 > 0 {  line24ImageView.isHidden = false }
        if num2 > 0 && num6 > 0 { line26ImageView.isHidden = false }
        if num4 > 0 && num8 > 0 { line48ImageView.isHidden = false }
        if num6 > 0 && num8 > 0 { line68ImageView.isHidden = false }
        if num1 > 0 && num2 > 0 && num3 > 0 { line123ImageView.isHidden = false }
        if num1 > 0 && num4 > 0 && num7 > 0 { line147ImageView.isHidden = false }
        if num1 > 0 && num5 > 0 && num9 > 0 { line159ImageView.isHidden = false }
        if num3 > 0 && num5 > 0 && num7 > 0 { line357ImageView.isHidden = false }
        if num3 > 0 && num6 > 0 && num9 > 0 { line369ImageView.isHidden = false }
        if num7 > 0 && num8 > 0 && num9 > 0 { line789ImageView.isHidden = false }
        if num2 > 0 && num5 > 0 && num8 > 0 { line258ImageView.isHidden = false }
        if num4 > 0 && num5 > 0 && num6 > 0 { line456ImageView.isHidden = false }
    }
    
    func numsToZero() {
        num1 = 0
        num2 = 0
        num3 = 0
        num4 = 0
        num5 = 0
        num6 = 0
        num7 = 0
        num8 = 0
        num9 = 0
    }
    
    
    
    

}

