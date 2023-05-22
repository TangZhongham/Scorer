//
//  BoardDetailView.swift
//  Scorer Watch App
//
//  Created by 唐某某 on 2023/5/21.
//

import SwiftUI

struct BoardDetailView: View {
    
    @EnvironmentObject var board: Board
    @EnvironmentObject var scorerState: ScorerState
//    @Binding var path: NavigationPath
    
    @GestureState private var isDetectingLongPress = false
    @State var completedLongPress = false
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
    
    @State var isRotate: Bool = false
    // ✅ test view
    //    var body: some View {
    //        VStack {
    //            Text(board.boardName)
    //            Text("\(board.homePoints)")
    //
    //        }
    //        .onTapGesture {
    //            board.homePoints += 1
    //        }
    //    }
    
    var body: some View {
        //        // 就算是这样也有问题
        //        VStack(spacing:0) {
        //            Color.orange
        //            Color.cyan
        //        }
        //        .ignoresSafeArea()
        //        .edgesIgnoringSafeArea(.all)
        //         won't work
        
        
        ZStack {
            if isRotate {
                // 暂时把 RotateScoreBoardView 的View 部分拷贝过来做判断，到时候设成可配置化
                VStack(spacing:0) {
                    HStack(spacing: 0) {
                        GeometryReader{g in
                            ZStack {
                                Color.cyan
                                VStack(spacing: 0) {
                                    Text("\(board.rivalPoints)")
                                        .font(.system(size: g.size.height > g.size.width ? g.size.width * 0.7: g.size.height * 0.7))
                                }
                                Text("\(board.rivalScore)")
                                    .font(.system(size: g.size.height > g.size.width ? g.size.width * 0.35: g.size.height * 0.35))
                                    .offset(x: 30, y: -60)
                            }
                        }
                        .gesture(
                            TapGesture(count: 2).onEnded {
                                print("DOUBLE TAP")
                                board.rivalPoints -= 1
                                WKInterfaceDevice.current().play(WKHapticType(rawValue: 4)!)
                            }.exclusively(before: TapGesture(count: 1).onEnded {
                                print("SINGLE TAP")
                                board.rivalPoints += 1
                                WKInterfaceDevice.current().play(WKHapticType(rawValue: 1)!)
                                
                            })
                        )
                        
                        GeometryReader{g in
                            ZStack {
                                Color.pink
                                VStack(spacing: 0) {
                                    //                                Text("\(board.boardName)")
                                    Text("\(board.homePoints)")
                                        .font(.system(size: g.size.height > g.size.width ? g.size.width * 0.7: g.size.height * 0.7))
                                }
                                Text("\(board.homeScore)")
                                    .font(.system(size: g.size.height > g.size.width ? g.size.width * 0.35: g.size.height * 0.35))
                                    .offset(x: -30, y: -60)
                            }}
                        .gesture(
                            TapGesture(count: 2).onEnded {
                                print("DOUBLE TAP")
                                board.homePoints -= 1
                                WKInterfaceDevice.current().play(WKHapticType(rawValue: 4)!)
                            }.exclusively(before: TapGesture(count: 1).onEnded {
                                print("SINGLE TAP")
                                board.homePoints += 1
                                WKInterfaceDevice.current().play(WKHapticType(rawValue: 3)!)
                            })
                        )
                    }
                }
                Text("(\(board.matches))").offset(x:0, y:-35)
                
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
            } else
            {
                VStack(spacing: 0) {
                    GeometryReader{g in
                        ZStack {
                            Color.cyan
                            VStack(spacing: 0) {
                                Text("\(board.rivalPoints)")
                                    .font(.system(size: g.size.height > g.size.width ? g.size.width * 0.7: g.size.height * 0.7))
                            }
                            Text("\(board.rivalScore)")
                                .font(.system(size: g.size.height > g.size.width ? g.size.width * 0.35: g.size.height * 0.35))
                                .offset(x: -70, y: 35)
                        }
                    }
                    //                    .border(Color.black, width: 0)
                    //                    .edgesIgnoringSafeArea(.all)
                    .ignoresSafeArea()
                    .gesture(
                        TapGesture(count: 2).onEnded {
                            print("DOUBLE TAP")
                            board.rivalPoints -= 1
                            WKInterfaceDevice.current().play(WKHapticType(rawValue: 4)!)
                        }.exclusively(before: TapGesture(count: 1).onEnded {
                            print("SINGLE TAP")
                            board.rivalPoints += 1
                            WKInterfaceDevice.current().play(WKHapticType(rawValue: 1)!)
                            
                        })
                    )
                    
                    GeometryReader{g in
                        ZStack {
                            Color.pink
                            VStack(spacing: 0) {
                                Text("\(board.homePoints)")
                                    .font(.system(size: g.size.height > g.size.width ? g.size.width * 0.7: g.size.height * 0.7))
                            }
                            Text("\(board.homeScore)")
                                .font(.system(size: g.size.height > g.size.width ? g.size.width * 0.35: g.size.height * 0.35))
                                .offset(x: -70, y: -35)
                        }}
                    //                    .border(Color.black, width: 0)
                    //                    .edgesIgnoringSafeArea(.all)
                    .ignoresSafeArea()
                    .gesture(
                        TapGesture(count: 2).onEnded {
                            print("DOUBLE TAP")
                            board.homePoints -= 1
                            WKInterfaceDevice.current().play(WKHapticType(rawValue: 4)!)
                        }.exclusively(before: TapGesture(count: 1).onEnded {
                            print("SINGLE TAP")
                            board.homePoints += 1
                            WKInterfaceDevice.current().play(WKHapticType(rawValue: 3)!)
                        })
                    )
                }
                
                Text("(\(board.matches))").offset(x:-40, y:0)
                VStack {
                    Text(" \(timeElapsed) sec")
                        .onReceive(timer) { firedDate in
                            print("timer fired")
                            timeElapsed = Int(firedDate.timeIntervalSince(startDate))
                        }
                    //                            Button("Stop") {
                    //                                timer.upstream.connect().cancel()
                    //                            }
                }
                .offset(x: -50, y: -89)
                //                        .scenePadding(.horizontal)
                
            }
        }
        .gesture(longPress)
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .onChange(of: board.homePoints, perform: { newValue in
            if newValue  == board.points {
                board.homeScore += 1
                //                startMatches += 1
                board.rivalPoints = 0
                board.homePoints = 0
                print("获胜一局")
            }
        })
        .onChange(of: board.rivalPoints, perform: { newValue in
            if newValue  == board.points {
                board.rivalScore += 1
                //                startMatches += 1
                board.rivalPoints  = 0
                board.homePoints = 0
                print("对方获胜一局")
            }
        })
        .onChange(of: board.homeScore, perform: { newValue in
            if newValue == calculateValue(board.matches) {
                print("对局结束")
                // ❎ 做一个放烟花的特效
                // 归零
                //                startMatches = 0
                board.homeScore = 0
                board.rivalScore = 0
                board.rivalPoints = 0
                board.homePoints = 0
            }
        })
        .onChange(of: board.rivalScore, perform: { newValue in
            if newValue == calculateValue(board.matches) {
                print("对局结束")
                // ❎ 做一个放烟花的特效
                // 归零
                //                startMatches = 0
                board.homeScore = 0
                board.rivalScore  = 0
                board.rivalPoints = 0
                board.homePoints = 0
            }
        })
        // 这里 fullScreenCover 而不是 sheet 就可以直接回rootview 而不是3-》2-〉1的方式回去了
        .fullScreenCover(isPresented: $completedLongPress) {
            //            NewBadmintonPauseView(action: action).environmentObject(appState).transition(.scale)
            //                Text("Modify or get the fuck out :/").onTapGesture {
            //                    scorerState.popToRoot()
            //                }
            
            Button(action: {
                print("回到主页：")
//                print(path.count)
//                path.removeLast(path.count)
                scorerState.popToRoot()
            }) {
                Text("Modify or get the fuck out :/")
            }
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

struct BoardDetailView_Previews: PreviewProvider {
    @StateObject static var board = Board.sampleBoards[1]
    @State static var path = NavigationPath()
    @StateObject static private var scorerState = ScorerState()
    static var previews: some View {
        BoardDetailView().environmentObject(board).environmentObject(scorerState)
    }
}
