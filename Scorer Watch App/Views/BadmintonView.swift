//
//  BadmintonView.swift
//  Scorer Watch App
//
//  Created by 唐某某 on 2023/5/18.
//

import SwiftUI

struct BadmintonView: View {
    @State var You = 0
    @State var Rival = 0
    
    
    var body: some View {
        Grid {
            VStack {
//                GridRow{
                Image(systemName: "hand.wave")
                Text("Rival: \(Rival)")
            }.onTapGesture {
                Rival += 1
            }
            .onTapGesture(count: 2) {
                Rival -= 1
                print("Double tapped!")
            }
            
            Divider()
                .gridCellUnsizedAxes(.horizontal)
            
            
            
            VStack {
                Text("You: \(You)")
                Image(systemName: "globe")
            }
            .onTapGesture {
                You += 1
            }.onTapGesture(count: 2) {
                You -= 1
            }
        }
    }
}

struct BadmintonView_Previews: PreviewProvider {
    static var previews: some View {
        BadmintonView()
    }
}
