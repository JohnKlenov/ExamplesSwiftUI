//
//  ModelBasic.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 14.09.24.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    let title:String
    var isCompleted:Bool
}
