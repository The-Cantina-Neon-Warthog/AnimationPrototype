//: A UIKit based Playground for presenting user interface
  
import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    @State private var animationAmount = 1.0
    @State private var animationAmountInerCircle1 = 1.0
    @State private var animationAmountInerCircle2 = 1.0
    @State private var animationColor = Color.blue
    
    let animationTime: Double = 4
    let delay1: Double = 0.4
    let delay2: Double = 0.8
    
    var body: some View {
        ZStack {
            // Circle 1
            Circle()
                .frame(width: 200, height: 200, alignment: .center)
                .foregroundColor(.white)
                .colorMultiply(animationColor)
                .scaleEffect(animationAmount)
                .animation(
                    .easeInOut(duration: animationTime)
                        .repeatForever(autoreverses: true),
                    value: animationAmount
                )
                .onAppear {
                    animationAmount = 1.61
                    animationColor = Color.red
                }
            
            // Circle 2
            Circle()
                .frame(width: 124, height: 124, alignment: .center)
                .foregroundColor(.white)
                .opacity(0.5)
                .scaleEffect(animationAmountInerCircle1)
                .animation(
                    .easeInOut(duration: animationTime - delay1)
                        .delay(delay1)
                        .repeatForever(autoreverses: true),
                    value: animationAmount
                )
                .onAppear {
                    animationAmountInerCircle1 = 2.3
                }
            
            // Circle 2
            Circle()
                .frame(width: 48, height: 48, alignment: .center)
                .foregroundColor(.white)
                .opacity(0.5)
                .scaleEffect(animationAmountInerCircle2)
                .animation(
                    .easeInOut(duration: animationTime - delay2)
                        .delay(delay2)
                        .repeatForever(autoreverses: true),
                    value: animationAmount
                )
                .onAppear {
                    animationAmountInerCircle2 = 4.7
                }
            
        }.frame(width: 400, height: 550, alignment: .center)
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.setLiveView(ContentView())
