//
//  RepoCollectionViewCell.swift
//  GitHub App
//
//  Created by Vlad Gordiichuk on 23.06.2020.
//  Copyright © 2020 Vlad Gordiichuk. All rights reserved.
//

import UIKit
import SDWebImage

final class RepoCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "RepoCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpElements()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    internal var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.sd_imageTransition = .fade
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    internal var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setUpElements() {
        
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.gray.cgColor
        
        contentView.addSubview(imageView)
        
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    public func fill(with repo: Repository) {
        
        titleLabel.text = repo.title
        imageView.sd_setImage(with: repo.avatar, placeholderImage: UIImage(named: "no-image"), context: nil)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.sd_cancelCurrentImageLoad()
    }
}

