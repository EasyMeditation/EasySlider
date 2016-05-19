//
//  ViewController.swift
//  Demo
//
//  Created by tqtifnypmb on 5/19/16.
//  Copyright © 2016 easymx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var trackHeight: UITextField!
    @IBOutlet weak var thumbHeight: UITextField!
    @IBOutlet weak var thumbWidth: UITextField!
    @IBOutlet weak var easySlider: EasySlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func thumbWidthClicked(sender: AnyObject) {
        let h = Float(thumbWidth.text!)!
        self.easySlider.thumbSize = CGSizeMake(CGFloat(h), self.easySlider.thumbSize.height)
    }
    
    @IBAction func thumbHeightClicked(sender: AnyObject) {
        let h = Float(thumbHeight.text!)!
        self.easySlider.thumbSize = CGSizeMake(self.easySlider.thumbSize.width, CGFloat(h))
    }
    
    @IBAction func trackHeightClicked(sender: AnyObject) {
        let h = Float(trackHeight.text!)!
        self.easySlider.trackHeight = CGFloat(h)
    }
    
    @IBAction func grayClicked(sender: AnyObject) {
        self.easySlider.thumbTintColor = UIColor.grayColor()
    }
    
    @IBAction func redClicked(sender: AnyObject) {
        self.easySlider.thumbTintColor = UIColor.redColor()
    }
    
    @IBAction func blueClicked(sender: AnyObject) {
        self.easySlider.thumbTintColor = UIColor.blueColor()
    }
    
    @IBAction func sliderClicked(sender: AnyObject) {
        print(self.easySlider.value)
    }
}

