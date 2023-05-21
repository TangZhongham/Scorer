//
//  BoardCellView.swift
//  Scorer Watch App
//
//  Created by 唐某某 on 2023/5/21.
//

import SwiftUI

struct BoardCellView: View {
    let board: Board
    
    var body: some View {
        VStack (alignment: .leading, spacing: 8) {
              HStack(alignment: .top) {
                  
                // The workout symbol
                  Image(systemName: board.boardLogo)
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width: 96, height: 40, alignment: .leading)
                  .foregroundColor(.mint)
                  
                Spacer()
                // The ellipsis
                  
                Image(systemName: "ellipsis.circle.fill")
                  .resizable()
                  .frame(width: 24, height: 24)
                  .foregroundColor(.gray)
              }
              // The name of the workout
            Text(board.boardName)
            }
            .padding(16)
    }
}

struct BoardCellView_Previews: PreviewProvider {
    static let board = Board.sampleBoards[0]
    
    static var previews: some View {
        BoardCellView(board: board)
    }
}
