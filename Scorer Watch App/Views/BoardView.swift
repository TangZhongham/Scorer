//
//  BoardView.swift
//  Scorer Watch App
//
//  Created by 唐某某 on 2023/5/21.
//

import SwiftUI

struct BoardView: View {
    @EnvironmentObject var store: BoardStore
    
    @State var isActive : Bool = false
    @State var tagToShow: String?
    
    var body: some View {
        NavigationStack {
            List(store.boards) { board in
                NavigationLink(destination: BoardDetailView().environmentObject(board)) {
                    BoardCellView(board: board)
                }
            }
//            .navigationBarTitle("Scorer")
            .listStyle(.carousel)
            
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    @StateObject static private var store = BoardStore()
    static var previews: some View {
        BoardView().environmentObject(store)
    }
}
