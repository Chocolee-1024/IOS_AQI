//
//  UserPreferences.swift
//  CallAPIExample
//
//  Created by imac-1763 on 2023/2/6.
//

import Foundation

class UserPreferences: NSObject{
    
    static let shared = UserPreferences()
    
    enum Keys: String{
        case lastSearchNum
        
        case lasetSelectAQI
        
        case lasetSelcetStatus
        
        case lastSelectCounty
    }
    
    var lastSearchNum: String {
        get{return UserDefaults.standard.string(forKey: Keys.lastSearchNum.rawValue) ?? "" }
        set{UserDefaults.standard.set(newValue, forKey: Keys.lastSearchNum.rawValue) }
    }
    
    var lasetSelectAQI: String {
        get{return UserDefaults.standard.string(forKey: Keys.lasetSelectAQI.rawValue) ?? "" }
        set{UserDefaults.standard.set(newValue, forKey: Keys.lasetSelectAQI.rawValue) }
    }
    
    var lasetSelcetStatus: String {
        get{return UserDefaults.standard.string(forKey: Keys.lasetSelcetStatus.rawValue) ?? "" }
        set{UserDefaults.standard.set(newValue, forKey: Keys.lasetSelcetStatus.rawValue) }
    }
    
    var lastSelectCounty: String {
        get{return UserDefaults.standard.string(forKey: Keys.lastSelectCounty.rawValue) ?? "" }
        set{UserDefaults.standard.set(newValue, forKey: Keys.lastSelectCounty.rawValue) }
    }
}
