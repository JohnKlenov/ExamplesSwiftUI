//
//  NetworkManagerDI.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 6.10.24.
//

import Foundation


protocol URLProvider {
    var url: URL { get }
}

class RealURLProvider: URLProvider {
    // This class provides the actual production URL
    var url: URL { return URL(string: "https://example.com/api/data")! }
}

class MockURLProvider: URLProvider {
    // This class can be used for testing with a mock URL
    var url: URL { return URL(string: "https://mock.com/data")! }
}


// With Dependency Injection:
 class NetworkManagerDI: ObservableObject {
    private let urlProvider: URLProvider

    init(urlProvider: URLProvider) {
        self.urlProvider = urlProvider
    }

    func fetchData() {
        let url = urlProvider.url
        let session = URLSession.shared
        // ... (rest of the network fetching code using the provided URL)
        print("Network fetch completed..")
    }
 }
