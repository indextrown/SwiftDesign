//
//  BackgroundView.swift
//  SwiftDesign
//
//  Created by 김동현 on 9/23/24.
//

import SwiftUI

struct BackgroundStatusView: View {
    
    // MARK: - 앱의 현재 상태를 나타내는 환경변수
    /*
     .active: 
     앱이 포그라운드에 있고 사용자와 상호작용할 수 있는 상태.
     
     .inactive:
     앱이 포그라운드에 있지만 상호작용할 수 없는 상태 (잠깐 동안 또는 다른 이유로).
     
     .background:
     앱이 백그라운드로 전환된 상태.
     */
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        Text("상태 확인")
            .onChange(of: scenePhase) { newValue in
                switch newValue {
                case .active:
                    print("Active")
                case .inactive:
                    print("Inactive")
                case .background:
                    print("Background")
                default:
                    print("error")
                }
            }
    }
}

#Preview {
    BackgroundStatusView()
}
