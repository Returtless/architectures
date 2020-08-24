//
//  PlaySongViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Владислав Лихачев on 24.08.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class PlaySongViewController: UIViewController {
    private(set) lazy var openButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Играть", for: .normal)
        button.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        button.layer.cornerRadius = 16.0
        return button
    }()
    private(set) lazy var pauseButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Пауза", for: .normal)
        button.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        button.layer.cornerRadius = 16.0
        return button
    }()
    private(set) lazy var stopButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Стоп", for: .normal)
        button.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        button.layer.cornerRadius = 16.0
        return button
    }()
    private(set) lazy var progressBar : UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.setProgress(0, animated: true)
        progressView.trackTintColor = UIColor.lightGray
        progressView.tintColor = UIColor.blue
        return progressView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    
    private func setupLayout() {
        self.view.addSubview(self.progressBar)
        self.view.addSubview(self.openButton)
        self.view.addSubview(self.pauseButton)
        self.view.addSubview(self.stopButton)
        
        NSLayoutConstraint.activate([
            self.progressBar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.progressBar.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.progressBar.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16.0),
            self.progressBar.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 16.0),
            
            self.openButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.openButton.topAnchor.constraint(equalTo: self.progressBar.bottomAnchor, constant: 16.0),
            self.openButton.heightAnchor.constraint(equalToConstant: 30),
            self.openButton.widthAnchor.constraint(equalToConstant: 70),
            
            self.pauseButton.topAnchor.constraint(equalTo: self.progressBar.bottomAnchor, constant: 16.0),
            self.pauseButton.rightAnchor.constraint(equalTo: self.openButton.leftAnchor, constant: 16),
            self.pauseButton.heightAnchor.constraint(equalToConstant: 30),
            self.pauseButton.widthAnchor.constraint(equalToConstant: 70),
            
            self.stopButton.topAnchor.constraint(equalTo: self.progressBar.bottomAnchor, constant: 16.0),
            self.stopButton.leftAnchor.constraint(equalTo: self.openButton.rightAnchor, constant: 16),
            self.stopButton.heightAnchor.constraint(equalToConstant: 30),
            self.stopButton.widthAnchor.constraint(equalToConstant: 70),
        ])
    }
    
}
