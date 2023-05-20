//
//  NewBadmintonView.swift
//  Scorer Watch App
//
//  Created by 唐某某 on 2023/5/20.
//
import SwiftUI
import WatchKit

struct NewBadmintonView: View {
    @State var You = 0
    @State var Rival = 0
    
    @GestureState private var isDetectingLongPress = false
    @State var completedLongPress = false
    @State var Fuck = 0
    
    @EnvironmentObject var appState : AppState
    @State var workout: Workout
    
    @State var action: () -> Void
    
    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 0.7)
            .updating($isDetectingLongPress) { currentState, gestureState,
                transaction in
                gestureState = currentState
                transaction.animation = Animation.easeIn(duration: 1.0)
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
        
        // 加在这也不行，有一定几率即使不满足条件也会走进去 "Waiting for dev..."
        // 最怕就是只有模拟器是这样。。。
//        if(workout.name != "简单计分板") {
//            Text("Waiting for dev...")
//        } else {
            
            VStack(alignment: .center, spacing: 0) {
                GeometryReader{g in
                    ZStack {
                        
                        Color.cyan
                        VStack(spacing: 0) {
                            Text("\(workout.name) + \(workout.symbolName)")
                            Text("Rival: \(Rival)")
                            //                            .font(.largeTitle)
                                .font(.system(size: g.size.height > g.size.width ? g.size.width * 0.48: g.size.height * 0.48))
                            //                    Text("Long Press Times: \(Fuck)")
                        }
                    }
                }
                .border(Color.black, width: 0)
                .edgesIgnoringSafeArea(.all)
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
                GeometryReader{g in
                    ZStack {
                        Color.pink.edgesIgnoringSafeArea(.all)
                        VStack(spacing: 0) {
                            Text("You: \(You)")
                                .font(.system(size: g.size.height > g.size.width ? g.size.width * 0.48: g.size.height * 0.48))
                        }
                    }}
                .border(Color.black, width: 0)
                .edgesIgnoringSafeArea(.all)
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
            //        .fullScreenCover(isPresented: $completedLongPress) {
            //            BadmintonPauseView().environmentObject(appState).transition(.scale)
            //        }
            .sheet(isPresented: $completedLongPress) {
                NewBadmintonPauseView(action: action).environmentObject(appState).transition(.scale)
            }
            
//        }
        
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

//struct NewBadmintonView_Previews: PreviewProvider {
//    static let workout = Workout(name: "简单计分板", symbolName: "face.smiling")
//
//    static var previews: some View {
//        NewBadmintonView(workout: workout)
//    }
//}
