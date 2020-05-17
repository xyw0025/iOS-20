//
//  ContentView.swift
//  SwiftUICalculator
//
//  Created by Wen Hsin-Yu on 2020/5/8.
//  Copyright © 2020 Wen Hsin-Yu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let scale: CGFloat = UIScreen.main.bounds.width / 414
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Text("0")
                .font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .frame(minWidth:0,
                       maxWidth: .infinity,
                       alignment: .trailing)
                .padding(.trailing, 24)
                .lineLimit(1)
            CalculatorButtonPad()
                .padding(.bottom)
        }
    .scaleEffect(scale)
    }
}


struct CalculatorButton: View {
    let title: String
    let fontSize: CGFloat = 38
    let size: CGSize
    let backgroundColorName: String
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(.white)
                .padding()
                .frame(width: size.width, height: size.height)
                .background(Color(backgroundColorName))
                .cornerRadius(size.width / 2)
        }
    }
}

struct CalculatorButtonPad: View {
    let pad: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip), .command(.percent), .op(.divide)], [.digit(7), .digit(8), .digit(9), .op(.multiply)], [.digit(4), .digit(5), .digit(6), .op(.minus)], [.digit(1), .digit(2), .digit(3), .op(.plus)], [.digit(0), .dot, .op(.equal)]
    ]
    var body: some View {
        VStack(spacing: 8) {
            ForEach(pad, id: \.self) { row in CalculatorButtonRow(row: row)

            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
//            ContentView().previewDevice("iPhone SE")
        }
    }
}
