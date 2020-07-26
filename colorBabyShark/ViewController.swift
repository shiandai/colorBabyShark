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
    
    @IBOutlet weak var redSliderShow: UILabel!
    @IBOutlet weak var greenSliderShow: UILabel!
    @IBOutlet weak var blueSliderShow: UILabel!
    
    @IBOutlet weak var gradientSwitch: UISwitch!
    @IBOutlet weak var originalButton: UIButton!
    @IBOutlet weak var randombutton: UIButton!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //將HeadColorView改形狀並
        var image = UIImage(named: "baby_shark_head")
        let headView = UIImageView(image: image)
        headView.frame = headColor.bounds
        headView.contentMode = .scaleAspectFit
        headColor.mask = headView
        
        //將BodyColorView改形狀
        image = UIImage(named: "baby_shark_body")
        let bodyView = UIImageView(image: image)
        bodyView.frame = bodyColor.bounds
        bodyView.contentMode = .scaleAspectFit
        bodyColor.mask = bodyView
        
        //設定初始Slider數值
        redSlider.value = 254
        greenSlider.value = 212
        blueSlider.value = 3
        colorChange()
        
    }
    
    func gradientColorChange(){
        
    }
    
    func colorChange() {
        if gradientSwitch.isOn{
            let headLayer = CAGradientLayer()
            headLayer.frame = headColor.bounds
            headLayer.colors = [CGColor(srgbRed: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: 1.0),CGColor(srgbRed: CGFloat(0.2), green: CGFloat(0.2), blue: CGFloat(0.2), alpha: 1.0)]
            headLayer.startPoint = CGPoint(x: 0, y: 0)
            headLayer.endPoint = CGPoint(x: 1, y: 1)
            headColor.layer.addSublayer(headLayer)
            headColor.backgroundColor = nil
            
            let bodyLayer = CAGradientLayer()
            bodyLayer.frame = bodyColor.bounds
            bodyLayer.colors = [CGColor(srgbRed: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: 1.0),CGColor(srgbRed: CGFloat(0.2), green: CGFloat(0.2), blue: CGFloat(0.2), alpha: 1.0)]
            bodyColor.layer.addSublayer(bodyLayer)
            bodyColor.backgroundColor = nil
        }
        
        //變更頭部還有身體顏色
        else {
            headColor.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: 1.0)
            bodyColor.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: 1.0)
        }
        //變更Slider顯示數字
        redSliderShow.text = String(Int(redSlider.value))
        greenSliderShow.text = String(Int(greenSlider.value))
        blueSliderShow.text = String(Int( blueSlider.value))
    }
    
    //設定Slider調整顏色
    @IBAction func colorChange(_ sender: UISlider) {
        colorChange()
    }
    
    //原始顏色
    @IBAction func originalColor(_ sender: UIButton) {
        redSlider.value = 254
        greenSlider.value = 212
        blueSlider.value = 3
        colorChange()
    }
    
    //隨機顏色
    @IBAction func randomColor(_ sender: UIButton) {
        redSlider.value = Float.random(in: 0...255)
        blueSlider.value = Float.random(in: 0...255)
        greenSlider.value = Float.random(in: 0...255)
        colorChange()
    }
    
    //漸層顏色
    @IBAction func gradientSwitch(_ sender: UISwitch){
        if gradientSwitch.isOn{
            colorChange()
        }
        else {
            headColor.layer.sublayers?.removeAll()
            bodyColor.layer.sublayers?.removeAll()
            colorChange()
        }
    }
}

