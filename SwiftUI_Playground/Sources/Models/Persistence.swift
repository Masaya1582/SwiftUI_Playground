//
//  Persistence.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import CoreData

// Core Data stackの作成、管理を行う.
struct PersistenceController {
    // アプリ全体で使えるShared Instance.
    static let shared = PersistenceController()

    // プレビュー、テスト用
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext

        // サンプルを10個 in-memoryストアに保存.
        for _ in 0..<10 {
            let newItem = Task(context: viewContext)
            newItem.name = "Sample Task"
        }

        do {
            // 変更を保存.
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }

        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        // コンテナの作成
        container = NSPersistentContainer(name: "CoreDataSample")

        if inMemory {
            if let firstStoreDescription = container.persistentStoreDescriptions.first {
                firstStoreDescription.url = URL(fileURLWithPath: "/dev/null")
            } else {
                fatalError("Unable to access persistent store description")
            }
        }

        // ロード
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}
