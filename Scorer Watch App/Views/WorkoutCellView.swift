//
//  WorkoutCellView.swift
//  Scorer Watch App
//
//  Created by 唐某某 on 2023/5/19.
//

import SwiftUI

struct WorkoutCellView: View {
    let workout: Workout
    
    var body: some View {
        VStack (alignment: .leading, spacing: 8) {
              HStack(alignment: .top) {
                  
                // The workout symbol
                Image(systemName: workout.symbolName)
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width: 96, height: 40, alignment: .leading)
                  .foregroundColor(.green)
                  
                Spacer()
                // The ellipsis
                  
                Image(systemName: "ellipsis.circle.fill")
                  .resizable()
                  .frame(width: 24, height: 24)
                  .foregroundColor(.gray)
              }
              // The name of the workout
              Text(workout.name)
            }
            .padding(16)
    }
}

struct WorkoutCellView_Previews: PreviewProvider {
    
    static let workouts = [
      Workout(name: "Outdoor Walk", symbolName: "figure.walk"),
      Workout(name: "Outdoor Bike", symbolName: "bicycle"),
    ]
    
    static var previews: some View {
        WorkoutCellView(workout: workouts[0])
    }
}
