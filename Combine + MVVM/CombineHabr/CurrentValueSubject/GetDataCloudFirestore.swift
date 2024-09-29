//
//  GetDataCloudFirestore.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 26.09.24.
//





// MARK: Model


//import Combine
//
//protocol FirestoreViewModelProtocol: ObservableObject {
//    var items: [Item] { get }
//    var isLoading: Bool { get }
//    var errorMessage: String? { get }
//    func fetchData()
//}






//import Foundation
//import FirebaseFirestoreSwift
//
//struct Item: Identifiable, Codable {
//    @DocumentID var id: String?
//    var name: String
//    var description: String
//}






// MARK: ViewModel


//import Combine
//import FirebaseFirestore
//import FirebaseFirestoreSwift
//
//class FirestoreViewModel: FirestoreViewModelProtocol {
//    @Published var items: [Item] = []
//    @Published var isLoading = false
//    @Published var errorMessage: String?
//    private var cancellables = Set<AnyCancellable>()
//    private let db = Firestore.firestore()
//    private let subject = PassthroughSubject<[Item], Error>()
//
//    init() {
//        subject
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { [weak self] completion in
//                switch completion {
//                case .failure(let error):
//                    self?.errorMessage = error.localizedDescription
//                case .finished:
//                    break
//                }
//                self?.isLoading = false
//            }, receiveValue: { [weak self] items in
//                self?.items = items
//            })
//            .store(in: &cancellables)
//    }
//
//    func fetchData() {
//        isLoading = true
//        db.collection("items").addSnapshotListener { [weak self] querySnapshot, error in
//            if let error = error {
//                self?.subject.send(completion: .failure(error))
//            } else {
//                let items = querySnapshot?.documents.compactMap { document -> Item? in
//                    try? document.data(as: Item.self)
//                } ?? []
//                self?.subject.send(items)
//            }
//        }
//    }
//}







// MARK: View


//import SwiftUI
//
//struct ContentView: View {
//    @StateObject private var viewModel: FirestoreViewModelProtocol = FirestoreViewModel()
//
//    var body: some View {
//        NavigationView {
//            ZStack {
//                if viewModel.isLoading {
//                    ProgressView("Loading...")
//                } else {
//                    List(viewModel.items) { item in
//                        VStack(alignment: .leading) {
//                            Text(item.name)
//                                .font(.headline)
//                            Text(item.description)
//                                .font(.subheadline)
//                        }
//                    }
//                }
//            }
//            .navigationTitle("Items")
//            .alert(item: $viewModel.errorMessage) { errorMessage in
//                Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
//            }
//            .onAppear {
//                viewModel.fetchData()
//            }
//        }
//    }
//}
