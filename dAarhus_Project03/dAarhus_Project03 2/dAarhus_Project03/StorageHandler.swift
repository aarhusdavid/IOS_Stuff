//
//  StorageHandler.swift
//  dAarhus_Project03
//
//  Created by David Aarhus on 10/20/20.
//  Copyright © 2020 David Aarhus. All rights reserved.
//

import Foundation

struct StorageHandler
{
    static var defaultStorage: UserDefaults = UserDefaults.standard
    
    static func getStorage(key: String) -> [[Int]]
    {
        var colorArrays: [[Int]]
        
        if isSet(key: key)
        {
            colorArrays = UserDefaults.standard.dictionaryRepresentation()[key] as! [[Int]]
        }
        else
        {
           colorArrays = [[]]
        }
        
        return colorArrays
    }
    
    static func isSet(key: String) -> Bool
    {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    static func set(value: [Int])
    {
        var colorArrays: [[Int]]
        
        if isSet(key: "myColors")
        {
            colorArrays = UserDefaults.standard.dictionaryRepresentation()["myColors"] as! [[Int]]
            colorArrays.append(value)
        }
        else
        {
           colorArrays = [value]
        }
        
        defaultStorage.set(colorArrays, forKey: "myColors")
    }
    

    
    static func storageCount() -> Int
    {
        if isSet(key: "myColors")
        {
            let colorArrays: [[Int]] = UserDefaults.standard.dictionaryRepresentation()["myColors"] as! [[Int]]
            return colorArrays.count
        }
        else
        {
            return 0
        }
    }
}


