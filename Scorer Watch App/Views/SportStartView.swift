//
//  SportStartView.swift
//  Scorer Watch App
//
//  Created by 唐某某 on 2023/5/18.
//

import SwiftUI

struct SportStartView: View {
    var body: some View {
        Form {
            
            Section("List Item") {
                TextField("Item", text: .constant("Swim Training"), prompt: Text("List Item"))
            }

            Section("Estimated Work") {
                Stepper(value: .constant(0),
                        in: (0.0...14.0),
                        step: 0.5,
                        format: .number) {
                    Text("minutes")
                }
            }
            
            // 如果是游泳可以计时。
            Toggle(isOn: .constant(true)) {
                Text("Timer")
            }
            

            ShareLink(item: "x",
                      subject: Text("Please help!"),
                      message: Text("(I need some help finishing this.)"),
                      preview: SharePreview("fuck"))
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle)
            .listRowInsets(
                EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            )
        }
    }
}

struct SportStartView_Previews: PreviewProvider {
    static var previews: some View {
        SportStartView()
    }
}
