//
//  RotateTestView.swift
//  Scorer Watch App
//
//  Created by 唐某某 on 2023/5/20.
//

import SwiftUI

struct RotateTestView: View {
    @State private var angle: Double = 0
    var body: some View {
        VStack(spacing: 0) {
            Color.cyan
            Color.mint
        }
        .ignoresSafeArea()
        .rotationEffect(Angle(degrees: angle))
        .animation(.easeInOut(duration: 0.6))
        .onTapGesture {
                        self.angle += 90
                    }
    }
}

struct RotateTestView_Previews: PreviewProvider {
    static var previews: some View {
        RotateTestView()
    }
}
