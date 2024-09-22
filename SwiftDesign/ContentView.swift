////
////  ContentView.swift
////  SwiftDesign
////
////  Created by 김동현 on 9/22/24.
////
//
///*
// 기본
// https://ios-development.tistory.com/1075
// 
// 성공실패
// https://chicharios.tistory.com/22
// 
// 리스트
// https://seons-dev.tistory.com/entry/SwiftUI-List#google_vignette
// https://ios-development.tistory.com/1094
// https://eunjoochoi.github.io/swiftui-tutorials/SwiftUI-8
//
// 화살표 숨기기
// https://bradheo.tistory.com/entry/SwiftUI-List-NavigationLink-item-숨기는-방법
// */
//
//import SwiftUI
//
//struct ContentView: View {
//    @State var isToggled: Bool
//    var body: some View {
//        // navigationTitle는 NavigationView 내에서만 동작
//        NavigationView {
//            VStack {
//                /*
//                Button {
//                    isToggled.toggle()
//                    print("hello")
//                } label: {
//                    Text("버튼 누르기")
//                }
//                .buttonStyle(myButton())
//                
//                Button {
//                    
//                } label: {
//                    Text("커스텀 버튼")
//                }.buttonStyle(IndexButton(textColor: .black, borderColor: .black))
//                
//                Button {
//                    
//                } label: {
//                    Text("커스텀 버튼")
//                }.buttonStyle(IndexButton(textColor: .black, borderColor: .black, width: 100))
//                */
//                
//                List {
//                    Section(header: Text("첫 번째 섹션")) {
//                        NavigationLink(destination: DetailView(item: "첫번째 리스트")) {
//                            Text("첫번째 리스트")
//                        }
//
//                        NavigationLink(destination: DetailView(item: "첫번째 리스트")) {
//                            Text("두번째 리스트")
//                        }
//                    }
//                    
//                    Section(header: Text("두 번째 섹션")) {
//                        NavigationLink(destination: DetailView(item: "첫번째 리스트")) {
//                            Text("세번째 리스트")
//                        }
//                        NavigationLink(destination: DetailView(item: "첫번째 리스트")) {
//                            Text("네번째 리스트")
//                        }
//                    }
//                    
//                    
//                    Section(header: Text("세 번째 섹션")) {
//                        NavigationLink(destination: DetailView(item: "첫번째 리스트")) {
//                            Text("다섯번째 리스트")
//                        }
//                        
//                        NavigationLink(destination: DetailView(item: "첫번째 리스트")) {
//                            Text("여섯번째 리스트")
//                        }
//                    }
//                }
//                .navigationTitle("ListView")
//
//            }
//        }
//    }
//}
//
//#Preview {
//    ContentView(isToggled: .init())
//}




import SwiftUI

struct ContentView: View {
    @State var isToggled: Bool

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("첫 번째 섹션")) {
                    ZStack(alignment: .leading) {
                        Text("첫번째 리스트")
                        NavigationLink(destination: DetailView(item: "첫번째 리스트")) {
                            EmptyView()
                        }.opacity(0.0) // 화살표 숨기기
                    }

                    ZStack(alignment: .leading) {
                        Text("두번째 리스트")
                        NavigationLink(destination: DetailView(item: "두번째 리스트")) {
                            EmptyView()
                        }.opacity(0.0)
                    }
                }
                
                Section(header: Text("두 번째 섹션")) {
                    ZStack(alignment: .leading) {
                        Text("세번째 리스트")
                        NavigationLink(destination: DetailView(item: "세번째 리스트")) {
                            EmptyView()
                        }.opacity(0.0)
                    }

                    ZStack(alignment: .leading) {
                        Text("네번째 리스트")
                        NavigationLink(destination: DetailView(item: "네번째 리스트")) {
                            EmptyView()
                        }.opacity(0.0)
                    }
                }
                
                Section(header: Text("세 번째 섹션")) {
                    ZStack(alignment: .leading) {
                        Text("다섯번째 리스트")
                        NavigationLink(destination: DetailView(item: "다섯번째 리스트")) {
                            EmptyView()
                        }.opacity(0.0)
                    }

                    ZStack(alignment: .leading) {
                        Text("여섯번째 리스트")
                        NavigationLink(destination: DetailView(item: "여섯번째 리스트")) {
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
    ContentView(isToggled: .init())
}
