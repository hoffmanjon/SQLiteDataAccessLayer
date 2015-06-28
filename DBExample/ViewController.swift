//
//  ViewController.swift
//  DBExample
//
//  Created by Jon Hoffman on 6/4/15.
//  Copyright (c) 2015 Jon Hoffman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var dataStore = SQLiteDataStore.sharedInstance
        dataStore.createTables()
        setupDB()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupDB() {
        let bosId = TeamDataHelper.insert(Team(teamId: 0, city: "Boston", nickName: "Red Sox", abbreviation: "BOS"))
        let baltId = TeamDataHelper.insert(Team(teamId: 0, city: "Baltimore", nickName: "Orioles", abbreviation: "BAL"))
        let tampId = TeamDataHelper.insert(Team(teamId: 0, city: "Tampa Bay", nickName: "Rays", abbreviation: "TB"))
        let torId = TeamDataHelper.insert(Team(teamId: 0, city: "Toronto", nickName: "Blue Jays", abbreviation: "TOR"))
        
        if let teams = TeamDataHelper.findAll() {
            for team in teams {
                println("\(team.city!) \(team.nickName!)")
            }
        }
        
        let ortizId = PlayerDataHelper.insert(Player(playerId: 0, firstName: "David", lastName: "Ortiz", number: 34, teamId: bosId, position: Positions.DesignatedHitter))
        let napId = PlayerDataHelper.insert(Player(playerId: 0, firstName: "Mike", lastName: "Napoli", number: 12, teamId: bosId, position: Positions.FirstBase))
        let pedId = PlayerDataHelper.insert(Player(playerId: 0, firstName: "Dustin", lastName: "Pedroia", number: 15, teamId: bosId, position: Positions.SecondBase))
        
        if let players = PlayerDataHelper.findAll() {
            for player in players {
                println("\(player.firstName!) \(player.lastName!)")
            }
        }
        
    }
    
    
}

