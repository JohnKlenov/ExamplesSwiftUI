//
//  ArticleDetailView.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 13.08.24.
//

import SwiftUI

struct ArticleDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var showingAlert = false
    @State var dataPresenting = DataAlert(title: "New Alert", description: "Send presenting data in init")
    @State var error: SubmitReviewError? = nil
    @State var returnEmail: String = ""
    @State var returnPassword: String = ""
//    @State var selectedColor = "None"
    
    @State private var selectedColor: Color = .gray
    var article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                Image(article.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
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
        .overlay {
            HStack {
                Spacer()
                VStack {
                    Button {
//                        dismiss()
                        error = .noNetworkConnection
                        showingAlert = true
                    } label: {
                        Image(systemName: "xmark")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                    }
                    .padding(.top, 40)
                    .padding(.trailing, 20)
                    Spacer()
                }
            }
        }
        
        /// three button
//        .alert("Alert", isPresented: $showingAlert) {
//
//            Button("Ok") {}
//            Button("Cancel", role: .cancel) {}
//            Button("Delete", role: .destructive) {
//                showingAlert = false
//            }
//
//        } message: {
//            Text("This is test alert!")
//        }
        
        /// presenting data
//        .alert(dataPresenting.title, isPresented: $showingAlert, presenting: dataPresenting) { data in
//            Button("Read") {}
//            Button("Cancel", role: .cancel) {}
//        } message: { data in
//            Text(data.description)
//        }
        
       /// presenting error
//        .alert(isPresented: $showingAlert, error: error) { err in
//            Button("DeleteReview", role: .destructive) {}
//        } message: { err in
//            Text(err.recoverySuggestion ?? "Try againe later")
//        }

        /// TextField and alert
        .alert(Text("We need to varify you again"), isPresented: $showingAlert) {

            Button("Ok") {}
            Button("Cancel", role: .cancel) {}
            TextField("enter", text: $returnEmail)
                .textContentType(.creditCardNumber)
            SecureField("enter", text: $returnPassword)
        } message: {
            Text("Please enter you pin")
        }
        
//        .confirmationDialog(Text("Select a color"), isPresented: $showingAlert, titleVisibility: .visible) {
//
//            Button(role: .destructive) {
//                print("did tap redButton")
//            } label: {
//                Text("Red")
//            }
//
//
//            Button("Green") {
//                selectedColor = "Green"
//            }
//
//            Button("Blue") {
//                selectedColor = "Blue"
//            }
//        }
        
//        .confirmationDialog("Select a color", isPresented: $showingAlert, titleVisibility: .visible) {
//            Button("Red") {
//                selectedColor = .red
//            }
//            .foregroundColor(.red) // Устанавливаем цвет текста кнопки
//
//            Button("Green") {
//                selectedColor = .green
//            }
//            .foregroundColor(.green) // Устанавливаем цвет текста кнопки
//
//            Button("Blue") {
//                selectedColor = .blue
//            }
//            .foregroundColor(.blue) // Устанавливаем цвет текста кнопки
//        }
        
//        .confirmationDialog("Change background", isPresented: $showingAlert, titleVisibility: .visible) {
//            Button("Red") {}
//            Button("Green") {}
//            Button("Blue") {}
//            Button("Cancel", role: .cancel) { }
//        } message: {
//            Text("Select a new color")
//        }

        


    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(article: articles[0])
    }
}


struct CustomConfirmationDialog: View {
    @Binding var isPresented: Bool
    @State private var selectedColor: Color = .gray

    var body: some View {
        VStack {
            Text("Select a color:")
                .font(.headline)
                .padding()

            Button("Red") {
                selectedColor = .red
            }
            .foregroundColor(selectedColor)

            Button("Green") {
                selectedColor = .green
            }
            .foregroundColor(selectedColor)

            Button("Blue") {
                selectedColor = .blue
            }
            .foregroundColor(selectedColor)

            Button("Cancel") {
                isPresented = false
            }
        }
        .padding()
    }
}


struct DataAlert: Identifiable {
    var id: String { title }
    let title: String
    let description: String
}

enum SubmitReviewError: Error, LocalizedError {
    case notBoughtProduct
    case noNetworkConnection

    var failureReason: String? {
        switch self {
            case .notBoughtProduct:
               return "Did not buy prouct."
            case .noNetworkConnection:
               return "No Internet."
        }
    }

    var recoverySuggestion: String? {
        switch self {
            case .notBoughtProduct:
               return "Maybe try next time."
            case .noNetworkConnection:
               return "Please, check settings."
        }
    }

    var errorDescription: String? {
        switch self {
            case .notBoughtProduct:
               return "Maybe try next time."
            case .noNetworkConnection:
               return "You are not connected to the internet."
        }
    }
}

struct ErrorInfo: LocalizedError {
    var errorDescription: String?
    var failureReason: String?
    var recoverySuggestion: String?
    var helpAnchor: String?
}


// MARK: - Trash


/// ferst version button exit modal present
//                ZStack(alignment: .topTrailing) {
//                    Image(article.image)
//                        .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    Button {
//                        dismiss()
//                    } label: {
//                        Image(systemName: "xmark")
//                            .padding()
//                            .font(.system(size: 30))
//                            .foregroundColor(.white)
//                    }
//
//                }
