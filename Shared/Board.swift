//
//  Board.swift
//  Scorer
//
//  Created by 唐某某 on 2023/5/21.
//

import Foundation

class Board: Identifiable, ObservableObject {
    let id: UUID
    
    // 记分板名称：简单记分板，三局两胜：11分制 等
    var boardName: String
    // 记分板图标
    var boardLogo: String
    // ❎ 添加 theme
    
    // 局数
    var matches: Int
    var startMatches: Int = 0
    // 0:1 对局分数
    var homeScore: Int = 0
    var rivalScore: Int = 0
    
    // 总分 11 分
    var points: Int
    @Published var homePoints: Int = 0
    var rivalPoints: Int = 0

    
    init(id: UUID=UUID(), boardName: String, boardLogo: String, matches: Int, points: Int) {
        self.id = id
        self.boardName = boardName
        self.boardLogo = boardLogo
        self.matches = matches
        self.points = points
        
    }
    
    func addHomePoints() {
        homePoints += 1
    }
}

extension Board {
    static let sampleBoards: [Board] = [
        Board(boardName: "简单计分板", boardLogo: "face.smiling", matches: 5, points: 21),
        Board(boardName: "5局3胜，11分制", boardLogo: "person.2", matches: 5, points: 11),
        Board(boardName: "7局4胜，21分制", boardLogo: "person.and.arrow.left.and.arrow.right", matches: 7, points: 21),
        Board(boardName: "99局50胜，99分制", boardLogo: "gamecontroller.fill", matches: 99, points: 99)
    ]
    
    static var emptyBoard = Board(boardName: "", boardLogo: "", matches: 0, points: 0)
}

extension Board {
    
    
    // ❎ 高级功能，创建player
    struct Attendee: Identifiable, Codable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
}
