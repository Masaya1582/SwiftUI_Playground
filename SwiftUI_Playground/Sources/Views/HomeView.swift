//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var expenses: [Expense] = []
    @State private var expenseName = ""
    @State private var expenseAmount = ""

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(expenses) { expense in
                        Text("\(expense.name): $\(expense.amount, specifier: "%.2f")")
                    }
                    .onDelete(perform: deleteExpense)
                }

                HStack {
                    TextField("Expense name", text: $expenseName)
                    TextField("Amount", text: $expenseAmount)
                        .keyboardType(.decimalPad)
                    Button(action: addExpense) {
                        Text("Add Expense")
                    }
                }
                .padding()
            }
            .navigationBarTitle("Expense Tracker")
        }
    }

    private func addExpense() {
        guard let amount = Double(expenseAmount), !expenseName.isEmpty else {
            return
        }
        let newExpense = Expense(name: expenseName, amount: amount)
        expenses.append(newExpense)
        expenseName = ""
        expenseAmount = ""
    }

    private func deleteExpense(at offsets: IndexSet) {
        expenses.remove(atOffsets: offsets)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
