//
//  AppDetailScreenshotsViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Владислав Лихачев on 19.08.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class AppDetailScreenshotsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

     // MARK: - Properties
      
      private let app: ITunesApp
      
    private let imageDownloader = ImageDownloader()
    
      private var appDetailScreenshotsView: AppDetailScreenshotsView {
          return self.view as! AppDetailScreenshotsView
      }
      
      // MARK: - Init
      
      init(app: ITunesApp) {
          self.app = app
          super.init(nibName: nil, bundle: nil)
      }
      
      required init?(coder aDecoder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
      
      // MARK: - Lifecycle
      
      override func loadView() {
          self.view = AppDetailScreenshotsView()
      }
      
      override func viewDidLoad() {
          super.viewDidLoad()
          self.fillData()
      }
      
      // MARK: - Private
      
      private func fillData() {
          self.appDetailScreenshotsView.titleLabel.text = "Скриншоты"
        self.appDetailScreenshotsView.screenshotsCollectionView.delegate = self
        self.appDetailScreenshotsView.screenshotsCollectionView.dataSource = self
      }
      
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        app.screenshotUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let screenshotCell = (collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)) as! ScreenshotViewCell

        self.imageDownloader.getImage(fromUrl: app.screenshotUrls[indexPath.row]) { (image, _) in
            screenshotCell.imageView?.image = image
        }
        
        return screenshotCell
    }

}

extension AppDetailScreenshotsViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: collectionView.frame.height)
    }
    
}
