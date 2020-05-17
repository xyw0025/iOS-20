//
//  ContentView.swift
//  SwiftUI-Lab9
//
//  Created by Wen Hsin-Yu on 2020/5/12.
//  Copyright © 2020 Wen Hsin-Yu. All rights reserved.
//

import SwiftUI
//var sliderValues : [String:CGFloat] = ["opacity": 1, "RGBRed": 0, "RGBGreen": 0, "RGBBlue": 0, "radius": 0]

struct ContentView: View {
    @State var opacityValue: CGFloat = 1
    @State var borderWidth: CGFloat = 0
    @State var bright: CGFloat = 0
    @State var rotation: CGFloat = 0
    @State var radius: CGFloat = 0
    @State var hueRotation = 0.0
    @State var sat = 1.0
    @State var blur = 0.0
    @State var selectedPic = "meme"
    @State var showAlert = false
    func getRandomNum(for upperbound: Int) -> Int{
        return upperbound.arc4random
    }
    func messAroundWithValues() {
        opacityValue = CGFloat(getRandomNum(for: 100))/100.0
        radius =  CGFloat(getRandomNum(for: 10))
        borderWidth = CGFloat(getRandomNum(for: 30))
        bright = CGFloat(getRandomNum(for: 50))/100.0
        rotation = CGFloat(getRandomNum(for: 365))
        hueRotation = Double(getRandomNum(for: 365))
        sat = Double(getRandomNum(for: 100))/100.0
        blur = Double(getRandomNum(for: 5))
    }
    func allWentToZero() {
        opacityValue = CGFloat(1)
        radius =  CGFloat(0)
        borderWidth = CGFloat(0)
        bright = CGFloat(0)
        rotation = CGFloat(0)
        hueRotation = 0.0
        sat = 1.0
        blur = 0.0
        showAlert = true

    }
    var picChoice = ["meme", "meme2"]
    var body: some View {
        VStack {
            Image(selectedPic)
                .resizable()
                .frame(maxWidth: 300, maxHeight: 300, alignment: .bottom)
                .aspectRatio(contentMode: .fit)
                .border(Color.black,  width: borderWidth)
                .cornerRadius(radius)
                .opacity(Double(opacityValue))
                .brightness(Double(bright))
                .rotationEffect(.degrees(Double(rotation)))
                .hueRotation(.degrees(hueRotation))
                .saturation(sat)
                .blur(radius: CGFloat(blur))
            VStack(alignment: .leading) {
                HStack {
                    VStack {
                        VStack {
                            Text("Opacity:")
                                .padding()
                            Slider(value:  $opacityValue)
                                .frame(width: 100, height: 10, alignment: .trailing)
                        }
                        VStack() {
                            Text("Border Width")
                                .padding()
                            Slider(value:  $borderWidth, in: 0...100)
                               .frame(width: 100, height: 10, alignment: .trailing)
                        }
                        VStack {
                            Text("brintness")
                                .padding()
                            Slider(value:  $bright, in: 0...1)
                                .frame(width: 100, height: 10, alignment: .trailing)

                        }
                        VStack {
                            Text("rotation")
                                .padding()
                            Slider(value:  $rotation, in: 0...365)
                                .frame(width: 100, height: 10, alignment: .trailing)
                        }
                    }
                    VStack {
                        VStack {
                            Text("圓角:")
                                .padding()
                            Slider(value:  $radius, in: 0...50)
                                .frame(width: 100, height: 10, alignment: .trailing)
                        }
                        VStack {
                            Text("hue rotation")
                                .padding()
                            Slider(value:  $hueRotation, in: 0...365)
                                .frame(width: 100, height: 10, alignment: .trailing)
                        }
                        VStack {
                            Text("saturation")
                                .padding()
                            Slider(value:  $sat, in: 0...1)
                                .frame(width: 100, height: 10, alignment: .trailing)
                        }
                        VStack {
                            Text("blur")
                                .padding()
                            Slider(value:  $blur, in: 0...5)
                                .frame(width: 100, height: 10, alignment: .trailing)
                        }
                    }
                }
    }
            .padding(.bottom, 30)
            Button(action: messAroundWithValues) {
                Text("random")
            }
            .padding(.bottom, 30)
                       Button(action: allWentToZero) {
                           Text("Zero")
                       }
            Picker(selection: $selectedPic, label: Text("選圖")) {
                ForEach(picChoice, id: \.self) { pic in
                    Text(pic)
                }
            }.alert(isPresented: $showAlert) {()->Alert in
                return Alert(title: Text("Restart"))
            }

        }
    .padding(30)

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SliderView: View {
    @State var inputValue: CGFloat
    var body: some View {
        Slider(value:  $inputValue)
            .frame(width: 100, height: 10, alignment: .trailing)
    }
}

struct SliderColumn: View {
    let column: [ValueSliderItem]
    var body: some View {
        VStack {
            ForEach(column, id: \.title) { item in
//                Text(item.title)
                ValueSlider(title: item.title, value: item.value)

            }
        }
    }
}

struct ValueSlider: View {
    let title: String

    @State var value: CGFloat {
        didSet {
            print(value)
            print("?")
        }
    }
    var body: some View {
        VStack {
            Text(title)
            .padding()
            //            .frame(width: 100, height: 10, alignment: .trailing)
            Slider(value: $value)
        }
    }
}

//struct SliderColumn: View {
//    var body: some View {
//        VStack {
//            VStack {
//                Text("Opacity:")
//                    .padding()
//                SliderView(inputValue: sliderValues["opacity"] ?? CGFloat(0))
//            }
//            VStack() {
//                Text("RGB Red")
//                    .padding()
//                SliderView(inputValue: RGBRed)
//            }
//            VStack {
//                Text("RGB Green")
//                    .padding()
//                SliderView(inputValue:  RGBGreen)
//            }
//            VStack {
//                Text("RGB Green")
//                    .padding()
//                SliderView(inputValue:  RGBBlue)
//            }
//        }
//    }
//}
extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
