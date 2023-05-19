//
//  HapticTestView.swift
//  Scorer Watch App
//
//  Created by 唐某某 on 2023/5/19.
//

import SwiftUI


struct HapticTestView: View {
    var body: some View {
        List(WKHapticType.allCases, id: \.self) { haptic in
            Button(action: {
                WKInterfaceDevice.current().play(haptic)
            }) {
                Text(haptic.name(for: haptic.rawValue))
            }
        }
    }
}

extension WKHapticType: CaseIterable {
    public static var allCases: [WKHapticType] {
        var hapticTypes = [WKHapticType]()
        for rawValue in 0...8 {
            hapticTypes.append(WKHapticType(rawValue: rawValue)!)
        }
        return hapticTypes
    }
    
    func name(for rawValue: Int) -> String {
        switch rawValue {
        case 0:
            return "Notification"
        case 1:
            return "Direction Up"
        case 2:
            return "Direction Down"
        case 3:
            return "Success"
        case 4:
            return "Failure"
        case 5:
            return "Retry"
        case 6:
            return "Start"
        case 7:
            return "Stop"
        case 8:
            return "Click"
        default:
            break
        }
        
        return ""
    }
}


struct HapticTestView_Previews: PreviewProvider {
    static var previews: some View {
        HapticTestView()
    }
}
