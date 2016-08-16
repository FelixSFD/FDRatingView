//
//  FDCircleView.swift
//  FDRatingView
//
//  Created by Felix Deil on 21.05.16.
//  Copyright © 2016 Felix Deil. All rights reserved.
//

import UIKit

/**
 This `UIView` displays a circle, that can be fully or partially filled.
 
 - author: Felix Deil
 */
internal class FDCircleView: FDRatingElementView {
    
    // - MARK: Private properties
    
    
    
    /**
     The layer that draws a fully filled circle
     */
    private var fullCircle: CAShapeLayer!
    
    /**
     The layer that draws the border of a circle
     */
    private var borderCircle: CAShapeLayer!
    
    override internal var tintColor: UIColor! {
        get {
            return UIColor.black
        }
        set (color) {
            fullCircle.fillColor = color.cgColor
            borderCircle.strokeColor = color.cgColor
        }
    }
    
    // - MARK: Initialize the View
    
    /**
     Initializes the `FDCircleView`
     
     - parameter frame: The frame for the view
     
     - parameter fillValue: `Float` bewteen 0 and 1
     
     - parameter color: The color of the circle. Not the background of the view. Acts like `tintColor`
     
     - paramter lineWidth: The with of the border-line (default is 1, but for really small circles, lower values are recommended)
     
     - author: Felix Deil
     */
    internal init(frame: CGRect, fillValue fill: Float, color fillColor: UIColor, lineWidth: CGFloat) {
        super.init(frame: frame)
        
        //layer for complete filled star
        fullCircle = CAShapeLayer()
        fullCircle.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: frame.size.height, height: frame.size.height)).cgPath
        fullCircle.fillColor = fillColor.cgColor
        self.layer.addSublayer(fullCircle)
        
        //layer for border
        borderCircle = CAShapeLayer()
        borderCircle.path = fullCircle.path
        borderCircle.fillColor = UIColor.clear.cgColor
        borderCircle.lineWidth = lineWidth
        borderCircle.strokeColor = fillColor.cgColor
        self.layer.addSublayer(borderCircle)
        
        
        //create fill-mask
        let fillWidth = frame.size.width * CGFloat(fill)
        let fillPath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: fillWidth, height: frame.size.height))
        fillMask = CAShapeLayer()
        fillMask.path = fillPath.cgPath
        
        fullCircle.mask = fillMask
    }
    
    /**
     Initializes the `FDCircleView`
     
     - parameter frame: The frame for the view
     
     - parameter fillValue: `Float` bewteen 0 and 1
     
     - parameter color: The color of the circle. Not the background of the view. Acts like `tintColor`
     
     - author: Felix Deil
     */
    internal convenience init(frame: CGRect, fillValue fill: Float, color fillColor: UIColor) {
        self.init(frame:frame, fillValue: fill, color: fillColor, lineWidth: 1)
    }
    
    /**
     Initializes the view with a frame
     */
    override private init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.clear
        tintColor = UIView().tintColor
    }
    
    required internal init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
