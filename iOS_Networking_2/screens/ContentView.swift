//
//  ContentView.swift
//  iOS_Networking_2
//
//  Created by kim jong moon on 06/03/2021.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    
    @ObservedObject var viewModel = PostViewModel()

    var body: some View {
        NavigationView {
            ZStack{
                List(self.viewModel.posts, id:\.id){ post in
                    VStack(alignment: .leading){
                        Text(post.title!.uppercased())
                            .fontWeight(.bold)
                        Text(post.body!).padding(.top,5)
                    }
                }
                if self.viewModel.isLoading {
                    ProgressView()
                }
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("Post")
            
        }.onAppear{
            self.viewModel.apiEmployeeList()
            //apiEmployeeSingle(id: 1)
            //let post = Post(title: "pdp", body: "academy")
            //apiEmployeeCreate(post: post)
            //apiEmployeeUpdate(post: post)
            //apiEmployeeDelete(post: post)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
