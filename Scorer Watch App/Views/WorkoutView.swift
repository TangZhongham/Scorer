//
//  WorkoutView.swift
//  Scorer Watch App
//
//  Created by 唐某某 on 2023/5/19.
//

import SwiftUI

struct WorkoutView: View {
    
    let workouts = [
        Workout(name: "简单计分板", symbolName: "face.smiling"),
        Workout(name: "5局3胜，11分制", symbolName: "person.2"),
        Workout(name: "7局4胜，21分制", symbolName: "person.and.arrow.left.and.arrow.right"),
        Workout(name: "3局2胜，11分制", symbolName: "bicycle"),
        Workout(name: "99局50胜，99分制", symbolName: "gamecontroller.fill"),
    ]
    
    let badminton = Workout(name: "羽毛球", symbolName: "gamecontroller.fill")
    let tabletennis = Workout(name: "乒乓球", symbolName: "person.and.arrow.left.and.arrow.right")
    
    @State var selectedItem = 0
    
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var workoutStateModel: WorkoutStateModel
    @State var isActive : Bool = false
    
    @State var tagToShow: String?
    
    var body: some View {
        List {
//            NavigationLink(destination: RotateScoreBoardView(workout: badminton).environmentObject(appState)
//                .transition(.asymmetric(insertion: .opacity, removal: .scale))
//                           , isActive: $appState.moveToRoot) {
//                WorkoutCellView(workout: badminton).environmentObject(appState)
//            }

//            // 发现用observable object 选择也有 NavigationLink 的bug，先不管了，开发功能要紧
//            ForEach(workoutStateModel.workouts) { workout in
//                NavigationLink(destination: Text("Still developing \(workout.name)...")
//                    .transition(.asymmetric(insertion: .opacity, removal: .scale))
//                               , isActive: $appState.moveToRoot) {
////                    Text("New \(workout.name)")
////                    Image(systemName: workout.symbolName)
//                    WorkouttCellView(workout: workout)
//                }
//            }
//
            
            // ✅ 完美解决所谓的 bug
            ForEach(workouts) { workout in
                NavigationLink(destination: ScoreBoardView(workout: workout, action: {
                    self.tagToShow = nil}).environmentObject(appState)
                    .transition(.asymmetric(insertion: .opacity, removal: .scale))
                               
                               //                    .transition(.opacity)
                               //                    .animation(.easeIn)
                               , tag: workout.id, selection: $tagToShow) {
                    WorkoutCellView(workout: workout).environmentObject(appState)
                }
            }
            
            // TODO: ❎ 暂时不需要add 功能，如果需要修改五局三胜等，直接项目里面记住上回修改。
            Button {
                // showDetail = true
            } label: {
                HStack {
                    Text("Add Your Game")
                }
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle)
            .listRowInsets(
                EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
        .navigationBarTitle("Scorer")
        .listStyle(.carousel)
        
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
