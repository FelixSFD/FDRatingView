//
//  CrossPlatformCompatibility.swift
//  FDRatingView
//
//  Created by Felix Deil on 10.10.16.
//  Copyright © 2016 Felix Deil. All rights reserved.
//

// This file defines some typaliases and classes to make FDRatingView compatible with iOS and macOS

import Foundation

// Imports

#if os(iOS)
    import UIKit
#else
    import AppKit
#endif

// Colors

#if os(iOS)
    public typealias FDColor = UIColor
#else
    public typealias FDColor = NSColor
#endif

// Views

#if os(iOS)
    public typealias FDViewWrapper = UIView
#else
    public typealias FDViewWrapper = NSView
#endif

public class FDView: FDViewWrapper {
    #if os(iOS)
    public var isFlipped: Bool {
        return true
    }
    #else
    override public var isFlipped: Bool {
        return true
    }
    #endif
}


// BezierPath

#if os(iOS)
    public typealias FDBezierPath = UIBezierPath
#else
    public typealias FDBezierPath = NSBezierPath
#endif
