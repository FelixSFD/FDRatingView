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
    
    /**
     Initializes the `FDRatingView` with all parameters.
     
     - parameter frame: The frame for the view
     
     - parameter numberOfStars: The number of start to be displayed (usually, that is NOT the rating=
     
     - parameter fillValue: The value, how much of the stars should be filled. (the rating) This should be a `Float` between `0` and `numberOfStars`
     
     - parameter color: The color of the `FDStarView`s (acts like `tintColor`)
     
     - parameter lineWidth: The with of the outer line of the stars
     
     - parameter spacing: The space between the `FDStarView`s
     
     - author: Felix Deil
     */
    public init(frame newFrame:CGRect, numberOfStars starsCount:UInt, fillValue value:Float, color:UIColor, lineWidth:CGFloat, spacing:CGFloat) {
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
            
            stars.append(FDStarView(frame: starFrame, fillValue: tmpRating, color: color, lineWidth: lineWidth))
            xOffset += CGFloat(height + spacing)
        }
        
        
        //add them as subview (and set fillValue)
        for star in stars {
            addSubview(star)
        }
    }
    
    /**
     Initializes the `FDRatingView`
     
     - parameter frame: The frame for the view
     
     - parameter numberOfStars: The number of start to be displayed (usually, that is NOT the rating=
     
     - parameter fillValue: The value, how much of the stars should be filled. (the rating) This should be a `Float` between `0` and `numberOfStars`
     
     - parameter color: The color of the `FDStarView`s (acts like `tintColor`)
     
     - parameter lineWidth: The with of the outer line of the stars
     
     - author: Felix Deil
     */
    public convenience init(frame newFrame:CGRect, numberOfStars starsCount:UInt, fillValue value:Float, color:UIColor, lineWidth:CGFloat) {
        self.init(frame: newFrame, numberOfStars: starsCount, fillValue: value, color: color, lineWidth: lineWidth, spacing: 8.0)
    }
    
    /**
     Initializes the `FDRatingView`
     
     - parameter frame: The frame for the view
     
     - parameter numberOfStars: The number of start to be displayed (usually, that is NOT the rating=
     
     - parameter fillValue: The value, how much of the stars should be filled. (the rating) This should be a `Float` between `0` and `numberOfStars`
     
     - parameter color: The color of the `FDStarView`s (acts like `tintColor`)
     
     - author: Felix Deil
     */
    public convenience init(frame newFrame:CGRect, numberOfStars starsCount:UInt, fillValue value:Float, color:UIColor) {
        self.init(frame: newFrame, numberOfStars: starsCount, fillValue: value, color: color, lineWidth: 1)
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
