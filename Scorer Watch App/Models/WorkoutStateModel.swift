//
//  WorkoutStateModel.swift
//  Scorer Watch App
//
//  Created by 唐某某 on 2023/5/19.
//

import Foundation

class WorkoutStateModel: ObservableObject {
    
    var workouts: [Workoutt] = [
        Workoutt(name: "乒乓球", symbolName: "person.and.arrow.left.and.arrow.right", type: .pingpong, point: 11, match: 3),
        Workoutt(name: "羽毛球", symbolName: "gamecontroller.fill", type: .tabletennis, point: 21, match: 5),
        Workoutt(name: "简单计分板", symbolName: "face.smiling", type: .simple, point: 999, match: 1)
    ]
    
//    init(workouts: [Workoutt]) {
//        self.workouts = workouts
//    }
    
}
