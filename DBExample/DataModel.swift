//
//  DataModel.swift
//  DBExample
//
//  Created by Jon Hoffman on 6/28/15.
//  Copyright (c) 2015 Jon Hoffman. All rights reserved.
//

import Foundation

typealias Team = (teamId: Int64?, city: String?, nickName: String?, abbreviation: String?)
typealias Player = (playerId: Int64?, firstName: String?, lastName: String?, number: Int?, teamId: Int64?, position: Positions?)

