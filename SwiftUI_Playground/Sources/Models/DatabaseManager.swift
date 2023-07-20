//
//  DatabaseManager.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SQLite

class DatabaseManager {
    static let shared = DatabaseManager()
    private let connection: Connection?

    private let items = Table("items")
    private let id = Expression<Int64>("id")
    private let itemName = Expression<String>("itemName")

    private init() {
        do {
            guard let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else { fatalError("path not found") }
            connection = try Connection("\(path)/db.sqlite3")
            createTable()
        } catch {
            connection = nil
            print("Unable to open database: \(error)")
        }
    }

    private func createTable() {
        do {
            try connection?.run(items.create { table in
                table.column(id, primaryKey: .autoincrement)
                table.column(itemName)
            })
        } catch {
            print("Unable to create table: \(error)")
        }
    }

    func addItem(name: String) {
        let insert = items.insert(itemName <- name)
        do {
            try connection?.run(insert)
        } catch {
            print("Insert failed: \(error)")
        }
    }

    func getAllItems() -> [String] {
        var result: [String] = []
        do {
            for item in try connection!.prepare(items) {
                result.append(item[itemName])
            }
        } catch {
            print("Select failed: \(error)")
        }
        return result
    }

    func deleteItem(name: String) {
        let item = items.filter(itemName == name)
        do {
            try connection?.run(item.delete())
        } catch {
            print("Delete failed: \(error)")
        }
    }
}
