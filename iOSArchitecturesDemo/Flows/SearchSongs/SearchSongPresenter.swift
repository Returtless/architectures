//
//  SearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Владислав Лихачев on 19.08.2020.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class SearchSongPresenter {
    
    weak var viewInput: (UIViewController & SearchSongViewInput)?
    
    let interactor: SearchSongInteractorInput
       let router: SearchSongRouterInput

       init(interactor: SearchSongInteractorInput, router: SearchSongRouterInput) {
           self.interactor = interactor
           self.router = router
       }
    
    private func requestSongs(with query: String) {
        self.interactor.requestSongs(with: query) { [weak self] result in
            guard let self = self else { return }
            self.viewInput?.throbber(show: false)
            result
                .withValue { songs in
                    guard !songs.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResults = songs
            }
            .withError {
                self.viewInput?.showError(error: $0)
            }
        }
    }
}

// MARK: - SearchViewOutput
extension SearchSongPresenter: SearchSongViewOutput {
    
    func viewDidSearch(with query: String) {
        self.viewInput?.throbber(show: true)
        self.requestSongs(with: query)
    }
    
    func viewDidSelectApp(_ song: ITunesSong) {
        self.router.openDetails(for: song)
    }
}

protocol SearchSongViewInput: class {
    
    var searchResults: [ITunesSong] { get set }
    
    func showError(error: Error)
    
    func showNoResults()
    
    func hideNoResults()
    
    func throbber(show: Bool)
}

protocol SearchSongViewOutput: class {
    
    func viewDidSearch(with query: String)
    
    func viewDidSelectApp(_ song: ITunesSong)
}
