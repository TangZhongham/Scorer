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
    
    @StateObject var workoutStateModel = WorkoutStateModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(appState)
                    .environmentObject(workoutStateModel)
            }
        }
    }
}
