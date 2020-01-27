//
//  LivePhotosViewController.swift
//  MyAppSaveliyRadchyck
//
//  Created by Saveliy Radchyck on 1/22/20.
//  Copyright © 2020 Saveliy Radchyck. All rights reserved.
//

import UIKit
import PhotosUI

class LivePhotosViewController: UIViewController {
    
    // MARK: Property
    
    var livePhotosPresenter: LivePhotosPresenterProtocol?
    
    // MARK: PropertyView
    
    var contentView: LivePhotosViewProtocol {
        return (view as? LivePhotosView).require()
    }
    
    // MARK: liveCycle View Controler
    
    override func loadView() {
        view = LivePhotosView(sizeForIndex: {
            if let livePhotos = self.livePhotosPresenter?.livePhotos {
                return livePhotos.count > 0 ?  livePhotos[$0].phLivePhoto.size : CGSize(width: 1, height: 1)
            }
            return CGSize(width: 1, height: 1)
        })
        livePhotosPresenter = LivePhotosPresenter(collectionView: contentView.livePhotosCollectionView)
        livePhotosPresenter?.loadLivePhotos()
        contentView.saveLivePhotoButton.addTarget(self, action: #selector(touchButtonSaveLivePhoto), for: .touchDown)
    }
}

// MARK: Selectors

extension LivePhotosViewController {
    
    @objc func touchButtonSaveLivePhoto() {
        livePhotosPresenter?.saveLivePhotoInLibrary()
    }
}





