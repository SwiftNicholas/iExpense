//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Nicholas Verrico on 9/30/21.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Int
}
