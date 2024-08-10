//
//  GalleryView.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 22.07.24.
//

import SwiftUI

struct GalleryView: View {
    
    var images: [GalleryImage] = ItemStore.imageGallery
    var body: some View {
        
        NavigationView {
            ScrollView {

                LazyVStack(spacing:10) {
                    ForEach(images) { item in
                        Image(item.imageName)
                            .frame(height: 250)
                            .aspectRatio(contentMode: .fill)
//                            .frame(height: 250)
//                            .scaledToFit()
//                            .padding(.horizontal, 16)
                            
                    }
                }
            }
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}

//                , id:\.self
//                            .frame(width: nil, height: 250, alignment: .center)
