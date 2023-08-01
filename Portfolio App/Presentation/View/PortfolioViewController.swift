//
//  PortfolioViewController.swift
//  Portfolio App
//
//  Created by Дмитрий Мартьянов on 01.08.2023.
//

import UIKit

final class PortfolioViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.sectionHeaderTopPadding = 0.0
        tableView.backgroundColor = .white
        tableView.register(UserInfoCell.self, forCellReuseIdentifier: UserInfoCell.identifier)
        tableView.register(HeaderSectionCell.self, forCellReuseIdentifier: HeaderSectionCell.identifier)
        tableView.register(SkillsListCell.self, forCellReuseIdentifier: SkillsListCell.identifier)
        tableView.register(UserDescriptionCell.self, forCellReuseIdentifier: UserDescriptionCell.identifier)
        return tableView
    }()
    
    private let adapter = PortfolioAdapter()
    private let presenter = PortfolioPresenter()
    
    private var safeArea: UILayoutGuide!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Профиль"
        self.view.backgroundColor = .systemGray6
        safeArea = view.safeAreaLayoutGuide
        setupViews()
        adapter.delegate = self
        tableView.delegate = adapter
        tableView.dataSource = adapter
        
        presenter.attachView(self)
        presenter.getUser()
    }
    
    private func setupViews() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor)
        ])
    }
}

extension PortfolioViewController: PortfolioView {
    func setUser(_ user: User) {
        self.adapter.user = user
        self.tableView.reloadData()
    }
    
}

extension PortfolioViewController: PortfolioAdapterDelegate {
    func itemToDeleteSelected(at index: Int) {
        presenter.removeUserSkill(at: index)
    }
    func reloadData() {
        tableView.reloadData()
    }
    func addButtonTapped() {
        let alertController = UIAlertController(title: "Добавление навыка", message: "Введите название навыка, которым владеете", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Добавить", style: .default) { [weak self] action in
            guard let textField = alertController.textFields?.first, let skillToAdd = textField.text else { return }
            self?.presenter.addUserSkill(skillToAdd)
            self?.presenter.getUser()
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        alertController.addTextField()
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    
}
