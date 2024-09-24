//
//  CustomListView.swift
//  SwiftDesign
//
//  Created by 김동현 on 9/23/24.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        List {
            Section(header: Text("첫 번째 섹션")) {
                NavigationLink(destination: ListDetailView(item: "첫번째 리스트")) {
                    Text("첫번째 리스트")
                }

                NavigationLink(destination: ListDetailView(item: "첫번째 리스트")) {
                    Text("두번째 리스트")
                }
            }

            Section(header: Text("두 번째 섹션")) {
                NavigationLink(destination: ListDetailView(item: "첫번째 리스트")) {
                    Text("세번째 리스트")
                }
                NavigationLink(destination: ListDetailView(item: "첫번째 리스트")) {
                    Text("네번째 리스트")
                }
            }


            Section(header: Text("세 번째 섹션")) {
                NavigationLink(destination: ListDetailView(item: "첫번째 리스트")) {
                    Text("다섯번째 리스트")
                }

                NavigationLink(destination: ListDetailView(item: "첫번째 리스트")) {
                    Text("여섯번째 리스트")
                }
            }
        }
        .navigationTitle("ListView")
    }
}

#Preview {
    ListView()
}
