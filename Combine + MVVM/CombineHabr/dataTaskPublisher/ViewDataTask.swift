//
//  ViewDataTask.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 14.09.24.
//

import SwiftUI

struct ViewDataTask: View {
    
    @State private var viewModel = PostsViewModelDataTask()
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading ...")
                } else {
                    List(viewModel.posts) { post in
                        VStack(alignment: .leading) {
                            Text(post.title)
                                .font(.headline)
                            Text(post.body)
                                .font(.subheadline)
                        }
                    }
                }
                
            }
            .navigationTitle("Posts")
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("FetchData") {
                        viewModel.fetchPosts()
                    }
                    .foregroundStyle(Color(uiColor: .tintColor))
                }
                
            })
        }
    }
}

#Preview {
    ViewDataTask()
}
