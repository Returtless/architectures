//
//  AppDetailScreenshotsView.swift
//  iOSArchitecturesDemo
//
//  Created by Владислав Лихачев on 19.08.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class AppDetailScreenshotsView: UIView {
    
    // MARK: - Subviews
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.numberOfLines = 1
        return label
    }()
    
    private(set) lazy var screenshotsCollectionView: UICollectionView = {
        let width = UIScreen.main.bounds.width*0.9
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: width, height: 50)
        
        layout.sectionInset = UIEdgeInsets(top: 20, left: UIScreen.main.bounds.width*0.1 / 2.0, bottom: 10, right: UIScreen.main.bounds.width*0.1 / 2.0)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = UIScreen.main.bounds.width*0.1
        layout.minimumInteritemSpacing = UIScreen.main.bounds.width*0.1 // or any value you want
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 50), collectionViewLayout: layout)
        collectionView.register(ScreenshotViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        return collectionView
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
        self.addSubview(self.screenshotsCollectionView)
        
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12.0),
            self.titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            self.titleLabel.widthAnchor.constraint(equalToConstant: 120.0),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            
            self.screenshotsCollectionView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor),
            self.screenshotsCollectionView.heightAnchor.constraint(equalToConstant: 150),
            self.screenshotsCollectionView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16.0),
            self.screenshotsCollectionView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
}

class ScreenshotViewCell: UICollectionViewCell {
    var imageView: UIImageView?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        imageView = UIImageView(frame: self.bounds)
        contentView.addSubview(imageView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var bounds: CGRect {
        didSet {
            contentView.frame = bounds
        }
    }
}
