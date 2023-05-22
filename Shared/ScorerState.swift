//
//  ScorerState.swift
//  Scorer
//
//  Created by 唐某某 on 2023/5/22.
//

import Foundation
import SwiftUI

class ScorerState: ObservableObject {
    @Published var path : NavigationPath
    
    func popToRoot() {
            path.removeLast(path.count)
        }
    
    init() {
            self.path = NavigationPath()
        }
}
