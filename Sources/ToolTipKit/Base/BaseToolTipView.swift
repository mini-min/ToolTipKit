//
// BaseToolTipView.swift
//
// Copyright (c) 2025 Minjae Lee
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
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
