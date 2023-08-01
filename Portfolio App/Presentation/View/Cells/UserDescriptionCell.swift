//
//  UserDescriptionCell.swift
//  Portfolio App
//
//  Created by Дмитрий Мартьянов on 01.08.2023.
//

import UIKit

final class UserDescriptionCell: UITableViewCell {

    static let identifier: String = "UserDescriptionCell"
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    private func setupViews() {
        contentView.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15.0),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15.0)
        ])
    }
}
