//
//  EasySlider.swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2016 easymx
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import UIKit

class EasySlider: UISlider {
    
    /// The height of track
    var trackHeight: CGFloat = 2 {
        didSet {
            self.setThumbImage(self.thumbImage, forState: .Normal)
        }
    }
    
    /// The color of thumb
    override var thumbTintColor: UIColor? {
        didSet {
            self.thumbImage = self.generateThumbImage()
            self.setThumbImage(self.thumbImage, forState: .Normal)
        }
    }
    
    /// The size of thumb
    var thumbSize = CGSizeMake(2, 10) {
        didSet {
            self.thumbImage = self.generateThumbImage()
            self.setThumbImage(self.thumbImage, forState: .Normal)
        }
    }
   
    private var thumbImage: UIImage! = UIImage()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.thumbImage = self.generateThumbImage()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.thumbImage = self.generateThumbImage()
    }
    
    override func awakeFromNib() {
        self.setThumbImage(self.thumbImage, forState: .Normal)
    }
    
    override func trackRectForBounds(bounds: CGRect) -> CGRect {
        return CGRect(x: 0, y: 0, width: CGRectGetWidth(bounds), height: self.trackHeight)
    }
    
    override func thumbRectForBounds(bounds: CGRect, trackRect rect: CGRect, value: Float) -> CGRect {
        var newX = CGRectGetMinX(rect) + CGRectGetWidth(rect) * CGFloat(value)
        let newY = CGRectGetMinY(rect)
        
        if value == self.maximumValue {
            newX -= self.thumbSize.width
        }
        
        return CGRectMake(newX, newY, self.thumbSize.width, self.thumbSize.height)
    }
    
    private func generateThumbImage() -> UIImage {
        UIGraphicsBeginImageContext(self.thumbSize)
        let path = UIBezierPath(rect: CGRectMake(0, 0, self.thumbSize.width, self.thumbSize.height))
        self.thumbTintColor?.setFill()
        path.fill()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}
