//
//  TeamDataHelper.swift
//  DBExample
//
//  Created by Jon Hoffman on 6/4/15.
//  Copyright (c) 2015 Jon Hoffman. All rights reserved.
//

import Foundation
import SQLite

class TeamDataHelper: DataHelperProtocol {
    static let TABLE_NAME  = "Teams"
    
    static let teamId = Expression<Int64>("teamid")
    static let city = Expression<String>("city")
    static let nickName = Expression<String>("nickname")
    static let abbreviation = Expression<String>("abbreviation")
    
    static let table = SQLiteDataStore.sharedInstance.BBDB[TABLE_NAME ]
    
    typealias T = Team
    
    static func createTable() {
        let results = SQLiteDataStore.sharedInstance.BBDB.create(table: table, ifNotExists: true) { t in
            t.column(teamId, primaryKey: true)
            t.column(city)
            t.column(nickName)
            t.column(abbreviation)
        }
    }
    
    static func insert(item: T) -> Int64 {
        if (item.city != nil && item.nickName != nil && item.abbreviation != nil) {
            if let results = table.insert(city <- item.city!, nickName <- item.nickName!, abbreviation <- item.abbreviation!).rowid {
                return results
            }
        }
        return -1

    }
    
    static func delete (item: T) -> Void {
        if let id = item.teamId {
            let query = table.filter(teamId == id)
            query.delete()
        }
    }
    
    static func find(id: Int64) -> T? {
        let query = table.filter(teamId == id)
        var results: T?
        if let item = query.first {
            results = Team(teamId: item[teamId], city: item[city], nickName: item[nickName], abbreviation: item[abbreviation])
        }
        return results
    }
    
    static func findAll() -> [T]? {
        var retArray = [T]()
        for item in table {
            retArray.append(Team(teamId: item[teamId], city: item[city], nickName: item[nickName], abbreviation: item[abbreviation]))
        }
        return retArray
    }
}
