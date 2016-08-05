//
//  DetailWordVC.swift
//  EnglishForKids
//
//  Created by HuuLuong on 7/30/16.
//  Copyright © 2016 CanhDang. All rights reserved.
//

import UIKit
import AVFoundation

class DetailWordVC: UIViewController {
    
    
    @IBOutlet weak var lbl_word: UILabel!
    
    @IBOutlet weak var imgView_wordImage: UIImageView!
    
    @IBOutlet weak var lbl_definition: UILabel!
    
    
    var wordText = String()
    var wordImage = UIImage()
    let speechSynthesizer = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl_word.text = wordText
        print(wordImage)
        imgView_wordImage.image = wordImage
        
        let path = NSBundle.mainBundle().pathForResource("DictList", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        
        lbl_definition.text = dict!["\(wordText)"] as! String
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func speak(sender: AnyObject) {
        let speechUtterrance = AVSpeechUtterance(string: wordText)
        
        speechUtterrance.rate = 0.3
        speechUtterrance.pitchMultiplier = 1
        speechUtterrance.volume = 0.75
        
        speechSynthesizer.speakUtterance(speechUtterrance)
    
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
