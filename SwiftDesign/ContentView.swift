//
//  ContentView.swift
//  SwiftDesign
//
//  Created by 김동현 on 9/22/24.
//

/*
 기본
 https://ios-development.tistory.com/1075
 
 성공실패
 https://chicharios.tistory.com/22
 */

import SwiftUI

struct ContentView: View {
    @State var isToggled: Bool
    var body: some View {
        VStack {
            Button {
                isToggled.toggle()
                print("hello")
            } label: {
                Text("버튼 누르기")
            }
            .buttonStyle(myButton())
            
            
            Button {
                
            } label: {
                Text("패스트캠퍼스")
            }.buttonStyle(fastcampusButton(textColor: .black, borderColor: .black))
            
            Button {
                
            } label: {
                Text("커스텀 버튼")
            }.buttonStyle(IndexButton(textColor: .black, borderColor: .black))
            
            Button {
                
            } label: {
                Text("커스텀 버튼")
            }.buttonStyle(IndexButton(textColor: .black, borderColor: .black, width: 100))
        }
        .padding()
    }
}

#Preview {
    ContentView(isToggled: .init())
}
