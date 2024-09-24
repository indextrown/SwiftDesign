//
//  C.swift
//  SwiftDesign
//
//  Created by 김동현 on 9/23/24.
//

/*
 
 MARK: 문제 사항
 Snapshotting a view (0x107857150, UIButtonBarStackView) that is not in a visible window requires afterScreenUpdates:YES.
 
 MARK: 해결 방법
 NavigationView 가 Xcode 버전업과 iOS 17 버전에서 deprecated 되어서 NavigationStack로 변경 필수
 
 */

import SwiftUI

struct CustomListView: View {

    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("첫 번째 섹션")) {
                    ZStack(alignment: .leading) {
                        Text("첫번째 리스트")
                        NavigationLink(destination: ListDetailView(item: "첫번째 리스트")) {
                            EmptyView()
                        }.opacity(0.0) // 화살표 숨기기
                    }

                    ZStack(alignment: .leading) {
                        Text("두번째 리스트")
                        NavigationLink(destination: ListDetailView(item: "두번째 리스트")) {
                            EmptyView()
                        }.opacity(0.0)
                    }
                }

                Section(header: Text("두 번째 섹션")) {
                    ZStack(alignment: .leading) {
                        Text("세번째 리스트")
                        NavigationLink(destination: ListDetailView(item: "세번째 리스트")) {
                            EmptyView()
                        }.opacity(0.0)
                    }

                    ZStack(alignment: .leading) {
                        Text("네번째 리스트")
                        NavigationLink(destination: ListDetailView(item: "네번째 리스트")) {
                            EmptyView()
                        }.opacity(0.0)
                    }
                }

                Section(header: Text("세 번째 섹션")) {
                    ZStack(alignment: .leading) {
                        Text("다섯번째 리스트")
                        NavigationLink(destination: ListDetailView(item: "다섯번째 리스트")) {
                            EmptyView()
                        }.opacity(0.0)
                    }

                    ZStack(alignment: .leading) {
                        Text("여섯번째 리스트")
                        NavigationLink(destination: ListDetailView(item: "여섯번째 리스트")) {
                            EmptyView()
                        }.opacity(0.0)
                    }
                }
            }
            .navigationTitle("ListView")
        }
    }
}

#Preview {
    CustomListView()
}
