//
//  Model.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 27.08.24.
//


import Foundation


struct Car: Identifiable {
    enum CarType: String {
        case sedan = "Седан"
        case coupe = "Купе"
        case hatchback = "Хэтчбек"
        case universal = "Универсал"
        case crossover = "Кроссовер"
    }

    var id = UUID()
    var name: String
    var type: CarType
    var vin: String
    var image: String
    var priceLevel: Int
    var isFavorite: Bool = false
    var isBooked: Bool = false
}


struct FakeData {
    static let cars: [Car] = [
        Car(name: "Ford Focus 3", type: .hatchback, vin: "4T1BF1EK9BU399111", image: "fordFocus", priceLevel: 3),
        Car(name: "Toyota Camry", type: .sedan, vin: "4T1BF1EK9BU390168", image: "toyotaCamry", priceLevel: 4),
        Car(name: "Honda Civic", type: .coupe, vin: "JHMFA3H61CS002101", image: "hondaCivic", priceLevel: 2),
        Car(name: "Audi A3", type: .hatchback, vin: "WVWZZZ1JZLM091326", image: "audiA3", priceLevel: 5),
        Car(name: "BMW 3 Series", type: .sedan, vin: "WBA3A1C51FV785925", image: "bmw3Series", priceLevel: 5),
        Car(name: "Mercedes-Benz CLA", type: .coupe, vin: "WDDGF5HB3EA091992", image: "mercedesBenzCLA", priceLevel: 5),
        Car(name: "Subaru Outback", type: .universal, vin: "JF1GR5E39F8600795", image: "subaruOutback", priceLevel: 3),
        Car(name: "Volkswagen Golf", type: .hatchback, vin: "WVWZZZ1JZLM091326", image: "volkswagenGolf", priceLevel: 3),
        Car(name: "Hyundai Tucson", type: .crossover, vin: "KMHDH41E3CU059021", image: "hyundaiTucson", priceLevel: 2),
        Car(name: "Kia Sportage", type: .crossover, vin: "KNAFU413BC5012798", image: "kiaSportage", priceLevel: 2),
        Car(name: "Mazda CX-5", type: .crossover, vin: "JM1NC2JUXC0402137", image: "mazdaCX5", priceLevel: 3)
    ]

}


enum DisplayOrderType: Int, CaseIterable {
    case alphabetical = 0
    case favoriteFirst = 1
    case bookedFirst = 2
    
    init(type:Int) {
        switch type {
        case 0: self = .alphabetical
        case 1: self = .favoriteFirst
        case 2: self = .bookedFirst
        default: self = .alphabetical
        }
    }
    
    var text: String {
        switch self {
        case .alphabetical: return "Алфавитный порядок"
        case .favoriteFirst: return "Показывать сначала избранные"
        case .bookedFirst: return "Показывать сначала забронированные"
        }
    }
    
    /// возвращает логическое выражение(предикат), которое возвращает true или false
    /// для метода sorted(by: )
    func predicate() -> (Car, Car) -> Bool {
        switch self {
        case .alphabetical: return {$0.name < $1.name}
        case .bookedFirst: return {$0.isBooked && !$1.isBooked}
        case .favoriteFirst: return {$0.isFavorite && !$1.isFavorite}
        }
    }
}
