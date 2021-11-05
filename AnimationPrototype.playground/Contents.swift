//: A UIKit based Playground for presenting user interface
  
import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    @State private var animationAmount = 1.0
    @State private var animationColor = Color.red
    
    var body: some View {
        ZStack {
            // Circle 1
            Circle()
                .frame(width: 200, height: 200, alignment: .center)
                .foregroundColor(.white)
                .colorMultiply(animationColor)
                .scaleEffect(animationAmount)
                .animation(
                    .easeInOut(duration: 2)
                        .repeatForever(autoreverses: true),
                    value: animationAmount
                )
                .onAppear {
                    animationAmount = 1.61
                    animationColor = Color.blue
                }
            
            // Circle 2
            Circle()
                .frame(width: 124, height: 124, alignment: .center)
                .foregroundColor(.white)
                .opacity(0.62)
                .scaleEffect(animationAmount)
                .animation(
                    .easeInOut(duration: 1.8)
                        .delay(0.2)
                        .repeatForever(autoreverses: true),
                    value: animationAmount
                )
            
            // Circle 2
            Circle()
                .frame(width: 77, height: 77, alignment: .center)
                .foregroundColor(.white)
                .opacity(0.62)
                .scaleEffect(animationAmount)
                .animation(
                    .easeInOut(duration: 1.6)
                        .delay(0.4)
                        .repeatForever(autoreverses: true),
                    value: animationAmount
                )
            
        }.frame(width: 400, height: 550, alignment: .center)
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.setLiveView(ContentView())
