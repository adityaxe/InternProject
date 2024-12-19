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
    func fetchData(offset: Int, limit: Int) -> [[String]] {
        let db = try! DuckDBDatabase()
        let query = "SELECT * FROM accidents LIMIT \(limit) OFFSET \(offset);"
        let result = try! db.query(query)
        
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
    let searchBar = UISearchBar()
    searchBar.delegate = self
    navigationItem.titleView = searchBar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            data = fetchData()
        } else {
            data = data.filter { row in
                row.contains(where: { $0.lowercased().contains(searchText.lowercased()) })
            }
        }
        tableView.reloadData()
    }
}

#Preview {
    ContentView()
}
