//
//  Extensions.swift
//  NetflixClone
//
//  Created by LAP15516 on 26/06/2022.
//

import Foundation

extension String {
    
    func capitalizaFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
}
