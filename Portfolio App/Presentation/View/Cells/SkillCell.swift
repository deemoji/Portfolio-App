//
//  SkillCell.swift
//  Portfolio App
//
//  Created by Дмитрий Мартьянов on 01.08.2023.
//

import UIKit

final class SkillCell: UICollectionViewCell {
    
    static let identifier: String = "SkillCell"
    
    var completion: (() -> ())?
    
    let skillLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let removeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let symbol = UIImage(systemName: "multiply")
        let blackSymbol = symbol?.withTintColor(.black, renderingMode: .alwaysOriginal)
        button.setImage(blackSymbol, for: .normal)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        removeButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    @objc func buttonAction(sender: UIButton!) {
        completion?()
    }
    private func setupViews() {
        self.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1.0)
        let hStackView = UIStackView(arrangedSubviews: [skillLabel, removeButton])
        hStackView.axis = .horizontal
        hStackView.alignment = .fill
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        hStackView.distribution = .fill
        hStackView.spacing = 2.0
        contentView.addSubview(hStackView)
        NSLayoutConstraint.activate([
            hStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15.0),
            hStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -15.0),
            hStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15.0),
            hStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 15.0)
        ])
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 12.0
        self.layer.masksToBounds = true
    }
}
