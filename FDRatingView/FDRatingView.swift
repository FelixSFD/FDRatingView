//
//  FDRatingView.swift
//  FDRatingView
//
//  Created by Felix Deil on 11.05.16.
//  Copyright © 2016 Felix Deil. All rights reserved.
//

import UIKit

/**
 This view displays multiple `FDStarView` next to each other and fills them depending on the rating.
 
 - author: Felix Deil
 */
public class FDRatingView:UIView {
    
    // - MARK: Public properties
    
    /**
     The number of stars to display (default is 5)
     */
    public var numberOfStars:UInt = 5
    
    override public var tintColor:UIColor! {
        get {
            return UIColor.blackColor()
        }
        set (color) {
            for star in stars {
                star.tintColor = color
            }
        }
    }
    
    
    // - MARK: Private properties
    
    /**
     Stores all displayed stars in an `[FDStarView]`-array
     */
    private var stars:[FDStarView]! = [FDStarView]()
    
    
    // - MARK: Initializers
    
    
    /*public init(frame newFrame:CGRect, numberOfStars starsCount:UInt) {
        
    }*/
    
    public init(frame newFrame:CGRect, numberOfStars starsCount:UInt, fillValue value:Float, color:UIColor) {
        var new = newFrame
        let starsFloat = CGFloat(starsCount)
        new.size.width = (newFrame.size.height + 8) * starsFloat - 8
        super.init(frame: new)
        
        tintColor = color
        
        let height = new.size.height
        var xOffset = CGFloat(0)
        
        var ratingValue = value
        
        //create stars and store them in the array
        for _ in 1...starsCount {
            let starFrame = CGRectMake(xOffset, 0.0, height, height)
            
            var tmpRating:Float = 0
            
            if ratingValue > 1 {
                tmpRating = 1
                ratingValue -= 1
            } else if ratingValue > 0 {
                tmpRating = ratingValue
                ratingValue = 0
            }
            
            stars.append(FDStarView(frame: starFrame, fillValue: tmpRating, color: color))
            xOffset += CGFloat(height + 8)
        }
        
        
        //add them as subview (and set fillValue)
        for star in stars {
            addSubview(star)
        }
    }
    
    /**
     Initializes the view with a frame
     */
    override private init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.clearColor()
        tintColor = UIView().tintColor
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
