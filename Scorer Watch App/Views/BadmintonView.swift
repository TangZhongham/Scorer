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
    
    @GestureState private var isDetectingLongPress = false
    @State private var completedLongPress = false
    @State var Fuck = 0

    var longPress: some Gesture {
            LongPressGesture(minimumDuration: 3)
                .updating($isDetectingLongPress) { currentState, gestureState,
                        transaction in
                    gestureState = currentState
                    transaction.animation = Animation.easeIn(duration: 2.0)
                }
                .onEnded { finished in
                    self.completedLongPress = finished
                    Fuck += 1
                    print("LOOOOONG TAP")
                }
        }

    
    var body: some View {
        
        Grid {
            Circle()
                        .fill(self.isDetectingLongPress ?
                            Color.red :
                            (self.completedLongPress ? Color.green : Color.blue))
                        .frame(width: 100, height: 100, alignment: .center)

            VStack {
//                GridRow{
                Image(systemName: "hand.wave")
                Text("Rival: \(Rival)")
                Text("Fuck: \(Fuck)")
            }
            .gesture(
                TapGesture(count: 2).onEnded {
                    print("DOUBLE TAP")
                    Rival -= 1
                }.exclusively(before: TapGesture(count: 1).onEnded {
                    print("SINGLE TAP")
                    Rival += 1
                })
            )
            
            Divider()
                .gridCellUnsizedAxes(.horizontal)
            
            
            VStack {
                Text("You: \(You)")
                Image(systemName: "globe")
            }
            .gesture(
                TapGesture(count: 2).onEnded {
                    print("DOUBLE TAP")
                    You -= 1
                }.exclusively(before: TapGesture(count: 1).onEnded {
                    print("SINGLE TAP")
                    You += 1
                })
            )
        }
        .gesture(longPress)
    }
}

struct BadmintonView_Previews: PreviewProvider {
    static var previews: some View {
        BadmintonView()
    }
}
