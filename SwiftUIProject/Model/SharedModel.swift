//
//  SharedModel.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 22.07.24.
//

import Foundation

struct Model: Identifiable {
    let id: Int
    let name:String
    let imageName:String
    let description:String
}

struct GalleryImage: Identifiable {
    let id: Int
    let name:String
    let imageName:String
}

struct ItemStore {
    
    var language:[Model] = [Model.init(id: 1, name: "SwiftUI", imageName: "swift", description: "Declarative framework"), Model.init(id: 2, name: "Flutter", imageName: "cloud", description: "Declarative framework"), Model.init(id: 3, name: "UIKit", imageName: "sun.max.fill", description: "Imperative framework")]

    var weather:[Model] = [Model.init(id: 2, name: "cloud", imageName: "cloud", description: "Weather conditions"), Model.init(id: 1, name: "Sun", imageName: "sun.max.fill", description: "Clear weather")]
    
   static let imageGallery: [GalleryImage] = [GalleryImage(id: 0, name: "DanaMall", imageName: "Dana"), GalleryImage(id: 1, name: "CastleMall", imageName: "Castle"), GalleryImage(id: 2, name: "DiamondMall", imageName: "Diamond"), GalleryImage(id: 3, name: "GreenMall", imageName: "Green"), GalleryImage(id: 4, name: "MinskCityMall", imageName: "MinskCity"), GalleryImage(id: 5, name: "MomoMall", imageName: "Momo"), GalleryImage(id: 6, name: "OutletoMall", imageName: "Outleto")]
}
