//
//  ToolTipPathView.swift
//  ToolTipKit
//
//  Created by 민 on 1/4/25.
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
