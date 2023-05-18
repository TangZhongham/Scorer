//
//  SportRow.swift
//  Scorer Watch App
//
//  Created by 唐某某 on 2023/5/18.
//

import SwiftUI

struct SportRow: View {
    @State private var showDetail = false
    
    var body: some View {
        NavigationLink {
            SportStartView()
        } label: {
            HStack {
                Text("Swim")
//                    .strikethrough(item.isComplete)
                Spacer()
                Image(systemName: "checkmark")
//                    .opacity(item.isComplete ? 100 : 0)
            }        }
        
        
//        NavigationLink(
//            destination: SportStartView(),
//            isActive: $showDetail) {
//                
//                Button {
//                    showDetail = true
//                } label: {
//                    HStack {
//                        Text("Swim")
//        //                    .strikethrough(item.isComplete)
//                        Spacer()
//                        Image(systemName: "checkmark")
//        //                    .opacity(item.isComplete ? 100 : 0)
//                    }
//                }
//                
//
////            .buttonStyle(MyButtonStyle)
//                
//        }
        
        

    }
}

struct SportRow_Previews: PreviewProvider {
    static var previews: some View {
        SportRow()
    }
}
