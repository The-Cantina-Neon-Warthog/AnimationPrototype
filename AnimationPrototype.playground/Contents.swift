//: A UIKit based Playground for presenting user interface
  
import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        ZStack {
            // Circle 1
            Circle()
                .frame(width: 200, height: 200, alignment: .center)
                .foregroundColor(.red)
            
            // Circle 2
            Circle()
                .frame(width: 124, height: 124, alignment: .center)
                .foregroundColor(.white)
                .opacity(0.62)
            
            // Circle 2
            Circle()
                .frame(width: 77, height: 77, alignment: .center)
                .foregroundColor(.white)
                .opacity(0.62)
        }.frame(width: 300, height: 450, alignment: .center)
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.setLiveView(ContentView())
