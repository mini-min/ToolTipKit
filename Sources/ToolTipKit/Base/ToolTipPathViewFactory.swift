//
//  ToolTipPathViewFactory.swift
//  ToolTipKit
//
//  Created by 민 on 1/5/25.
//

import UIKit

struct ToolTipPathViewFactory {
    
    @MainActor
    static func makeToolTipPathView(
        tipType: ToolTipView.TipType,
        color: UIColor
    ) -> ToolTipPathView {
        return ToolTipPathView(tipType: tipType, color: color)
    }
    
}
