//
//  PostViewModel.swift
//  iOS_Networking_2
//
//  Created by kim jong moon on 06/03/2021.
//

import Foundation

class PostViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    @Published var post =  Post()
    @Published var isLoading = false
    @Published var isCreated = false
    @Published var isUpdated = false
    @Published var isDeleted = false
    
    
    
    func apiEmployeeList() {
        isLoading = true
        AFHttp.get(url: AFHttp.API_POST_LIST, params: AFHttp.paramsEmpty(), handler: { response in
            self.isLoading = false
            switch response.result {
            case .success:
                //print(response.result)
                let posts = try! JSONDecoder().decode([Post].self, from: response.data!)//......Parsing_Part
                self.posts = posts
            case let .failure(error):
                print(error)
            }
        })
    }
    func apiEmployeeSingle(id: Int) {
        isLoading = true
        AFHttp.get(url: AFHttp.API_POST_SINGLE + String(id), params: AFHttp.paramsEmpty(), handler: { response in
            self.isLoading = true
            switch response.result {
            case .success:
                //print(response.result)
                let post = try! JSONDecoder().decode(Post.self, from: response.data!)
                self.post = post
            case let .failure(error):
                print(error)
            }
        })
    }
    func apiEmployeeCreate(post: Post) {
        isLoading = true
        AFHttp.post(url: AFHttp.API_POST_CREATE, params: AFHttp.paramsPostCreate(post: post), handler: { response in
            switch response.result {
            case .success:
                print(response.result)
                self.isCreated = true
            case let .failure(error):
                print(error)
            }
        })
    }
    func apiEmployeeUpdate(post: Post) {
        isLoading = true
        AFHttp.put(url: AFHttp.API_POST_UPDATE + String(post.id!), params: AFHttp.paramsPostUpdate(post: post), handler: { response in
            self.isLoading = false
            switch response.result {
            case .success:
                print(response.result)
                self.isUpdated = true
            case let .failure(error):
                print(error)
            }
        })
    }
    func apiEmployeeDelete(post: Post) {
        isLoading = true
        AFHttp.del(url: AFHttp.API_POST_DELETE + String(post.id!), params: AFHttp.paramsEmpty(), handler: { response in
            self.isLoading = false
            switch response.result {
            case .success:
                print(response.result)
                self.isDeleted = true
            case let .failure(error):
                print(error)
            }
        })
    }
    
}

