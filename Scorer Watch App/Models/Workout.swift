//
//  Workout.swift
//  Scorer Watch App
//
//  Created by 唐某某 on 2023/5/19.
//

import Foundation

class Workoutt: Identifiable, ObservableObject {
    
//    var id: String { name  }
    var id: UUID { UUID() }
    let name: String
    let symbolName: String
    
    // 项目
    let type: WorkoutType
    
    // 总分 11 分，21 分
    var point: Int
    
    // 局数: 默认3局2胜，5局3 等
    var match: Int
    
    init(name: String, symbolName: String, type: WorkoutType, point: Int, match: Int) {
        self.name = name
        self.symbolName = symbolName
        self.type = type
        self.point = point
        self.match = match
    }
    
}
