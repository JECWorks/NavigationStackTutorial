//
//  ContentView.swift
//  NavigationStackTutorial
//
//  Created by Jason Cox on 7/15/24.
//

import SwiftUI

struct CarBrand: Identifiable, Hashable {
    let name: String
    let id = NSUUID().uuidString
}

struct Car: Identifiable, Hashable {
    let id = NSUUID().uuidString
    let make: String
    let model: String
    let year: Int
    
    var description: String {
        return "\(year) \(make) \(model)"
    }
}

struct ContentView: View {
    let brands: [CarBrand] = [
        .init(name: "Ferrari"),
        .init(name: "Lamborghini"),
        .init(name: "BMW"),
        .init(name: "Mercedes"),
        .init(name: "Aston Martin")
    ]
    
    let cars: [Car] = [
        .init(make: "Ferrari", model: "488", year: 2022),
        .init(make: "Lamborghini", model: "Aventador", year: 2023),
        .init(make: "BMW", model: "M5", year: 2024),
        .init(make: "Mercedes", model: "AMG 63", year: 2019),
        .init(make: "Aston Martin", model: "Vantage", year: 2021)
    ]
    var body: some View {
        NavigationStack {
            List {
                Section("Makes") {
                    ForEach(brands) { brand in
                        NavigationLink(value: brand) {
                            Text(brand.name)
                        }
                    }
                }
            }
        
            .navigationDestination(for: CarBrand.self) { brand in
                Text("New \(brand.name)")
            }
        }
    }
}

#Preview {
    ContentView()
}
