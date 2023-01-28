//
//  Store.swift
//  DigioTest
//
//  Created by Alan Paulino on 26/01/23.
//
import Foundation

// MARK: - Store
struct Store: Codable {
    let spotlight: [Spotlight]
    let products: [Product]
    let cash: Cash
}
