//
//  AppDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 20.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppDetailViewController: UIViewController {
    
    var app: ITunesApp
    
    lazy var headerViewController = AppDetailHeaderViewController(app: self.app)
    lazy var appDetailVersionViewController = AppDetailVersionViewController(app: self.app)
    lazy var appDetailScreenshotsViewController = AppDetailScreenshotsViewController(app: self.app)
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    
    private func configureUI() {
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationItem.largeTitleDisplayMode = .never
        self.addHeaderViewController()
        self.addDescriptionViewController()
        self.addScreenshotsViewController()
    }
    
    private func addHeaderViewController() {
        self.addChild(self.headerViewController)
        self.view.addSubview(self.headerViewController.view)
        self.headerViewController.didMove(toParent: self)
        
        self.headerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.headerViewController.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.headerViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.headerViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
    
    private func addDescriptionViewController() {
        
        self.addChild(appDetailVersionViewController)
        self.view.addSubview(appDetailVersionViewController.view)
        appDetailVersionViewController.didMove(toParent: self)
        
        appDetailVersionViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            appDetailVersionViewController.view.topAnchor.constraint(equalTo: self.headerViewController.view.bottomAnchor),
            appDetailVersionViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            appDetailVersionViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            appDetailVersionViewController.view.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func addScreenshotsViewController() {
        
        self.addChild(appDetailScreenshotsViewController)
        self.view.addSubview(appDetailScreenshotsViewController.view)
        appDetailScreenshotsViewController.didMove(toParent: self)
        
        appDetailScreenshotsViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            appDetailScreenshotsViewController.view.topAnchor.constraint(equalTo: self.appDetailVersionViewController.view.bottomAnchor),
            appDetailScreenshotsViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            appDetailScreenshotsViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            appDetailScreenshotsViewController.view.heightAnchor.constraint(equalToConstant: 250.0)
        ])
    }
}
