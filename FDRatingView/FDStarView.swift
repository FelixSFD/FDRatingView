//
//  FDStarView.swift
//  FDRatingView
//
//  Created by Felix Deil on 11.05.16.
//  Copyright © 2016 Felix Deil. All rights reserved.
//

import UIKit

/**
 This `UIView` displays a star, that can be fully or partially filled.
 
 - author: Felix Deil
 */
internal class FDStarView: FDRatingElementView {
    
    // - MARK: Private properties
    
    /**
     The layer that draws a fully filled star
     */
    private var fullStar: CAShapeLayer!
    
    /**
     The layer that draws the border of a star
     */
    private var borderStar: CAShapeLayer!
    
    override internal var tintColor: FDColor! {
        get {
            return FDColor.black
        }
        set (color) {
            fullStar.fillColor = color.cgColor
            borderStar.strokeColor = color.cgColor
        }
    }
    
    // - MARK: Initialize the View
    
    /**
     Initializes the `FDStarView`
     
     - parameter frame: The frame for the view
     
     - parameter fillValue: `Float` bewteen 0 and 1
     
     - parameter color: The color of the star. Not the background of the view. Acts like `tintColor`
     
     - paramter lineWidth: The with of the border-line (default is 1, but for really small stars, lower values are recommended)
     
     - author: Felix Deil
     */
    internal init(frame: CGRect, fillValue fill: Float, color fillColor: FDColor, lineWidth: CGFloat) {
        super.init(frame: frame)
        
        //layer for complete filled star
        fullStar = CAShapeLayer()
        fullStar.path = Star().CGPathInRect(frame)
        fullStar.fillColor = fillColor.cgColor
        self.layer.addSublayer(fullStar)
        
        //layer for border
        borderStar = CAShapeLayer()
        borderStar.path = fullStar.path
        borderStar.fillColor = UIColor.clear.cgColor
        borderStar.lineWidth = lineWidth
        borderStar.strokeColor = fillColor.cgColor
        self.layer.addSublayer(borderStar)
        
        
        //create fill-mask
        let fillWidth = frame.size.width * CGFloat(fill)
        let fillPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: fillWidth, height: frame.size.height), cornerRadius: 0)
        fillMask = CAShapeLayer()
        fillMask.path = fillPath.cgPath
        
        fullStar.mask = fillMask
    }
    
    /**
     Initializes the `FDStarView`
     
     - parameter frame: The frame for the view
     
     - parameter fillValue: `Float` bewteen 0 and 1
     
     - parameter color: The color of the star. Not the background of the view. Acts like `tintColor`
     
     - author: Felix Deil
     */
    internal convenience init(frame: CGRect, fillValue fill: Float, color fillColor: FDColor) {
        self.init(frame:frame, fillValue: fill, color: fillColor, lineWidth: 1)
    }
    
    /**
     Initializes the view with a frame
     */
    override private init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = FDColor.clear
        tintColor = FDView().tintColor
    }
    
    required internal init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
