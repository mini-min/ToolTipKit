//
//  BaseToolTipView.swift
//  ToolTipKit
//
//  Created by 민 on 1/4/25.
//

import UIKit

@MainActor
protocol BaseToolTipView where Self: UIView {
    
    /// A Boolean value indicating whether the Tip View is currently showing.
    var isShow: Bool { get }
    
    /// The background color of the Tip View.
    var baseBackgroundColor: UIColor! { get set }
    
    /// The foreground color of the Tip View, typically used for text.
    var baseForegroundColor: UIColor! { get set }
    
    /// Show the Tip view with Animation
    func show()
    
    /// Hide the Tip view with Animation
    func hide()
    
    /// Show the Tip view and automatically close it after a specific duration with Animation
    func showWithTimeout(duration: Int)
}
