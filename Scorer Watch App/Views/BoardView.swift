//
//  BoardView.swift
//  Scorer Watch App
//
//  Created by 唐某某 on 2023/5/21.
//

import SwiftUI

struct BoardView: View {
    @EnvironmentObject var store: BoardStore
    @EnvironmentObject var scorerState: ScorerState
    
    @State var isActive : Bool = false
    @State var tagToShow: String?
    
    // 简便方式
    //    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $scorerState.path) {
            List(store.boards) { board in
                NavigationLink(value: board)
                {
                    BoardCellView(board: board)
                }
                
            }
            .navigationDestination(for: Board.self, destination: { board in
                BoardDetailView().environmentObject(board)
            })
            //            .navigationBarTitle("Scorer")
            .listStyle(.carousel)
            .toolbar(.hidden)
            
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    @StateObject static private var store = BoardStore()
    @StateObject static private var scorerState = ScorerState()
    
    static var previews: some View {
        BoardView().environmentObject(store)
            .environmentObject(scorerState)
    }
}
