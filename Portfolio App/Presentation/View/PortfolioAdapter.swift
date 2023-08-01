//
//  PortfolioAdapter.swift
//  Portfolio App
//
//  Created by Дмитрий Мартьянов on 01.08.2023.
//

import Foundation
import UIKit

protocol PortfolioAdapterDelegate: AnyObject {
    func itemToDeleteSelected(at index: Int)
    func reloadData()
    func addButtonTapped()
}

final class PortfolioAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var user: User?
    
    weak var delegate: PortfolioAdapterDelegate?
    
    var skillListIsEditing: Bool = false
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoCell.identifier, for: indexPath) as! UserInfoCell
            cell.userImageView.image = UIImage(named: user?.imageName ?? "")
            cell.nameLabel.text = user?.name
            cell.professionLabel.text = user?.proffession
            cell.locationLabel.text(with: UIImage(named: "geoposition"), user?.location ?? "")
            
            return cell
        }
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: SkillsListCell.identifier, for: indexPath) as! SkillsListCell
            cell.list = user?.skills
            cell.listIsEditing = skillListIsEditing
            cell.deleteTrigger = { [weak self] index in
                self?.delegate?.itemToDeleteSelected(at: index)
            }
            cell.addElementTrigger = {[weak self] in
                self?.delegate?.addButtonTapped()
            }
            return cell
        }
        if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: UserDescriptionCell.identifier, for: indexPath) as! UserDescriptionCell
            cell.descriptionLabel.text = "Experienced software engineer skilled in developing scalable and maintainable systems"
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 { return nil }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderSectionCell.identifier) as! HeaderSectionCell
        cell.backgroundColor = .white
        if section == 1 {
            cell.title.text = "Мои навыки"
            let button = UIButton()
            button.setImage(skillListIsEditing ? UIImage(named: "accept") : UIImage(named: "edit"), for: .normal)
            button.addTarget(self, action: #selector(editButtonPressed), for: .touchUpInside)
            cell.actionButton = button
        }
        if section == 2 {
            cell.title.text = "О себе"
        }
        return cell
    }
    @objc func editButtonPressed(sender: UIButton!) {
        skillListIsEditing = !skillListIsEditing
        delegate?.reloadData()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 { return 0 }
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
