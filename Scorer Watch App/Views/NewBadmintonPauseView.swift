//
//  NewBadmintonPauseView.swift
//  Scorer Watch App
//
//  Created by 唐某某 on 2023/5/20.
//

import SwiftUI

struct NewBadmintonPauseView: View {
    @EnvironmentObject var appState : AppState
    
    let action: () -> Void
    
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
//                    Button(action: {
//                        self.appState.moveToRoot = false       // required
//
//                    }) {
//                        Text("Dismiss to root")
//                    }
            Text("Dismiss to root")
            Button("Back", action: action)
                }
    }
}

struct NewBadmintonPauseView_Previews: PreviewProvider {
    static var previews: some View {
        BadmintonPauseView()
    }
}
