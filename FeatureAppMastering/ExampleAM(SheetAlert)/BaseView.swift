//
//  BaseView.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 13.08.24.
//

import SwiftUI

struct BaseView: View {
    @State var showDetailView = false
    @State var selectedArticle: Article?
    
    var body: some View {
        NavigationView {
            List(articles) { article in
                ArticleRow(article: article)
                    .listRowSeparator(.hidden)
                    .onTapGesture {
                        showDetailView = true
                        selectedArticle = article
                    }
            }
            .listStyle(.plain)
            .navigationTitle("Статьи")
//            .sheet(item: $selectedArticle) { article in
//                ArticleDetailView(article: article)
//            }
            .sheet(isPresented: $showDetailView) {
                print("onDismiss")
            } content: {
                if let selectedArticle = selectedArticle {
                    ArticleDetailView(article: selectedArticle)
                }
            }
        }
        
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}

struct ArticleRow: View {
    var article: Article
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Image(article.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(5)
            
            Text(article.title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .lineLimit(3)
                .padding(.bottom, 0)
            
            Text("Автор \(article.author)".uppercased())
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 0)
                
            HStack(spacing: 3) {
                ForEach(1...(article.rating), id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundColor(.yellow)
                }
                
                
            }
            
            Text(article.excerpt)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
        }
    }
}

