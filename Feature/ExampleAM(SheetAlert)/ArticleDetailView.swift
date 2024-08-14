//
//  ArticleDetailView.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 13.08.24.
//

import SwiftUI

struct ArticleDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                ZStack(alignment: .topTrailing) {
                    Image(article.image)
                        .resizable()
                    .aspectRatio(contentMode: .fit)
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .padding()
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    }

                }
                ///Это контейнер, который группирует элементы вместе. В этом случае он используется для применения общих модификаторов к заголовку и имени автора.
                
                
                Group {
                    Text(article.title)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                        .lineLimit(3)
                    
                    Text("Автор \(article.author)".uppercased())
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.bottom, 0)
                .padding(.horizontal)
                
                Text(article.content)
                    .font(.body)
                    .padding()
                    .lineLimit(1000)
                    .multilineTextAlignment(.leading)
            }
            
        }
        
        .ignoresSafeArea(.all, edges: .top)
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(article: articles[0])
    }
}
