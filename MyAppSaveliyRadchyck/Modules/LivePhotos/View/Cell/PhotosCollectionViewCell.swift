//
//  PhotosCollectionViewCell.swift
//  MyAppSaveliyRadchyck
//
//  Created by Saveliy Radchyck on 1/22/20.
//  Copyright © 2020 Saveliy Radchyck. All rights reserved.
//

import UIKit
import SnapKit
import PhotosUI

protocol PhotosCollectionViewCellProtocol: UICollectionViewCell, SnapView {
    var livePhotoView: PHLivePhotoView { get }
    init(frame: CGRect)
    init?(coder: NSCoder)
}

class PhotosCollectionViewCell: UICollectionViewCell, PhotosCollectionViewCellProtocol  {
    
    static let cellId = String(describing: type(of: self))
    
    private(set) var livePhotoView: PHLivePhotoView = {
        let obj = PHLivePhotoView()
        obj.clipsToBounds = true
        obj.contentMode = .scaleAspectFill
        return obj
    }()
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        createConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func setupUI() {
        addSubview(livePhotoView)
    }
    
    internal func createConstraints() {
        livePhotoView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

