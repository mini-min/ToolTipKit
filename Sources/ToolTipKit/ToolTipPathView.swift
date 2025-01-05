//
// ToolTipPathView.swift
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

import SnapKit
import UIKit

final class ToolTipPathView: UIView {
    
    // MARK: - Properties
    
    private var tipType: ToolTipView.TipType
    private var baseColor: UIColor
    
    private let arrowWidth: CGFloat = 10.0
    private let arrowHeight: CGFloat = 9.0
    
    // MARK: - UI Components
    
    private let tipPath = UIBezierPath()
    
    // MARK: - Life Cycles
    
    init(
        tipType: ToolTipView.TipType,
        color: UIColor
    ) {
        self.tipType = tipType
        self.baseColor = color
        super.init(frame: .zero)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        switch tipType {
        case .top: drawTopTip(rect)
        case .bottom: drawBottomTip(rect)
        case .left: drawLeftTip(rect)
        case .right: drawRightTip(rect)
        }
        setupTip()
    }
}

// MARK: - Private Extensions

private extension ToolTipPathView {
    func setupTip() {
        tipPath.lineJoinStyle = .round
        tipPath.lineWidth = 2
        tipPath.close()
        baseColor.setStroke()
        tipPath.stroke()
        baseColor.setFill()
        tipPath.fill()
    }
    
    /// When the tip is positioned at the top - pointing downward
    func drawTopTip(_ rect: CGRect) {
        tipPath.move(to: CGPoint(x: rect.midX - arrowWidth/2, y: rect.maxY - arrowHeight))
        tipPath.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        tipPath.addLine(to: CGPoint(x: rect.midX + arrowWidth/2, y: rect.maxY - arrowHeight))
    }
    
    /// When the tip is positioned at the bottom - pointing upward
    func drawBottomTip(_ rect: CGRect) {
        tipPath.move(to: CGPoint(x: rect.midX - arrowWidth/2, y: rect.minY + arrowHeight))
        tipPath.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        tipPath.addLine(to: CGPoint(x: rect.midX + arrowWidth/2, y: rect.minY + arrowHeight))
    }
    
    /// When the tip is positioned at the left - pointing right
    func drawLeftTip(_ rect: CGRect) {
        tipPath.move(to: CGPoint(x: rect.maxX - arrowHeight, y: rect.midY - arrowWidth/2))
        tipPath.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        tipPath.addLine(to: CGPoint(x: rect.maxX - arrowHeight, y: rect.midY + arrowWidth/2))
    }
    
    /// When the tip is positioned at the right - pointing left
    func drawRightTip(_ rect: CGRect) {
        tipPath.move(to: CGPoint(x: rect.minX + arrowHeight, y: rect.midY - arrowWidth/2))
        tipPath.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        tipPath.addLine(to: CGPoint(x: rect.minX + arrowHeight, y: rect.midY + arrowWidth/2))
    }
}
