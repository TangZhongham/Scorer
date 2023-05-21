//
//  BoardStore.swift
//  Scorer
//
//  Created by 唐某某 on 2023/5/21.
//

import Foundation

@MainActor
class BoardStore: ObservableObject {
    @Published var boards: [Board] = []
    
    init() {
        boards = Board.sampleBoards
    }
}
