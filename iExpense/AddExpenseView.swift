//
//  AddExpenseView.swift
//  iExpense
//
//  Created by Nicholas Verrico on 9/30/21.
//

import SwiftUI

struct AddExpenseView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    static let types = ["Business", "Personal"]
    
    
    var body: some View {
        NavigationView{
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self){
                        Text($0)
                    }
                }
                TextField("amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add New Expense")
            .navigationBarItems(trailing: Button("Save"){
                if let actualAmount = Int(self.amount){
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}
