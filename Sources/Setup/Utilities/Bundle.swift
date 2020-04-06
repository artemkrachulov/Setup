//
//  Bundle.swift
//  Utilities
//
//  Created by Artem on 24.12.2019.
//  Copyright © 2019 Artem Krachulov. All rights reserved.
//

import Foundation

public extension Bundle {
    
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    
    var isReleaseVersionNumberChanged: Bool {
        
        let isChanged = UserDefaults.standard.releaseVersionNumber != Bundle.main.releaseVersionNumber
        
        if isChanged {
            UserDefaults.standard.releaseVersionNumber = Bundle.main.releaseVersionNumber
        }
        
        return isChanged
    }
    
    var isBuildVersionNumberChanged: Bool {
        
        let isChanged = UserDefaults.standard.buildVersionNumber != Bundle.main.buildVersionNumber
        
        if isChanged {
            UserDefaults.standard.buildVersionNumber = Bundle.main.buildVersionNumber
        }
        
        return isChanged
    }
}

extension UserDefaults {
    
    var releaseVersionNumber: String? {
        get { return string(forKey: #function) }
        set { set(newValue, forKey: #function) }
    }
    
    var buildVersionNumber: String? {
        get { return string(forKey: #function) }
        set { set(newValue, forKey: #function) }
    }
}
