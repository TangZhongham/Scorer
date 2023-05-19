//
//  BadmintonPauseView.swift
//  Scorer Watch App
//
//  Created by 唐某某 on 2023/5/19.
//

import SwiftUI

struct BadmintonPauseView: View {
    @EnvironmentObject var appState : AppState
    
    var body: some View {
//        NavigationLink {
//            WorkoutView()
//        } label: {
//            Text("End Game")
//        }
        
//        NavigationLink(destination: WorkoutView()) {
//            Text("End Game")
//        }
        
        VStack {
                    Button(action: {
                        self.appState.moveToRoot = false       // required
                    }) {
                        Text("Dismiss to root")
                    }
                }
    }
}

struct BadmintonPauseView_Previews: PreviewProvider {
    static var previews: some View {
        BadmintonPauseView()
    }
}
