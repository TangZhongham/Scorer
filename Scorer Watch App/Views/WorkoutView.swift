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
        Workout(name: "Badminton Battle", symbolName: "person.2"),
        Workout(name: "Simple Compete", symbolName: "figure.walk"),
        Workout(name: "Simple Single", symbolName: "bicycle"),
        Workout(name: "Outdoor Bike", symbolName: "bicycle"),
    ]
    
    let badminton = Workout(name: "羽毛球", symbolName: "gamecontroller.fill")
    let tabletennis = Workout(name: "乒乓球", symbolName: "person.and.arrow.left.and.arrow.right")
    
    @State var selectedItem = 0
    
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var workoutStateModel: WorkoutStateModel
    @State var isActive : Bool = false
    
    var body: some View {
        List {
            // 发现用observable object 选择也有 NavigationLink 的bug，先不管了，开发功能要紧
            ForEach(workoutStateModel.workouts) { workout in
                NavigationLink(destination: Text("Still developing \(workout.name)...")
                    .transition(.asymmetric(insertion: .opacity, removal: .scale))
                               , isActive: $appState.moveToRoot) {
                    Text("New \(workout.name)")
                    Image(systemName: workout.symbolName)
                }
            }
            
            NavigationLink(destination: Text("Still developing 羽毛球...")
                .transition(.asymmetric(insertion: .opacity, removal: .scale))
                           , isActive: $appState.moveToRoot) {
                WorkoutCellView(workout: badminton).environmentObject(appState)
            }
            
            
            NavigationLink(destination: Text("Still developing 乒乓球...")
                .transition(.asymmetric(insertion: .opacity, removal: .scale))
                           , isActive: $appState.moveToRoot) {
                WorkoutCellView(workout: tabletennis).environmentObject(appState)
            }
            
            
            ForEach(workouts) { workout in
                //                WorkoutCellView(workout: workout)
                // 这里可以通过 destination 传 workout 给下层view 做一个switch 判断给到哪个view。
                NavigationLink(destination: BadmintonView(workout: workout).environmentObject(appState)
                    .transition(.asymmetric(insertion: .opacity, removal: .scale))
                               
                               //                    .transition(.opacity)
                               //                    .animation(.easeIn)
                               , isActive: $appState.moveToRoot) {
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
        
        
        //        TabView {
        //            List {
        //                ForEach(workouts) { workout in
        //                    //                WorkoutCellView(workout: workout)
        //                    // 这里可以通过 destination 传 workout 给下层view 做一个switch 判断给到哪个view。
        //                    NavigationLink(destination: BadmintonView()) {
        //                        WorkoutCellView(workout: workout)
        //                    }
        //
        //                }
        //            }
        //            .navigationBarTitle("Scorer")
        //            .listStyle(.carousel)
        //            .tag(0)
        //
        //            TrainingChart()
        //                .tag(1)
        //        }
        //        .tabViewStyle(.page)
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
