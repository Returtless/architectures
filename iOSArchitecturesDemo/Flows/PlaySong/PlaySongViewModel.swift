//
//  PlaySongViewModel.swift
//  iOSArchitecturesDemo
//
//  Created by Владислав Лихачев on 24.08.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

class PlaySongViewModel: PlaySongViewModelInput, PlaySongViewModelOutput{
    
    var progress: Double {
        didSet {
            onProgressChanged?(progress)
        }
    }
    
    var timer: Timer?
    
     var onProgressChanged: ((Double) -> Void)?
    
    init(progress: Double, onProgressChange: ((Double) -> Void)?) {
        self.progress = progress
        self.onProgressChanged = onProgressChange
        onProgressChange?(progress)
    }
    
    func play() {
         timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] (timer) in
                   guard let self = self else { return }
                   let newProgress = self.progress + 0.05
                   if self.progress == 1 {
                       timer.invalidate()
                   }
                   self.progress = min(newProgress, 1)
               }
    }
    
    func pause() {
        timer?.invalidate()
    }
    
    func stop() {
        timer?.invalidate()
        progress = 0
    }
    
   
    
    
}


protocol PlaySongViewModelInput {
    func play()
    func pause()
    func stop()
}

protocol PlaySongViewModelOutput {
    var onProgressChanged: ((Double) -> Void)? { get set }
}
