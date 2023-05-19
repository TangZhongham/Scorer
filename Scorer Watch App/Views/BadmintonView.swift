//
//  BadmintonView.swift
//  Scorer Watch App
//
//  Created by 唐某某 on 2023/5/18.
//

import SwiftUI
import WatchKit

struct BadmintonView: View {
    @State var You = 0
    @State var Rival = 0
    
    @GestureState private var isDetectingLongPress = false
    @State var completedLongPress = false
    @State var Fuck = 0
    
    @EnvironmentObject var appState : AppState
    

    var longPress: some Gesture {
            LongPressGesture(minimumDuration: 3)
                .updating($isDetectingLongPress) { currentState, gestureState,
                        transaction in
                    gestureState = currentState
                    transaction.animation = Animation.easeIn(duration: 2.0)
                }
                .onEnded { finished in
                    Fuck += 1
                    print("LOOOOONG TAP")
                    // click
                    WKInterfaceDevice.current().play(WKHapticType(rawValue: 8)!)
                    completedLongPress = finished
                }
        }

    
    var body: some View {

        
        Grid {
            ZStack {
                Color.cyan
                VStack {
                    Text("Rival: \(Rival)")
                    Text("Long Press Times: \(Fuck)")
                }
            }
            .gesture(
                TapGesture(count: 2).onEnded {
                    print("DOUBLE TAP")
                    Rival -= 1
                    WKInterfaceDevice.current().play(WKHapticType(rawValue: 4)!)
                }.exclusively(before: TapGesture(count: 1).onEnded {
                    print("SINGLE TAP")
                    Rival += 1
                    WKInterfaceDevice.current().play(WKHapticType(rawValue: 1)!)

                })
        )

//            Divider()
//                .gridCellUnsizedAxes(.horizontal)

            ZStack {
                Color.pink
                VStack {
                    Text("You: \(You)")
//                    Image(systemName: "globe")
                }
            }
            .gesture(
                TapGesture(count: 2).onEnded {
                    print("DOUBLE TAP")
                    You -= 1
                    WKInterfaceDevice.current().play(WKHapticType(rawValue: 4)!)
                }.exclusively(before: TapGesture(count: 1).onEnded {
                    print("SINGLE TAP")
                    You += 1
                    WKInterfaceDevice.current().play(WKHapticType(rawValue: 3)!)
                })
        )
        }
        .gesture(longPress)
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
        // 用了 fullScreenCover 所以 transition 没用
        .fullScreenCover(isPresented: $completedLongPress) {
            BadmintonPauseView().environmentObject(appState).transition(.scale)
        }
    }
    
    
    // 想用 NavigationLink 替换 fullScreenCover 让transition 好看一点，但是整个UI会崩掉。。。
//        NavigationLink(destination: BadmintonPauseView().environmentObject(appState).transition(.scale), isActive: $completedLongPress) {
//            Grid {
//    //            Circle()
//    //                        .fill(self.isDetectingLongPress ?
//    //                            Color.red :
//    //                            (self.completedLongPress ? Color.green : Color.blue))
//    //                        .frame(width: 100, height: 100, alignment: .center)
//
//                ZStack {
//                    Color.cyan
//                    VStack {
//        //                GridRow{
//    //                    Image(systemName: "hand.wave")
//                        Text("Rival: \(Rival)")
//                        Text("Long Press Times: \(Fuck)")
//                    }
//                }
//                .gesture(
//                    TapGesture(count: 2).onEnded {
//                        print("DOUBLE TAP")
//                        Rival -= 1
//                        WKInterfaceDevice.current().play(WKHapticType(rawValue: 4)!)
//                    }.exclusively(before: TapGesture(count: 1).onEnded {
//                        print("SINGLE TAP")
//                        Rival += 1
//                        WKInterfaceDevice.current().play(WKHapticType(rawValue: 1)!)
//
//                    })
//            )
//    //            .edgesIgnoringSafeArea(.all)
//
//    //            Divider()
//    //                .gridCellUnsizedAxes(.horizontal)
//
//
//                ZStack {
//                    Color.pink
//                    VStack {
//                        Text("You: \(You)")
//    //                    Image(systemName: "globe")
//                    }
//                }
//                .gesture(
//                    TapGesture(count: 2).onEnded {
//                        print("DOUBLE TAP")
//                        You -= 1
//                        WKInterfaceDevice.current().play(WKHapticType(rawValue: 4)!)
//                    }.exclusively(before: TapGesture(count: 1).onEnded {
//                        print("SINGLE TAP")
//                        You += 1
//                        WKInterfaceDevice.current().play(WKHapticType(rawValue: 3)!)
//                    })
//            )
//            }
//            .gesture(longPress)
//            .edgesIgnoringSafeArea(.all)
//            .navigationBarHidden(true)
//        }.edgesIgnoringSafeArea(.all)
//            .navigationBarHidden(true)
    /////////////////
}

struct BadmintonView_Previews: PreviewProvider {
    static var previews: some View {
        BadmintonView()
    }
}
