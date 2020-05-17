//
//  ZStackButtonView.swift
//  SwiftUICalculator
//
//  Created by Wen Hsin-Yu on 2020/5/8.
//  Copyright © 2020 Wen Hsin-Yu. All rights reserved.
//

import SwiftUI

struct ZStackButtonView: View {
    let title: String
    let fontSize: CGFloat = 38
    let size: CGSize
    let backgroundColorName: String
//    let action: () -> Void
    var body: some View {
        ZStack {
            Circle()
                .fill(Color(backgroundColorName))
                .frame(width: size.width, height: size.height)

            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(.white)
        }
    }
}

//struct ZStackButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStackButtonView(.)
//    }
//}
