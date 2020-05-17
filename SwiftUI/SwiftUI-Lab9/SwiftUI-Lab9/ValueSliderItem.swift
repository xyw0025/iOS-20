//
//  SliderItem.swift
//  SwiftUI-Lab9
//
//  Created by Wen Hsin-Yu on 2020/5/12.
//  Copyright © 2020 Wen Hsin-Yu. All rights reserved.
//

import Foundation
import SwiftUI

enum ValueSliderItem {
    case opacity(CGFloat)
    case borderWidth(CGFloat)
}

extension ValueSliderItem: Hashable {
    var title: String {
        switch self {
        case .opacity(let value):
            return "Opacity"
        case .borderWidth(let value):
            return "Border Width"
        }
    }

    var value: CGFloat {
        switch self {
        case .opacity(let value):
            return value
        case .borderWidth(let value):
            return value
        }
    }
}

