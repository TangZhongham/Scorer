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
        Workout(name: "Outdoor Walk", symbolName: "figure.walk"),
        Workout(name: "Outdoor Bike", symbolName: "bicycle"),
        Workout(name: "Outdoor Bike", symbolName: "bicycle"),
    ]
    
    var body: some View {
        List {
            ForEach(workouts) { workout in
                WorkoutCellView(workout: workout)
//                NavigationLink(destination: StartSportLink()) {
//                    WorkoutCellView(workout: workout)
//                }
                    
            }
        }
        .navigationBarTitle("Workout")
        .navigationTitle("Scorer")
        .listStyle(.carousel)
        
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
