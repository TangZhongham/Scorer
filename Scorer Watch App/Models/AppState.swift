//
//  AppState.swift
//  Scorer Watch App
//
//  Created by 唐某某 on 2023/5/19.
//

import Foundation
import SwiftUI
import Combine

class AppState: ObservableObject {
    @Published var moveToRoot: Bool = false
}
