//
//  PortfolioPresenter.swift
//  Portfolio App
//
//  Created by Дмитрий Мартьянов on 01.08.2023.
//

import Foundation

class PortfolioPresenter {
    
    private var user = User()
    weak private var view: PortfolioView?
    
    func attachView(_ view: PortfolioView) {
        self.view = view
    }
    func getUser() {
        view?.setUser(user)
    }
    func addUserSkill(_ skill: String) {
        user.skills.append(skill)
        view?.setUser(user)
    }
    
    func removeUserSkill(at index: Int) {
        user.skills.remove(at: index)
        view?.setUser(user)
    }
}
