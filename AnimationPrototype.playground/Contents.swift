//: A UIKit based Playground for presenting user interface

import SwiftUI
import PlaygroundSupport

enum RhythmStage: Int {
    case In, InPause, Out, OutPause
}

struct ContentView: View {
    @State private var animationSize = 1.0
    @State private var animationAmountInerCircle1 = 1.0
    @State private var animationAmountInerCircle2 = 1.0
    @State private var animationColor = Color.teal
    
    let delay1: Double = 0.4
    let delay2: Double = 0.8
    
    let rhythmConfig: [Int] = [5, 4, 3, 2]
    @State var stageCount: Int = 0
    @State var currentStage: Int = 0
    @State var animationDuration: Double = 4
    @State var shouldRhythmAnimRun: Bool = false
    @State var isFirstAnimation: Bool = true
    
    //Timer
    @State var secCounting = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("\(currentStage)")
            
            ZStack {
                // Circle 1
                Circle()
                    .frame(width: 200, height: 200, alignment: .center)
                    .foregroundColor(.white)
                    .colorMultiply(animationColor)
                    .scaleEffect(animationSize)
                    .animation(.easeInOut(duration: animationDuration), value: animationSize)
                    .animation(
                        .easeIn(duration: 1) ,value: animationColor
                    )
                //                .onAppear {
                ////                    animationAmount = 1.61
                //                    animationColor = Color.red
                //                }
                
                //            // Circle 2
                //            Circle()
                //                .frame(width: 124, height: 124, alignment: .center)
                //                .foregroundColor(.white)
                //                .opacity(0.5)
                //                .scaleEffect(animationAmountInerCircle1)
                //                .animation(
                //                    .easeInOut(duration: animationDuration - delay1)
                //                        .delay(delay1)
                //                    value: animationAmount
                //                )
                //                .onAppear {
                //                    animationAmountInerCircle1 = 2.3
                //                }
                //
                //            // Circle 2
                //            Circle()
                //                .frame(width: 48, height: 48, alignment: .center)
                //                .foregroundColor(.white)
                //                .opacity(0.5)
                //                .scaleEffect(animationAmountInerCircle2)
                //                .animation(
                //                    .easeInOut(duration: animationDuration - delay2)
                //                        .delay(delay2)
                //                        .repeatForever(autoreverses: true),
                //                    value: animationAmount
                //                )
                //                .onAppear {
                //                    animationAmountInerCircle2 = 4.7
                //                }
                
                //Timer Label
                Text("\(secCounting)")
                    .onReceive(timer) { _ in
                        secCounting += 1
                        
                        //Onde a magia acontece
                        if shouldRhythmAnimRun {
                            if (secCounting >= rhythmConfig[currentStage]) || isFirstAnimation {
                                
                                secCounting = 0
                                
                                if isFirstAnimation {
                                    isFirstAnimation = false
                                } else {
                                    stageCount += 1
                                }
                                
                                currentStage = stageCount % 4
                                
                                animationDuration = Double(rhythmConfig[currentStage])
                                
                                
                                switch currentStage {
                                case 0:
                                    animationColor = Color.blue
                                    animationSize = 1.61
                                    
                                case 1:
                                    animationColor = Color.gray
                                    
                                case 2:
                                    animationColor = Color.red
                                    animationSize = 0.5
                                    
                                case 3:
                                    animationColor = Color.gray
                                    
                                default:
                                    animationColor = Color.black
                                }
                                
                                //Animation log
                                print("Triggered Animation stage ** \(currentStage) **")
                                print(" Stage Count: \(stageCount)\n Duration: \(animationDuration)\n Color: \(animationColor.description)\n To Size: \(animationSize)\n")
                                
                            }
                            
                        } else {
                            if secCounting == 5 {
                                secCounting = 0
                                shouldRhythmAnimRun.toggle()
                            }
                        }
                        
                    }
                
            }.frame(width: 400, height: 550, alignment: .center)
        }
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.setLiveView(ContentView())
