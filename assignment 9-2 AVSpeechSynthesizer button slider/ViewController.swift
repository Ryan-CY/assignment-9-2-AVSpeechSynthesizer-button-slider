//
//  ViewController.swift
//  assignment 9-2 AVSpeechSynthesizer button slider
//
//  Created by Ryan Lin on 2022/8/30.
//
import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    //輸入TextField,語速 音調 音量的Slider n Label
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var rateSlider: UISlider!
    @IBOutlet weak var pitchSlider: UISlider!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var pitchLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    
    //輸入語言切換的 SegmentedControl
    @IBOutlet weak var switchLanguage: UISegmentedControl!
    
    //輸入動物 button
    @IBOutlet weak var catopusbutton: UIButton!
    @IBOutlet weak var unipigbutton: UIButton!
    @IBOutlet weak var frozenbeebutton: UIButton!
 
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //讀取輸入的話
    @IBAction func speakingButton(_ sender: Any) {
        let utterance = AVSpeechUtterance(string: inputText.text!)
        
        //設定由各自Slider調控語速、音調、音量
        utterance.rate = rateSlider.value
        utterance.pitchMultiplier = pitchSlider.value
        utterance.volume = volumeSlider.value
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
        
    }
    //讓Label顯示對應的Slider的數值
    @IBAction func changeRate(_ sender: UISlider) {
        rateLabel.text = String(format: "%.2f", sender.value)
    }
    @IBAction func changePitch(_ sender: UISlider) {
        pitchLabel.text = String(format: "%.2f", sender.value)
    }
    @IBAction func changeVolume(_ sender: UISlider) {
        volumeLabel.text = String(format: "%.2f", sender.value)
    }
    
    //把三個動物的Button拉到同一個IBAction內
    @IBAction func SpeakAnimalNames(_ sender: UIButton) {
        //把型別AVSpeechUtterance()存到變數animalName裡
        var animalName = AVSpeechUtterance()
        //設定按鈕對應不同的segmented Control，說出不同語言的動物名字
        if switchLanguage.selectedSegmentIndex == 0 {
            
            if sender == catopusbutton {
                animalName = AVSpeechUtterance(string: "章魚貓")
            }
            if sender == unipigbutton {
                animalName = AVSpeechUtterance(string: "獨角豬")
            }
            if sender == frozenbeebutton {
                animalName = AVSpeechUtterance(string: "鑽石蜂")
            }
            animalName.voice = AVSpeechSynthesisVoice(language: "zh-TW")
      
        } else if switchLanguage.selectedSegmentIndex == 1 {
            
            if sender == catopusbutton {
                animalName = AVSpeechUtterance(string: "catopus")
            }
            if sender == unipigbutton {
                animalName = AVSpeechUtterance(string: "unipig")
            }
            if sender == frozenbeebutton {
                animalName = AVSpeechUtterance(string: "frozen bee")
            }
            animalName.voice = AVSpeechSynthesisVoice(language: "en-US")
        }
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(animalName)
    }
  
}

