//
//  ContentView.swift
//  intern2
//
//  Created by Atulya Bidani on 19/12/24.
//

import SwiftUI

import DuckDB

func importCSVToDuckDB(\intern\data.csv: String) {
    let db = try! DuckDBDatabase()
    let query = "CREATE TABLE accidents AS SELECT * FROM read_csv_auto('\intern\data.csv');"
    try! db.query(query)
    
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
}

#Preview {
    ContentView()
}
