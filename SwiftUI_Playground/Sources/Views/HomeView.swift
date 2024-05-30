//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("SQL Cheatsheet")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)

                Group {
                    Text("1. SELECT")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("""
                    ```
                    SELECT column1, column2, ...
                    FROM table_name;
                    ```
                    """)
                    .font(.system(.body, design: .monospaced))
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                }

                Group {
                    Text("2. WHERE")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("""
                    ```
                    SELECT column1, column2, ...
                    FROM table_name
                    WHERE condition;
                    ```
                    """)
                    .font(.system(.body, design: .monospaced))
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                }

                Group {
                    Text("3. INSERT INTO")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("""
                    ```
                    INSERT INTO table_name (column1, column2, ...)
                    VALUES (value1, value2, ...);
                    ```
                    """)
                    .font(.system(.body, design: .monospaced))
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                }

                Group {
                    Text("4. UPDATE")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("""
                    ```
                    UPDATE table_name
                    SET column1 = value1, column2 = value2, ...
                    WHERE condition;
                    ```
                    """)
                    .font(.system(.body, design: .monospaced))
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                }

                Group {
                    Text("5. DELETE")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("""
                    ```
                    DELETE FROM table_name
                    WHERE condition;
                    ```
                    """)
                    .font(.system(.body, design: .monospaced))
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                }
            }
            .padding()
        }
        .navigationTitle("SQL Cheatsheet")
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
