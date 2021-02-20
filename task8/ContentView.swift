//
//  ContentView.swift
//  task8
//
//  Created by Hiroshi.Nakai on 2021/02/19.
//

import SwiftUI

struct ContentView: View {

    @State private var selection = 0
    @State private var numSlider: Float = 0

    var body: some View {

        VStack {
            TabView(selection: $selection) {
                SliderView(color: Color.red, numSlider: $numSlider)
                    .tabItem {
                        Text("左タブ")
                    }
                    .tag(0)
                SliderView(color: Color.green, numSlider: $numSlider)
                    .tabItem {
                        Text("右タブ")
                    }
                    .tag(1)
            }
        }
    }
}

struct SliderView: View {

    private static let answerRange = 0...1.0

    private var sliderRange: ClosedRange<Float> {
        Float(Self.answerRange.lowerBound)...Float(Self.answerRange.upperBound)
    }

    var color: Color
    @Binding var numSlider: Float

    var body: some View {
        ZStack {
            color
                .edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    Text(String(numSlider))
                }.padding()

                Slider(value: $numSlider, in: sliderRange)

                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
