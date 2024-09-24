//
//  CustomButtonView.swift
//  SwiftDesign
//
//  Created by 김동현 on 9/23/24.
//

import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        Button {
            print("hello")
        } label: {
            Text("버튼 누르기")
        }
        .buttonStyle(myButton())
        
        Button {
            
        } label: {
            Text("커스텀 버튼")
        }.buttonStyle(IndexButton(textColor: .black, borderColor: .black))
        
        Button {
            
        } label: {
            Text("커스텀 버튼")
        }.buttonStyle(IndexButton(textColor: .black, borderColor: .black, width: 100))
    }
}

#Preview {
    CustomButtonView()
}
