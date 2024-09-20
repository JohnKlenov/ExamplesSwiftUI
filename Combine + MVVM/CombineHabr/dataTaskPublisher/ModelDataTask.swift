//
//  ModelDataTask.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 14.09.24.
//

import Foundation

struct PostDataTask: Identifiable, Decodable {
    let id:Int
    let title:String
    let body:String
}
