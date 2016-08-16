//
//  FDSquareView.swift
//  FDRatingView
//
//  Created by Felix Deil on 15.05.16.
//  Copyright © 2016 Felix Deil. All rights reserved.
//

import UIKit

/**
 This `UIView` displays a square, that can be fully or partially filled.
 
 - author: Felix Deil
 */
internal class FDSquareView: FDRatingElementView {
    
    // - MARK: Private properties
    
    /**
     The layer that draws a fully filled square
     */
    private var fullSquare: CAShapeLayer!
    
    /**
     The layer that draws the border of a star
     */
    private var borderSquare: CAShapeLayer!
    
    override internal var tintColor: UIColor! {
        get {
            return UIColor.black
        }
        set (color) {
            fullSquare.fillColor = color.cgColor
            borderSquare.strokeColor = color.cgColor
        }
    }
    
    // - MARK: Initialize the View
    
    /**
     Initializes the `FDSquareView`
     
     - parameter frame: The frame for the view
     
     - parameter fillValue: `Float` bewteen 0 and 1
     
     - parameter color: The color of the square. Not the background of the view. Acts like `tintColor`
     
     - paramter lineWidth: The with of the border-line (default is 1, but for really small squares, lower values are recommended)
     
     - author: Felix Deil
     */
    internal init(frame: CGRect, fillValue fill: Float, color fillColor: UIColor, lineWidth: CGFloat) {
        super.init(frame: frame)
        
        //layer for complete filled star
        fullSquare = CAShapeLayer()
        fullSquare.path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: frame.size.height, height: frame.size.height)).cgPath
        fullSquare.fillColor = fillColor.cgColor
        self.layer.addSublayer(fullSquare)
        
        //layer for border
        borderSquare = CAShapeLayer()
        borderSquare.path = fullSquare.path
        borderSquare.fillColor = UIColor.clear.cgColor
        borderSquare.lineWidth = lineWidth
        borderSquare.strokeColor = fillColor.cgColor
        self.layer.addSublayer(borderSquare)
        
        
        //create fill-mask
        let fillWidth = frame.size.width * CGFloat(fill)
        let fillPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: fillWidth, height: frame.size.height), cornerRadius: 0)
        fillMask = CAShapeLayer()
        fillMask.path = fillPath.cgPath
        
        fullSquare.mask = fillMask
    }
    
    /**
     Initializes the `FDSquareView`
     
     - parameter frame: The frame for the view
     
     - parameter fillValue: `Float` bewteen 0 and 1
     
     - parameter color: The color of the square. Not the background of the view. Acts like `tintColor`
     
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
