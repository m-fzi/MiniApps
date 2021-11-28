//
//  ExpenseItem.swift
//  iExpense
//
//  Created by f on 23.11.2021.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
