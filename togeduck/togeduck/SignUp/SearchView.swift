//
//  SearchView.swift
//  togeduck
//
//  Created by Yoonjae on 2022/04/07.
//

//import SwiftUI
//
//struct SearchView: View {
//    @Environment(\.dismissSearch) var dismissSearch
//
//    var results: [String] {
//        if searchingFor.isEmpty {
//            return hobbies
//        } else {
//            return hobbies.filter { $0.contains(searchingFor)}
//        }
//    }
//
//    @State var searchingFor = ""
//    let hobbies: [String] = ["밴드음악", "밴드부", "밴드동아리", "밴드음악", "밴드필라테스", "밴드공연", "헤어밴드","축구","야구","영화","사진","드라마","애니","스피커","Apple"]
//    var body: some View {
//        NavigationView {
//            VStack{
//                List(results, id: \.self) { hobby in
//                    Text(hobby)
//                    }
//                .navigationTitle("취미 검색")
//            }
//
//            .searchable(text: $searchingFor,  placement: .navigationBarDrawer(displayMode: .always))
//        }
//    }
//}
//
//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
