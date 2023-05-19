//
//  WorkoutView.swift
//  Scorer Watch App
//
//  Created by 唐某某 on 2023/5/19.
//

import SwiftUI

struct WorkoutView: View {
    
    let workouts = [
        Workout(name: "Badminton Battle", symbolName: "person.2"),
        Workout(name: "Simple Compete", symbolName: "figure.walk"),
        Workout(name: "Simple Single", symbolName: "bicycle"),
        Workout(name: "Outdoor Bike", symbolName: "bicycle"),
    ]
    
    @State var selectedItem = 0
    
    @EnvironmentObject var appState: AppState
    @State var isActive : Bool = false
    
    var body: some View {
        //        TabView {
        //            List {
        //                ForEach(workouts) { workout in
        //                    //                WorkoutCellView(workout: workout)
        //                    // 这里可以通过 destination 传 workout 给下层view 做一个switch 判断给到哪个view。
        //                    NavigationLink(destination: BadmintonView()) {
        //                        WorkoutCellView(workout: workout)
        //                    }
        //
        //                }
        //            }
        //            .navigationBarTitle("Scorer")
        //            .listStyle(.carousel)
        //            .tag(0)
        //
        //            TrainingChart()
        //                .tag(1)
        //        }
        //        .tabViewStyle(.page)
        
        List {
            ForEach(workouts) { workout in
                //                WorkoutCellView(workout: workout)
                // 这里可以通过 destination 传 workout 给下层view 做一个switch 判断给到哪个view。
                NavigationLink(destination: BadmintonView().environmentObject(appState)
                    .transition(.opacity)
                    .animation(.easeIn), isActive: $appState.moveToRoot) {
                    WorkoutCellView(workout: workout).environmentObject(appState)
                }
            }
        }
        .navigationBarTitle("Scorer")
        .listStyle(.carousel)
        
        
        
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
