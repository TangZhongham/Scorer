//
//  TestContentView.swift
//  Scorer Watch App
//
//  Created by 唐某某 on 2023/5/21.
//
import SwiftUI
import WatchConnectivity

struct TestContentView: View {
    @StateObject var counter = Counter()
    
    var labelStyle: some LabelStyle {
        #if os(watchOS)
        return IconOnlyLabelStyle()
        #else
        return DefaultLabelStyle()
        #endif
    }
    
    var body: some View {
        VStack {
            Text("\(counter.count)")
                .font(.largeTitle)
            
            HStack {
                Button(action: counter.decrement) {
                    Label("Decrement", systemImage: "minus.circle")
                }
                .padding()
                
                Button(action: counter.increment) {
                    Label("Increment", systemImage: "plus.circle.fill")
                }
                .padding()
            }
            .font(.headline)
            .labelStyle(labelStyle)
        }
    }
}

struct TestContentView_Previews: PreviewProvider {
    static var previews: some View {
        TestContentView()
    }
}
