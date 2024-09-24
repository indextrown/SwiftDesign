//
//  CustomView.swift
//  SwiftDesign
//
//  Created by 김동현 on 9/23/24.
//

import SwiftUI

struct ListDetailView: View {
    let item: String
    
    var body: some View {
        VStack {
            Text("상세화면: \(item)")
                .font(.largeTitle)
        }
        .navigationTitle("상세화면")
        
        // MARK: - 제목을 중앙에 표시
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ListDetailView(item: "테스트")
}
