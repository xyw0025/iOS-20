//
//  CalculatorButtonRow.swift
//  SwiftUICalculator
//
//  Created by Wen Hsin-Yu on 2020/5/8.
//  Copyright © 2020 Wen Hsin-Yu. All rights reserved.
//

import SwiftUI

struct CalculatorButtonRow: View {
    let row: [CalculatorButtonItem]
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { item in
                CalculatorButton(title: item.title, size: item.size, backgroundColorName: item.backgroundColor) {
                    print(item.title)
                }
            }
        }
    }
}



struct CalculatorButtonRow_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButtonRow(row: [.digit(1), .dot])
    }
}
