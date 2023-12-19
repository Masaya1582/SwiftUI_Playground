//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct SQLCheatSheetItem: Identifiable {
    let id = UUID()
    let command: String
    let explanation: String
}

struct HomeView: View {
    @State private var showAlert = false
    @State private var alertMessage = ""
    private let sqlCheatSheet: [SQLCheatSheetItem] = [
        SQLCheatSheetItem(command: "SELECT column1, column2 FROM table_name;", explanation: "Retrieve specific columns (column1, column2) from the table."),
        SQLCheatSheetItem(command: "DELETE FROM table_name WHERE condition;", explanation: "Remove rows from the table based on a specified condition."),
        SQLCheatSheetItem(command: "INSERT INTO table_name (column1, column2) VALUES (value1, value2);", explanation: "Add a new row with specified values into the table."),
        SQLCheatSheetItem(command: "ALTER TABLE table_name ADD column_name datatype;", explanation: "Add a new column to an existing table."),
        SQLCheatSheetItem(command: "DROP TABLE table_name;", explanation: "Delete an entire table from the database."),
        SQLCheatSheetItem(command: "CREATE INDEX index_name ON table_name (column_name);", explanation: "Create an index on a specific column in a table."),
        SQLCheatSheetItem(command: "JOIN table1 ON table1.column = table2.column;", explanation: "Merge rows from two or more tables based on a related column."),
        SQLCheatSheetItem(command: "GROUP BY column_name;", explanation: "Group rows with the same values in a specified column."),
        SQLCheatSheetItem(command: "HAVING aggregate_function(column_name) condition;", explanation: "Filter group rows based on specified conditions."),
        SQLCheatSheetItem(command: "COUNT(column_name);", explanation: "Count the number of rows that match a specific condition.")
    ]

    var body: some View {
        NavigationView {
            List(sqlCheatSheet) { item in
                VStack(alignment: .leading) {
                    Text(item.command)
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text(item.explanation)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    UIPasteboard.general.string = item.command
                    alertMessage = "Copied: \(item.command)"
                    showAlert = true
                }
            }
            .navigationTitle("SQL Cheatsheet")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Copied"), message: Text(alertMessage))
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
