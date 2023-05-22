//
//  ScorerApp.swift
//  Scorer Watch App
//
//  Created by 唐某某 on 2023/5/17.
//

import SwiftUI

@main
struct Scorer_Watch_AppApp: App {
    var appState = AppState()
    
    @StateObject private var store = BoardStore()
    @StateObject private var scorerState = ScorerState()
    
    @StateObject var workoutStateModel = WorkoutStateModel()
    
    var body: some Scene {
        WindowGroup {
            // 发现一直卡住的canvas 和 simulator bug 就是这个地方多了NavigationView（后面有navigationstack 了冲突了）
//            NavigationView {
            BoardView().environmentObject(store).environmentObject(scorerState)
//                ContentView()
//                    .environmentObject(appState)
//                    .environmentObject(workoutStateModel)
//            }
        }
    }
}
