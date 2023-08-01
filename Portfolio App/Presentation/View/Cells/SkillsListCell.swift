//
//  SkillsListCell.swift
//  Portfolio App
//
//  Created by Дмитрий Мартьянов on 01.08.2023.
//

import UIKit

class SkillsListCell: UITableViewCell {
    
    static let identifier: String = "SkillsListCell"
    
    var listIsEditing: Bool = false {
        didSet{
            collectionView.reloadData()
        }
    }
    var deleteTrigger: ((Int) -> ())?
    var addElementTrigger: (() -> ())?
    var collectionView: AutoSizedCollectionView!
    
    var list: [String]? {
        didSet {
            collectionView.reloadData()
            collectionView.layoutIfNeeded()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCollectionView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureCollectionView()
    }
    
    func configureCollectionView() {
        collectionView = AutoSizedCollectionView(frame: .zero, collectionViewLayout: configureCollectionViewLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
        collectionView.register(SkillCell.self, forCellWithReuseIdentifier: SkillCell.identifier)
        collectionView.dataSource = self
    }
    
    private func configureCollectionViewLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(100),
                                              heightDimension: .absolute(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: itemSize.heightDimension), subitems: [NSCollectionLayoutItem(layoutSize: itemSize)])
        group.interItemSpacing = .fixed(10.0)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)
        section.interGroupSpacing = 10.0
        return UICollectionViewCompositionalLayout(section: section)
    }
}

extension SkillsListCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let list = list else {
            return 0
        }
        return listIsEditing ? list.count + 1 : list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let list = list else {
            return UICollectionViewCell()
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SkillCell.identifier, for: indexPath) as! SkillCell
        if listIsEditing && indexPath.item == list.count {
            cell.skillLabel.text = " + "
            cell.removeButton.isHidden = true
            cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addButtonTapped)))
        } else {
            cell.completion = { [weak self] in
                self?.deleteTrigger?(indexPath.item)
            }
            cell.removeButton.isHidden = !listIsEditing
            cell.skillLabel.text = list[indexPath.item]
        }
        return cell
    }
    @objc func addButtonTapped(sender: UIButton!) {
        addElementTrigger?()
    }
}
