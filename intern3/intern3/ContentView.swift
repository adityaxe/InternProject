//
//  ContentView.swift
//  intern3
//
//  Created by Atulya Bidani on 19/12/24.
//

import SwiftUI
import DuckDB

struct ContentView: View {
    
    @State private var data: [[String]] = []

    var body: some View {
        VStack {
            List(data, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { column in
                        Text(column)
                            .padding(.trailing, 8)
                    }
                }
            }
            .onAppear {
                data = fetchData()
            }
        }
    }
}


func fetchData() -> [[String]] {
    let db = try! DuckDBDatabase()
    let result = try! db.query("SELECT * FROM accidents")
    
    var data: [[String]] = []
    for row in result {
        var rowData: [String] = []
        for column in row {
            rowData.append("\(column)")  
        }
        data.append(rowData)
    }
    return data
}

#Preview {
    ContentView()
}
