//
//  NotificationCenterCH№2.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 21.09.24.
//

import Foundation
import Combine



// MARK: Old NotificationCenter

//private func addOldObserverForNotification() {
//        NotificationCenter.default
//            .addObserver(
//                self,
//                selector: #selector(catchNotification),
//                name: UIApplication.didEnterBackgroundNotification,
//                object: nil
//            )
//    }
//
//    @objc
//    private func catchNotification() {
//        print("catched old notification")
//    }




// MARK: New NotificationCenter


//private var bag = Set<AnyCancellable>()
//    private func subscribeForNotification() {
//        NotificationCenter.default
//            .publisher(for: UIApplication.didEnterBackgroundNotification)
//            .sink { notification in
//                print(notification.name.rawValue)
//            }
//            .store(in: &bag)
//    }
