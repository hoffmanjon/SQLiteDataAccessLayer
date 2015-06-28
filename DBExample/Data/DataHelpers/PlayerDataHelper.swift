//
//  PlayerDataHelper.swift
//  DBExample
//
//  Created by Jon Hoffman on 6/4/15.
//  Copyright (c) 2015 Jon Hoffman. All rights reserved.
//

import Foundation

import SQLite

class PlayerDataHelper: DataHelperProtocol {
    static let TABLE_NAME  = "Players"
    
    static let playerId = Expression<Int64>("playerid")
    static let firstName = Expression<String>("firstName")
    static let lastName = Expression<String>("lastName")
    static let number = Expression<Int>("number")
    static let teamId = Expression<Int64>("teamid")
    static let position = Expression<String>("position")

    
    static let table = SQLiteDataStore.sharedInstance.BBDB[TABLE_NAME ]
    
    typealias T = Player
    
    static func createTable() {
        let results = SQLiteDataStore.sharedInstance.BBDB.create(table: table, ifNotExists: true) { t in
            t.column(playerId, primaryKey: true)
            t.column(firstName)
            t.column(lastName)
            t.column(number)
            t.column(teamId)
            t.column(position)
        
        }
    }
    
    static func insert(item: T) -> Int64 {
        if (item.firstName != nil && item.lastName != nil && item.teamId != nil && item.position != nil) {
            if let results = table.insert(firstName <- item.firstName!, number <- item.number!, lastName <- item.lastName!, teamId <- item.teamId!, position <- item.position!.rawValue).rowid {
                return results
            }
        }
        
        return -1
    }
    
    static func delete (item: T) -> Void {
        if let id = item.playerId {
            let query = table.filter(playerId == id)
            query.delete()
        }
    }
    
    static func find(id: Int64) -> T? {
        let query = table.filter(playerId == id)
        var results: T?
        if let item = query.first {
            results = Player(playerId: item[playerId], firstName: item[firstName], lastName: item[lastName], number: item[number], teamId: item[teamId], position: Positions(rawValue: item[position]))
        }
        return results
    }
    
    static func findAll() -> [T]? {
        var retArray = [T]()
        for item in table {
            retArray.append(Player(playerId: item[playerId], firstName: item[firstName], lastName: item[lastName], number: item[number], teamId: item[teamId], position: Positions(rawValue: item[position])))
        }
        return retArray
    }
}
