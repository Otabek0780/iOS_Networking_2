//
//  PostViewModel.swift
//  iOS_Networking_2
//
//  Created by kim jong moon on 06/03/2021.
//

import Foundation

class PostViewModel: ObservableObject {
    
    func apiEmployeeList() {
        AFHttp.get(url: AFHttp.API_POST_LIST, params: AFHttp.paramsEmpty(), handler: { response in
            switch response.result {
            case .success:
                print(response.result)
            case let .failure(error):
                print(error)
            }
        })
    }
    func apiEmployeeSingle(id: Int) {
        AFHttp.get(url: AFHttp.API_POST_SINGLE + String(id), params: AFHttp.paramsEmpty(), handler: { response in
            switch response.result {
            case .success:
                print(response.result)
            case let .failure(error):
                print(error)
            }
        })
    }
    func apiEmployeeCreate(post: Post) {
        AFHttp.post(url: AFHttp.API_POST_CREATE, params: AFHttp.paramsPostCreate(post: post), handler: { response in
            switch response.result {
            case .success:
                print(response.result)
            case let .failure(error):
                print(error)
            }
        })
    }
    func apiEmployeeUpdate(post: Post) {
        AFHttp.put(url: AFHttp.API_POST_UPDATE + String(post.id!), params: AFHttp.paramsPostUpdate(post: post), handler: { response in
            switch response.result {
            case .success:
                print(response.result)
            case let .failure(error):
                print(error)
            }
        })
    }
    func apiEmployeeDelete(post: Post) {
        AFHttp.del(url: AFHttp.API_POST_DELETE + String(post.id!), params: AFHttp.paramsEmpty(), handler: { response in
            switch response.result {
            case .success:
                print(response.result)
            case let .failure(error):
                print(error)
            }
        })
    }
    
}

