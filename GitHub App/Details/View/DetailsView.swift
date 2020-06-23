//
//  DetailsView.swift
//  GitHub App
//
//  Created by Vlad Gordiichuk on 23.06.2020.
//  Copyright © 2020 Vlad Gordiichuk. All rights reserved.
//

import UIKit
import SafariServices

extension DetailsViewController {
    
    internal func setUpElements() {
        
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(imageView)
        
        contentView.addSubview(titleLabel)
        
        contentView.addSubview(languageLabel)
        
        contentView.addSubview(descriptionLabel)
        
        contentView.addSubview(dateLabel)
        
        contentView.addSubview(urlButton)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
//            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
//            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
            titleLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: imageView.rightAnchor),
            
            languageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            languageLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            languageLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: languageLabel.bottomAnchor, constant: 15),
            descriptionLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            descriptionLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            dateLabel.leftAnchor.constraint(greaterThanOrEqualTo: descriptionLabel.leftAnchor),
            dateLabel.rightAnchor.constraint(equalTo: descriptionLabel.rightAnchor),
            
            urlButton.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 30),
            urlButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30),
            urlButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30),
            urlButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            urlButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    internal func fillWithData() {
        
        imageView.sd_setImage(with: repo?.avatar, completed: nil)
        titleLabel.text = repo?.title
        languageLabel.text = repo?.language
        descriptionLabel.text = repo?.descr
        dateLabel.text = repo?.updatedAt?.description
        
        if repo?.url != nil {
            urlButton.addTarget(self, action: #selector(proceedToGithub), for: .touchUpInside)
        } else {
            urlButton.isEnabled = false
        }
    }
    
    @objc private func proceedToGithub() {
        
        if let url = repo?.url {
            let viewController = SFSafariViewController(url: url)
            present(viewController, animated: true, completion: nil)
        }
    }
}
