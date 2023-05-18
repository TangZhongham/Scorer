//
//  SportsList.swift
//  Scorer Watch App
//
//  Created by 唐某某 on 2023/5/18.
//

import SwiftUI

struct SportsList: View {
    var body: some View {
        List {
            SportRow()
            SportRow()
            SportRow()
        }
        .navigationTitle("Scorer")
    }
}

struct SportsList_Previews: PreviewProvider {
    static var previews: some View {
        SportsList()
    }
}
