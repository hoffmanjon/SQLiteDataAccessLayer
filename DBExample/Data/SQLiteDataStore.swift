//
//  SQLiteDataStore.swift
//  DBExample
//
//  Created by Jon Hoffman on 6/4/15.
//  Copyright (c) 2015 Jon Hoffman. All rights reserved.
//

import Foundation
import SQLite

class SQLiteDataStore {
    static let sharedInstance = SQLiteDataStore()
    let BBDB: Database
    
    private init() {
        
        var path = "BaseballDB.sqlite"
        
        if let dirs : [String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String] {
            let dir = dirs[0]
            path = dir.stringByAppendingPathComponent("BaseballDB.sqlite");
            println(path)
        }
        
        BBDB = Database(path)
    }
    
    func createTables() {
        TeamDataHelper.createTable()
        PlayerDataHelper.createTable()
        
    }
    
}