//
//  BackgroundAlarmView.swift
//  SwiftDesign
//
//  Created by 김동현 on 9/23/24.
//

import SwiftUI

struct BackgroundAlarmView: View {
    
    // MARK: - App 현재 상태를 나타내는 환경변수
    // MARK: - Enviroment: 앱 전역에서 공유되는 데이터에 접근하기 위한 속성 래퍼, 부모 뷰와 상위 계층에서 설정한 환경 값을 지식 뷰가 접근할 수 있도록 한다
    @Environment(\.scenePhase) var scenePhase
    
    // MARK: - 타이머
    // MARK: - @State: 뷰 내부에서 로컬 상태를 관리할때 사용 -> 변경시 뷰를 다시 렌더링한다
    @State private var timer: Timer?
    
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
    BackgroundAlarmView()
}






/*
 
 @State와 @Environment는 SwiftUI에서 상태 관리와 데이터 흐름을 관리하기 위한 속성 래퍼입니다. 두 개념은 비슷해 보이지만, 역할과 사용 방식이 다릅니다.

 @State
 정의: @State는 View 내부에서 소유하는 데이터를 저장하고 관리하는 속성 래퍼입니다.
 용도: 뷰 내부에서 로컬 상태를 관리할 때 사용됩니다. 상태가 변경되면 SwiftUI는 자동으로 뷰를 다시 렌더링합니다.
 특징:
 뷰 내부에서만 사용되고, 다른 뷰나 외부에서 직접 접근할 수 없습니다.
 상태가 변경될 때마다 그 상태를 참조하는 뷰는 다시 그려집니다.
 데이터는 뷰가 파괴될 때 사라집니다.
 예시:
 swift
 코드 복사
 struct CounterView: View {
     @State private var count = 0  // count가 변하면 뷰가 다시 렌더링됨.

     var body: some View {
         VStack {
             Text("Count: \(count)")
             Button("증가") {
                 count += 1  // 버튼을 클릭하면 count가 증가하고 뷰가 다시 그려짐.
             }
         }
     }
 }
 @Environment
 정의: @Environment는 애플리케이션 전역에서 공유되는 데이터에 접근하기 위한 속성 래퍼입니다. SwiftUI는 부모 뷰나 앱의 상위 계층에서 설정한 환경 값을 자식 뷰가 접근할 수 있도록 합니다.
 용도: 전역적 또는 컨텍스트에 따른 데이터를 관리할 때 사용됩니다. SwiftUI에서 제공하는 기본적인 환경값 (scenePhase, colorScheme, locale 등)이나 개발자가 만든 커스텀 환경값을 전달할 수 있습니다.
 특징:
 뷰가 @Environment로 선언된 변수를 사용하면, 이 값은 해당 뷰의 상위 계층에서 설정된 값을 참조합니다.
 상태 관리보다는 상태에 따른 반응을 처리하는 용도로 주로 사용됩니다.
 예시:
 swift
 코드 복사
 struct EnvironmentExampleView: View {
     @Environment(\.colorScheme) var colorScheme  // 앱의 전역적인 색상 테마에 접근

     var body: some View {
         Text("현재 색상 테마: \(colorScheme == .dark ? "다크 모드" : "라이트 모드")")
     }
 }
 차이점 요약
 특성    @State    @Environment
 데이터 소유권    뷰 내부에서 소유, 로컬 상태    앱 또는 부모 뷰에서 전달된 전역 상태
 데이터 공유    뷰 내부에서만 사용 가능    여러 뷰에서 공유 가능, 상위 계층에서 전달
 변경 영향    상태 변경 시 해당 뷰만 다시 렌더링    상위 계층에서 변경된 값에 반응하여 변경
 사용 용도    로컬 상태 관리 (카운터, 입력 값 등)    전역 상태나 환경에 따른 반응 (테마, 화면 크기 등)
 이렇게 @State는 로컬 상태에, @Environment는 전역 또는 상위 뷰에서 제공되는 값에 사용된다고 이해할 수 있습니다.
 */
