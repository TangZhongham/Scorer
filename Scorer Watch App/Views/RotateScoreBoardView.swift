//
//  RotateScoreBoardView.swift
//  Scorer Watch App
//
//  Created by 唐某某 on 2023/5/20.
//

import SwiftUI
import WatchKit


struct RotateScoreBoardView: View {
    @State var You = 0
    @State var Rival = 0
    
    @GestureState private var isDetectingLongPress = false
    @State var completedLongPress = false
    
    @EnvironmentObject var appState : AppState
    @State var workout: Workout
    
    // 添加局数
    @State var matches = 5
    @State var startMatches = 0
    @State var homeScore = 0
    @State var rivalScore = 0
    
    // 添加总分，谁先达到11分，局数+1
    @State var points = 3
    
    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 0.7)
            .updating($isDetectingLongPress) { currentState, gestureState,
                transaction in
                gestureState = currentState
                transaction.animation = Animation.easeIn(duration: 1.0)
            }
            .onEnded { finished in
                print("LOOOOONG TAP")
                // click
                WKInterfaceDevice.current().play(WKHapticType(rawValue: 8)!)
                completedLongPress = finished
            }
    }
    
    
    @State var startDate = Date.now
    @State var timeElapsed: Int = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        
    
    var body: some View {
        
        // 加在这也不行，有一定几率即使不满足条件也会走进去 "Waiting for dev..."
        // 最怕就是只有模拟器是这样。。。
//        if(workout.name != "简单计分板") {
//            Text("Waiting for dev...")
//        } else {
        
        ZStack {
            
            HStack(alignment: .center, spacing: 0) {
                    GeometryReader{g in
                        ZStack {
                            Color.cyan
                            VStack(spacing: 0) {
                                Text("\(Rival)")
                                    .font(.system(size: g.size.height > g.size.width ? g.size.width * 0.7: g.size.height * 0.7))
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
                    
                    GeometryReader{g in
                        ZStack {
                            Color.pink.edgesIgnoringSafeArea(.all)
                            VStack(spacing: 0) {
                                Text("\(You)")
                                    .font(.system(size: g.size.height > g.size.width ? g.size.width * 0.7: g.size.height * 0.7))
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
            HStack {
                    Text("\(rivalScore):\(homeScore)")
                        .font(.largeTitle).padding(.trailing)
                    Text("(\(matches))")
            }.offset(x:0, y:60)
            
            VStack {
                Text(" \(timeElapsed) sec")
                    .onReceive(timer) { firedDate in
                                    print("timer fired")
                                    timeElapsed = Int(firedDate.timeIntervalSince(startDate))
                                }
//                            Button("Stop") {
//                                timer.upstream.connect().cancel()
//                            }
            }.offset(x: -50, y: -89)
        }
        .gesture(longPress)
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
        .onChange(of: You, perform: { newValue in
            if newValue  == points {
                homeScore += 1
                startMatches += 1
                Rival = 0
                You = 0
                print("获胜一局")
            }
        })
        .onChange(of: Rival, perform: { newValue in
            if newValue  == points {
                rivalScore += 1
                startMatches += 1
                Rival = 0
                You = 0
                print("对方获胜一局")
            }
        })
        .onChange(of: homeScore, perform: { newValue in
            if newValue == calculateValue(matches) {
                print("对局结束")
                // ❎ 做一个放烟花的特效
                // 归零
                startMatches = 0
                homeScore = 0
                rivalScore = 0
                Rival = 0
                You = 0
            }
        })
        .onChange(of: rivalScore, perform: { newValue in
            if newValue == calculateValue(matches) {
                print("对局结束")
                // ❎ 做一个放烟花的特效
                // 归零
                startMatches = 0
                homeScore = 0
                rivalScore = 0
                Rival = 0
                You = 0
            }
        })
        .sheet(isPresented: $completedLongPress) {
            BadmintonPauseView().environmentObject(appState).transition(.scale)
    }
        
    }
    
    func calculateValue(_ input: Int) -> Int {
        let remainder = input % 2 // 获取输入值除以2的余数

        if remainder > 0 { // 如果有余数
            return input / 2 + 1 // 返回商+1
        } else { // 没有余数
            return input / 2 + 1 // 返回商+1
        }
    }
    
}

struct RotateScoreBoardView_Previews: PreviewProvider {
    static let workout = Workout(name: "简单计分板", symbolName: "face.smiling")
    
    static var previews: some View {
        RotateScoreBoardView(workout: workout)
    }
}
