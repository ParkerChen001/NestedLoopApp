//
//  ViewController.swift
//  NestedLoopApp
//
//  Created by Parker Chen on 2021/6/1.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segShape: UISegmentedControl!
    @IBOutlet weak var lbDisplay: UILabel!
    @IBOutlet weak var sldQty: UISlider!
    @IBOutlet weak var lbQty: UILabel!
    @IBOutlet weak var lbDisplayType: UILabel!
    var selectedSegment = 0
    var preSelectSeg = 999
    let fontSizeBase = 300
    
    let materialArray = [
        "🍄","🐚","🍀","🌷","🌿","🌼","🥝","🍉","🍌","🍏","🍋","🍐","🍆",
        "🥑","🍇","🌶","🍊","🍒","🌽","🧅","🥚","🥨","🍖","🍕","🌭","🍤",
        "🥟","🥮","🍧","🍡","🍩","💰","💎" ]
    
    enum ShapeType : Int {
        case first = 0
        case second = 1
        case third = 2
        case forth = 3
    }
    var content = ""
    var selectModeOfCont = 0    //select mode of continuous mode
    var number = 1
    var preNum = 1
    var idxImage1 = 0
    var idxImage2 = 0
    var swCase = 0
    let modeType = ["🔹","🔺"]
    let squareType = [
        "清一色","一線天","右斜線","左斜線","X字型","十字型","實心型","交錯型","條狀型"]
    let triangleType = [
        "正三角","倒三角","對半型","梯形體","菱形體","六角錐","堆疊型"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        sldQty.isContinuous = false
        sldQty.setThumbImage(UIImage(named: "icon-cony"), for: .normal)
        drawIcons()
    }
    //正方形
    func square() {
        if selectedSegment != ShapeType.third.rawValue {
            randomSquare()
        }
        calFontSize()
        for i in 1...number {
            for j in 1...number {
                switch swCase {
                case 0:
                    content += materialArray[idxImage1]
                case 1:
                    if i == 1 {
                        content += materialArray[idxImage1]
                    } else {
                        content += materialArray[idxImage2]
                    }
                case 2:
                    if i == j {
                        content += materialArray[idxImage1]
                    } else {
                        content += materialArray[idxImage2]
                    }
                case 3:
                    if i + j == number + 1 {
                        content += materialArray[idxImage1]
                    } else {
                        content += materialArray[idxImage2]
                    }
                case 4:
                    if i == j || i + j == number + 1 {
                        content += materialArray[idxImage1]
                    } else {
                        content += materialArray[idxImage2]
                    }
                case 5:
                    let tempNum = (number + 1) / 2
                    if i == tempNum || j == tempNum {
                        content += materialArray[idxImage1]
                    } else {
                        content += materialArray[idxImage2]
                    }
                case 6:
                    if i == 1 || j == 1 || i == number || j == number {
                        content += materialArray[idxImage1]
                    } else {
                        content += materialArray[idxImage2]
                    }
                case 7:
                    if (i + j) % 2 == 1 {
                        content += materialArray[idxImage1]
                    } else {
                        content += materialArray[idxImage2]
                    }
                case 8:
                    content += materialArray[idxImage1]
                    if(j == number) {
                        idxImage1 = Int.random(in: 0..<materialArray.count)
                    }
                default:
                    break
                }
            }
            if(i != number) {   //to avoid the last "\n" make picture bad
                content += "\n"
            }
        }
        lbDisplay.text = content
    }
    func randomSquare() {
        swCase = Int.random(in: 0...8)
        lbDisplayType.text = String("\(modeType[selectModeOfCont])\(swCase+1):\(squareType[swCase])")
        lbDisplayType.textColor = .blue
    }
    //三角形
    func triangle() {
        if selectedSegment != ShapeType.third.rawValue {
            randomTriangle()
        }
        calFontSize()
        switch swCase {
        case 0:
            for i in 1...number {
                for _ in 1...i {
                    content += materialArray[idxImage1]
                }
                if(i != number) {   //to avoid the last "\n" make picture bad
                    content += "\n"
                }
            }
        case 1:
            for i in 1...number {
                for _ in i...number {
                    content += materialArray[idxImage1]
                }
                if(i != number) {   //to avoid the last "\n" make picture bad
                    content += "\n"
                }
            }
        case 2:
            for i in 1...number {
                for j in 1...number {
                    if i > j {
                        content += materialArray[idxImage1]
                    } else {
                        content += materialArray[idxImage2]
                    }
                }
                if(i != number) {   //to avoid the last "\n" make picture bad
                    content += "\n"
                }
            }
        case 3:
            for i in 1...number {
                for _ in i..<number {
                    content += materialArray[idxImage1]
                }
                let tempNum = i * 2 - 1
                for _ in 1...tempNum {
                    content += materialArray[idxImage2]
                }
                if(i != number) {   //to avoid the last "\n" make picture bad
                    content += "\n"
                }
            }
        case 4:
            var catCount = 1
            for i in 1...number*2-1 {
                for _ in 1...catCount {
                    content += materialArray[idxImage1]
                }
                if i < number {
                    catCount = catCount + 1
                } else {
                   catCount = catCount - 1
                }
                if(i != (number*2-1)) {   //to avoid the last "\n" make picture bad
                    content += "\n"
                }
            }
        case 5:
            var birdCount = number - 1
            var catCount = 1
            for i in 1...number*2-1 {
                for _ in 0..<birdCount {
                    content += materialArray[idxImage1]
                }
                for _ in 1...catCount {
                    content += materialArray[idxImage2]
                }
                if i < number {
                    birdCount = birdCount - 1
                    catCount = catCount + 2
                } else {
                    birdCount = birdCount + 1
                    catCount = catCount - 2
                }
                if(i != (number*2-1)) {   //to avoid the last "\n" make picture bad
                    content += "\n"
                }
            }
        case 6:
            for i in 1...number {
                for j in 1...i {
                    content += materialArray[idxImage1]
                    if(j == i) {
                        idxImage1 = Int.random(in: 0..<materialArray.count)
                    }
                }
                if(i != number) {   //to avoid the last "\n" make picture bad
                    content += "\n"
                }
            }
        default:
            break
        }
        lbDisplay.text = content
    }
    func randomTriangle() {
        swCase = Int.random(in: 0...6)
        lbDisplayType.text = String("\(modeType[selectModeOfCont])\(swCase+1):\(triangleType[swCase])")
        lbDisplayType.textColor = .red
    }
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        selectedSegment = sender.selectedSegmentIndex
        drawIcons()
    }
    @IBAction func sliderQtyAction(_ sender: UISlider) {
        sender.value = sender.value.rounded()
        number = Int(sender.value)
        if preNum != number {
            preNum = number
            drawIcons()
        }
    }
    func drawIcons() {
        lbQty.text = String(number)
        content = ""
        switch selectedSegment {
        case ShapeType.first.rawValue:
            preSelectSeg = selectedSegment
            selectModeOfCont = selectedSegment
            randomImage()
            square()
        case ShapeType.second.rawValue:
            preSelectSeg = selectedSegment
            selectModeOfCont = selectedSegment
            randomImage()
            triangle()
        case ShapeType.third.rawValue:
            continuous()
        case ShapeType.forth.rawValue:
            break
        default:
            break
        }
    }
    func continuous() {
        if ((number == 1) || (preSelectSeg != selectedSegment))
        {
            //for different mode ,to reset the slider value (number) = 1
            preSelectSeg = selectedSegment
            //keep working
            randomImage()
            selectModeOfCont = Int.random(in: 0..<2)
            switch selectModeOfCont {
            case ShapeType.first.rawValue:
                randomSquare()
                square()
            case ShapeType.second.rawValue:
                randomTriangle()
                triangle()
            default:
                break
            }
        } else {
            switch selectModeOfCont {
            case ShapeType.first.rawValue:
                square()
            case ShapeType.second.rawValue:
                triangle()
            default:
                break
            }
        }
    }
    func randomImage() {
        idxImage1 = Int.random(in: 0..<materialArray.count)
        idxImage2 = Int.random(in: 0..<materialArray.count)
    }
    func calFontSize() {
        if ((selectedSegment == ShapeType.second.rawValue) ||
                (selectModeOfCont == ShapeType.second.rawValue))
            {
            switch swCase {
            case 3,5:
                lbDisplay.font = lbDisplay.font.withSize(CGFloat(fontSizeBase/number/5*2))
            case 4:
                lbDisplay.font = lbDisplay.font.withSize(CGFloat(fontSizeBase/number/2))
            default:
                lbDisplay.font = lbDisplay.font.withSize(CGFloat(fontSizeBase/number))
            }
        } else {
            lbDisplay.font = lbDisplay.font.withSize(CGFloat(fontSizeBase/number))
        }
    }
}
