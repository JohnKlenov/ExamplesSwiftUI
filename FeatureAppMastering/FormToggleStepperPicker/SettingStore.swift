//
//  SettingStore.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 1.09.24.
//

import Foundation


final class SettingStore {
    
    init() {
        ///регистрируем значения по умолчанию для трёх настроек
        UserDefaults.standard.register(defaults: ["view.preferences.showBookedOnly" : false,
                                                  "view.preferences.displayOrder" : 0,
                                                  "view.preferences.maxPriceLevel" : 5
                                                 ])
    }
    
    var showBookedOnly: Bool = UserDefaults.standard.bool(forKey: "view.preferences.showBookedOnly") {
        didSet {
            UserDefaults.standard.set(showBookedOnly, forKey: "view.preferences.showBookedOnly")
        }
    }
    
    var displayOrder: DisplayOrderType = DisplayOrderType(type: UserDefaults.standard.integer(forKey: "view.preferences.displayOrder")) {
        didSet {
            UserDefaults.standard.set(displayOrder.rawValue, forKey: "view.preferences.displayOrder")
        }
    }
    
    var maxPriceLevel: Int = UserDefaults.standard.integer(forKey: "view.preferences.maxPriceLevel") {
        didSet {
            UserDefaults.standard.set(maxPriceLevel, forKey: "view.preferences.maxPriceLevel")
        }
    }
}
