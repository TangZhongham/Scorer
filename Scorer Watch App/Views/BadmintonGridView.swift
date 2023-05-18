//
//  BadmintonGridView.swift
//  Scorer Watch App
//
//  Created by 唐某某 on 2023/5/18.
//

import SwiftUI

struct BadmintonGridView: View {
    var body: some View {
        Grid{
            GridRow{
                ZStack {
                    Color.blue
                    Text("1")
                }
            }
            
            GridRow{
                ZStack {
                    Color.pink
                    Text("2")
                }
            }
        }
    }
}

struct BadmintonGridView_Previews: PreviewProvider {
    static var previews: some View {
        BadmintonGridView()
    }
}
