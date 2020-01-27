//
//  LivePhotosPresenter.swift
//  MyAppSaveliyRadchyck
//
//  Created by Saveliy Radchyck on 1/22/20.
//  Copyright © 2020 Saveliy Radchyck. All rights reserved.
//

import UIKit
import Require
import LPLivePhotoGenerator

protocol LivePhotosPresenterProtocol: UICollectionViewDataSource, UIImagePickerControllerDelegate {
    init(collectionView: UICollectionView)
    func loadLivePhotos()
    func saveLivePhotoInLibrary()
    var livePhotos: [LPLivePhoto]  { get }
    var indexLivePhoto: Int? { get set }
}

class LivePhotosPresenter: NSObject, LivePhotosPresenterProtocol {
    
    // MARK: property
    
    var livePhotos = [LPLivePhoto]()
    let collectionView: UICollectionView
    var indexLivePhoto: Int?
    
    // MARK: Init
    
    required init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        collectionView.dataSource = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.cellId)
    }
    
    // MARK: Methods
    
    func loadLivePhotos()  {
        DataLivePhotoManager.getLivePhotos { [weak self] (livePhotoResponse) in
            self?.livePhotos = livePhotoResponse.livePhotos
            self?.collectionView.reloadData()
        }
    }
    
    internal func saveLivePhotoInLibrary() {
        guard let index = indexLivePhoto else { return }
        DataLivePhotoManager.saveLivePhoto(livePhotos[index])
    }
}

// MARK: UICollectionViewDataSource

extension LivePhotosPresenter {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return livePhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PhotosCollectionViewCell.cellId,
            for: indexPath) as? PhotosCollectionViewCellProtocol else {
                return UICollectionViewCell()
        }

        cell.livePhotoView.livePhoto = livePhotos[indexPath.row].phLivePhoto
        indexLivePhoto = indexPath.row
        return cell
    }
}
