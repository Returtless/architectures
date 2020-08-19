//
//  AppDetailVersionView.swift
//  iOSArchitecturesDemo
//
//  Created by Владислав Лихачев on 18.08.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class AppDetailVersionView: UIView {
    
    // MARK: - Subviews
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.numberOfLines = 1
        return label
    }()
    
    private(set) lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    private(set) lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: CGFloat.greatestFiniteMagnitude))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0;
        label.sizeToFit()
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupLayout()
    }
    
    // MARK: - UI
    
    private func setupLayout() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.versionLabel)
        self.addSubview(self.descriptionLabel)
        
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12.0),
            self.titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            self.titleLabel.widthAnchor.constraint(equalToConstant: 120.0),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            
            self.versionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor),
            self.versionLabel.heightAnchor.constraint(equalToConstant: 30),
            self.versionLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16.0),
            self.versionLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            
            
            self.descriptionLabel.topAnchor.constraint(equalTo: self.versionLabel.bottomAnchor, constant: 6),
            self.descriptionLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16.0),
            self.descriptionLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor)
            ])
    }

}
