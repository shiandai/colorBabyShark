//
//  ViewController.swift
//  colorBabyShark
//
//  Created by Owen on 2020/7/24.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var headColor: UIView!
    @IBOutlet weak var bodyColor: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var gradientSwitch: UISwitch!
    @IBOutlet weak var redSliderValue: UILabel!
    @IBOutlet weak var greenSliderValue: UILabel!
    @IBOutlet weak var blueSliderValue: UILabel!
    @IBOutlet weak var originalButton: UIButton!
    @IBOutlet weak var randombutton: UIButton!
    
    //初始BabyShark顏色
    var babySharkRed:Float = 254/255
    var babySharkGreen:Float = 212/255
    var babySharkBlue:Float = 3/255
    var babySharkAlpha:Float = 1.0
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //將HeadColorView改形狀並設定初始顏色
        var image = UIImage(named: "baby_shark_head")
        let headView = UIImageView(image: image)
        headView.frame = headColor.bounds
        headView.contentMode = .scaleAspectFit
        headColor.mask = headView
        headColor.backgroundColor = UIColor(red: CGFloat(babySharkRed), green: CGFloat(babySharkGreen), blue: CGFloat(babySharkBlue), alpha: 1)
        
        //將BodyColorView改形狀並設定初始顏色
        image = UIImage(named: "baby_shark_body")
        let bodyView = UIImageView(image: image)
        bodyView.frame = bodyColor.bounds
        bodyView.contentMode = .scaleAspectFit
        bodyColor.mask = bodyView
        bodyColor.backgroundColor = UIColor(red: CGFloat(babySharkRed), green: CGFloat(babySharkGreen), blue: CGFloat(babySharkBlue), alpha: 1)
        
        //設定初始Slider數值
        redSlider.value = 254
        greenSlider.value = 212
        blueSlider.value = 3

    }
    
    //設定Slider調整顏色
    @IBAction func colorChange(_ sender: UISlider) {
        babySharkRed = redSlider.value/255
        babySharkBlue = blueSlider.value/255
        babySharkGreen = greenSlider.value/255
        headColor.backgroundColor = UIColor(red: CGFloat(babySharkRed), green: CGFloat(babySharkGreen), blue: CGFloat(babySharkBlue), alpha: 1)
        bodyColor.backgroundColor = UIColor(red: CGFloat(babySharkRed), green: CGFloat(babySharkGreen), blue: CGFloat(babySharkBlue), alpha: 1)
        redSliderValue.text = String(format: "%.0f", redSlider.value)
        greenSliderValue.text = String(format: "%.0f", greenSlider.value)
        blueSliderValue.text = String(format: "%.0f", blueSlider.value)
    }
    
    //原始顏色
    @IBAction func originalColor(_ sender: UIButton) {
        redSlider.value = 254
        greenSlider.value = 212
        blueSlider.value = 3
        headColor.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(babySharkGreen/255), blue: CGFloat(blueSlider.value/255), alpha: 1)
        bodyColor.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(babySharkGreen/255), blue: CGFloat(blueSlider.value/255), alpha: 1)
        redSliderValue.text = String(format: "%.0f", redSlider.value)
        greenSliderValue.text = String(format: "%.0f", greenSlider.value)
        blueSliderValue.text = String(format: "%.0f", blueSlider.value)
    }
    
    //隨機顏色
    @IBAction func randomColor(_ sender: Any) {
        redSlider.value = Float.random(in: 0...255)
        blueSlider.value = Float.random(in: 0...255)
        greenSlider.value = Float.random(in: 0...255)
        headColor.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(babySharkGreen), blue: CGFloat(blueSlider.value/255), alpha: 1)
        bodyColor.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(babySharkGreen), blue: CGFloat(blueSlider.value/255), alpha: 1)
        redSliderValue.text = String(format: "%.0f", redSlider.value)
        greenSliderValue.text = String(format: "%.0f", greenSlider.value)
        blueSliderValue.text = String(format: "%.0f", blueSlider.value)
    }
}

