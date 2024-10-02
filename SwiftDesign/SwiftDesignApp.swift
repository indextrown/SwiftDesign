//
//  SwiftDesignApp.swift
//  SwiftDesign
//
//  Created by 김동현 on 9/22/24.
//

import SwiftUI

@main
struct SwiftDesignApp: App {
    //@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    //private var backgroundTaskManager = BackgroundTaskManager.shared
    var body: some Scene {
        WindowGroup {
            ContentView(isToggled: .init())
//                .onAppear {
//                backgroundTaskManager.scheduleAppRefresh() // 첫 번째 API 호출 예약
//                            }
        }
    }
}
