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
            
            Button {
                //                                showDetail = true
            } label: {
                HStack {
                    Text("Start")
                    //                    .strikethrough(item.isComplete)
//                    Spacer()
//                    Image(systemName: "checkmark")
                    //                    .opacity(item.isComplete ? 100 : 0)
                }
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle)
            .listRowInsets(
                EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            NavigationLink {
                BadmintonView()
            } label: {
                Text("Start")
//                HStack {
//                    Text("Swim")
//    //                    .strikethrough(item.isComplete)
//                    Spacer()
//                    Image(systemName: "checkmark")
//    //                    .opacity(item.isComplete ? 100 : 0)
//                }
                
            }
            
            
            //            ShareLink(item: "x",
            //                      subject: Text("Please help!"),
            //                      message: Text("(I need some help finishing this.)"),
            //                      preview: SharePreview("fuck"))
            //            .buttonStyle(.borderedProminent)
            //            .buttonBorderShape(.roundedRectangle)
            //            .listRowInsets(
            //                EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            //            )
            //        }
            //        .toolbar {
            //            StartSportLink()
            //        }
        }
    }
    
    struct SportStartView_Previews: PreviewProvider {
        static var previews: some View {
            SportStartView()
        }
    }
}
