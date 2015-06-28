//
//  DataHelperProtocol.swift
//  DBExample
//
//  Created by Jon Hoffman on 6/4/15.
//  Copyright (c) 2015 Jon Hoffman. All rights reserved.
//

import Foundation

protocol DataHelperProtocol {
    typealias T
    static func createTable() -> Void
    static func insert(item: T) -> Int64
    static func delete(item: T) -> Void
    static func findAll() -> [T]?
}