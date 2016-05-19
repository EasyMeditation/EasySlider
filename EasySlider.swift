//
//  EasySlider.swift
//  EasyMXProgressView
//
//  Created by 王荣荣 on 5/19/16.
//  Copyright © 2016 王荣荣. All rights reserved.
//

import UIKit

class EasySlider: UISlider {
    
    var sliderHeight: CGFloat = 4
   
    private let thumbImage = UIImage(named: "indicator")!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        self.setThumbImage(self.thumbImage, forState: .Normal)
    }
    
    override func trackRectForBounds(bounds: CGRect) -> CGRect {
        return CGRect(x: 0, y: 0, width: bounds.size.width, height: sliderHeight)
    }
    override func thumbRectForBounds(bounds: CGRect, trackRect rect: CGRect, value: Float) -> CGRect {
        print(value)
        var newX:CGFloat = 0
        if value == 1 {
            newX = rect.origin.x - self.thumbImage.size.width / 2
        }else if value == 0{
            newX = rect.origin.x + self.thumbImage.size.width / 2
        }
        
        let newWidth = rect.size.width
        let newY = bounds.origin.y +  self.thumbImage.size.height / 2 - sliderHeight / 2
        let newHight = rect.size.height
        let newRect = CGRectMake(newX, newY, newWidth, newHight)
        return super.thumbRectForBounds(bounds, trackRect: newRect, value: value)
    }

}
