//
//  TimerView.swift
//  Scorer Watch App
//
//  Created by 唐某某 on 2023/5/19.
//

import SwiftUI

struct TimerView: View {
    @State private var time1 = ""
    @State private var time2 = ""

    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            SubscriptionView(content: Text(time1), publisher: timer) { t in
                time1 = String(describing: t)
            }
            Text(time2).onReceive(timer) { t in
                time2 = String(describing: t)
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
