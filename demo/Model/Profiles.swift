//
//  Profiles.swift
//  demo
//
//  Created by abnernat on 8/20/21.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "abnernat")
    
    enum Season: String, CaseIterable, Identifiable {
        case strping = "🌹"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String { self.rawValue }
    }
}
