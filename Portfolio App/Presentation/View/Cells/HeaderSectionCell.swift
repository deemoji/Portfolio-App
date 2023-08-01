//
//  HeaderSectionView.swift
//  Portfolio App
//
//  Created by Дмитрий Мартьянов on 01.08.2023.
//

import UIKit

final class HeaderSectionCell: UITableViewCell {
    
    static let identifier: String = "HeaderSectionCell"
    
    let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var actionButton: UIButton? {
        didSet {
            if let actionButton = actionButton {
                contentView.addSubview(actionButton)
                actionButton.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    actionButton.centerYAnchor.constraint(equalTo: title.centerYAnchor),
                    actionButton.heightAnchor.constraint(equalTo: title.heightAnchor),
                    actionButton.widthAnchor.constraint(equalTo: actionButton.heightAnchor),
                    actionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15.0)
                ])
            }
            
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    private func setupViews() {
        contentView.addSubview(title)
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15.0),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0)
        ])
    }
}
