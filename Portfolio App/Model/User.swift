//
//  User.swift
//  Portfolio App
//
//  Created by Дмитрий Мартьянов on 01.08.2023.
//

import Foundation

struct User {
    
    let name: String
    
    let proffession: String
    
    let location: String
    
    let imageName: String
    
    var skills: [String]
}
extension User {
    init() {
        self.name = "Иванов Иван Иванович"
        self.proffession = "Middle iOS-разработчик, опыт более 2-х лет"
        self.location = "Воронеж"
        self.imageName = "profile-image"
        self.skills = ["MVI/MVVM", "Kotlin Coroutines", "Room", "OkHttp", "DataStore", "WorkManager", "custom view", "DataStore", "ООП и SOLID"]
    }
}
