//
//  FDRatingElementView.swift
//  FDRatingView
//
//  Created by Felix Deil on 15.05.16.
//  Copyright © 2016 Felix Deil. All rights reserved.
//

import UIKit

public protocol FDRatingViewValueEditable {
    func changeFillValue(_ value: Float, animated: Bool)
}

/**
 This class is a superclass for the elements to use in `FDRatingView`. It makes it easier to store them in an array and manages the cange of the fillValue.
 
 - author: Felix Deil
 */
internal class FDRatingElementView: UIView {
    
    /**
     The tintColor of the element
     */
    override internal var tintColor: UIColor! {
        get {
            return self.tintColor
        }
        set (color) {
            //just to exist ;-)
        }
    }
    
    /**
     An rectangular layer that is used as `mask` for `fullCircle`.
     
     - NOTE: The height should always be the same as the views frame height. Only modify the width!
     */
    internal var fillMask: CAShapeLayer!
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // - MARK: Modifying the fillValue
    
    /**
     Changes how much of the circle is filled.
     
     - WARNING: animation does NOT work yet!
     
     - parameter value: The new value
     
     - parameter animated: animations on or off (true/false)
     
     - author: Felix Deil
     */
    internal func changeFillValue(_ value: Float, animated: Bool) {
        let fillWidth = frame.size.width * CGFloat(value)
        let fillPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: fillWidth, height: frame.size.height), cornerRadius: 0)
        fillMask.path = fillPath.cgPath
    }
}
