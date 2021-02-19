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
                comView(color: Color.red, tabTitle: "左タブ", isType: true, numSlider: $numSlider)
                comView(color: Color.green, tabTitle: "右タブ", isType: false, numSlider: $numSlider)
            }
        }
    }
}

// 共通 View
struct comView: View {

    private static let answerRange = 0...1.0

    private var sliderRange: ClosedRange<Float> {
        Float(Self.answerRange.lowerBound)...Float(Self.answerRange.upperBound)
    }

    var color: Color
    var tabTitle: String
    var isType: Bool

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
        }.tabItem {
            Text(tabTitle)
        }.tag(isType ? 0 : 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
