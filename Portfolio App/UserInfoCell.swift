//
//  UserInfoCell.swift
//  Portfolio App
//
//  Created by Дмитрий Мартьянов on 01.08.2023.
//

import UIKit

final class UserInfoCell: UITableViewCell {
    
    static let identifier: String = "UserInfoCell"
    
    let userImageView: CircleImageView = {
        let imageView = CircleImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    let professionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtextColor: UIColor = UIColor.black.withAlphaComponent(0.6)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        self.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1.0)
        professionLabel.textColor = subtextColor
        locationLabel.textColor  = subtextColor
        
        let supplimentaryStackView = UIStackView(arrangedSubviews: [
             professionLabel, locationLabel
        ])
        supplimentaryStackView.axis = .vertical
        supplimentaryStackView.alignment = .center
        let primaryStackView = UIStackView(arrangedSubviews: [
            userImageView, nameLabel, supplimentaryStackView
        ])
        primaryStackView.axis = .vertical
        primaryStackView.alignment = .center
        primaryStackView.translatesAutoresizingMaskIntoConstraints = false
        primaryStackView.distribution = .equalSpacing
        primaryStackView.spacing = 5.0
        contentView.addSubview(primaryStackView)
        NSLayoutConstraint.activate([
            primaryStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            primaryStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            primaryStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            primaryStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.widthAnchor.constraint(equalTo: primaryStackView.widthAnchor, multiplier: 0.5),
            userImageView.widthAnchor.constraint(equalTo: nameLabel.widthAnchor, multiplier: 0.6),
            userImageView.heightAnchor.constraint(equalTo: userImageView.widthAnchor)
        ])
    }

}
