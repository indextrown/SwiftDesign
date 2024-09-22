//
//  CustomButton.swift
//  SwiftDesign
//
//  Created by 김동현 on 9/22/24.
//

import SwiftUI

// MARK: - 블로그 커스텀 버튼
struct myButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            
            Rectangle()
                .frame(height: 50)      // 높이
                .cornerRadius(4)        // 둥글게
                .foregroundColor(.blue) // 배경색
            
            configuration.label
                .foregroundColor(.white) // 글자색
        }
    }
}

// MARK: - 패스트캠퍼스 버튼
struct fastcampusButton: ButtonStyle {
    
    let textColor: Color
    let borderColor: Color
    
    // borderColor를 전달하지 않으면, 기본적으로 textColor를 테두리 색상으로 사용
    init(textColor: Color, borderColor: Color? = nil) {
        self.textColor = textColor
        self.borderColor = borderColor ?? textColor
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            // MARK: - 텍스트와 텍스트색상
            .font(.system(size: 14))
            .foregroundColor(textColor)
        
            // MARK: - 버튼의 크기
            .frame(maxWidth: .infinity, maxHeight: 50)
        
            // MARK: - 테두리 설정
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    // 테두리 색상
                    .stroke(borderColor, lineWidth: 0.8)
            }
            
            // MARK: - 버튼 양옆에 15의 패딩 적용
            .padding(.horizontal, 15)
            
            // MARK: - 버튼을 누를 때의 효과
            .opacity(configuration.isPressed ? 0.5 : 1) // 0: 투명 1: 불투명
        
            // MARK: - 터치 영역 조정(둥근 사각형 모양으로 시각적 요소에 맞는 터치 가능한 영역 생성)
            .contentShape(RoundedRectangle(cornerRadius: 5)) // 터치 영역을 늘림
    }
}

// MARK: - Index 커스텀 버튼
struct IndexButton: ButtonStyle {
    
    let textColor: Color
    let borderColor: Color
    let width: CGFloat
    let height: CGFloat
    
    init(textColor: Color, borderColor: Color? = nil, width: CGFloat? = nil,  height: CGFloat? = nil) {
        self.textColor = textColor
        self.borderColor = borderColor ?? textColor
        self.width = width ?? .infinity
        self.height = height ?? 50
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            // MARK: - 텍스트와 텍스트색상
            .font(.system(size: 14))
            .foregroundColor(textColor)
        
            // MARK: - 버튼의 크기
            .frame(maxWidth: width, maxHeight: height)
        
            // MARK: - 테두리 설정
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    // 테두리 색상
                    .stroke(borderColor, lineWidth: 0.8)
            }
            
            // MARK: - 버튼 양옆에 15의 패딩 적용
            .padding(.horizontal, 15)
            
            // MARK: - 버튼을 누를 때의 효과
            .opacity(configuration.isPressed ? 0.5 : 1) // 0: 투명 1: 불투명
        
            // MARK: - 터치 영역 조정(둥근 사각형 모양으로 시각적 요소에 맞는 터치 가능한 영역 생성)
            .contentShape(RoundedRectangle(cornerRadius: 5)) // 터치 영역을 늘림
    }
}
