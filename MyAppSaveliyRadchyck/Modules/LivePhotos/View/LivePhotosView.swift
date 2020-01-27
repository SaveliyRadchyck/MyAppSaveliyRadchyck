//
//  LivePhotosView.swift
//  MyAppSaveliyRadchyck
//
//  Created by Saveliy Radchyck on 1/22/20.
//  Copyright © 2020 Saveliy Radchyck. All rights reserved.
//

import UIKit

protocol LivePhotosViewProtocol: SnapView {
    var saveLivePhotoButton: UIButton { get }
    var livePhotosCollectionView: UICollectionView { get }
    init(sizeForIndex: ((Int) -> CGSize)?)
    init?(coder: NSCoder)
}

class LivePhotosView: UIView, LivePhotosViewProtocol {

    var saveLivePhotoButton: UIButton = {
        let obj = UIButton()
        obj.backgroundColor = .red
        obj.setTitle("Save", for: .normal)
        return obj
    }()
    
    var livePhotosCollectionView: UICollectionView = {
        let previewLayout = LivePhotosCollectionViewLayout()
        let obj = UICollectionView(frame: .zero, collectionViewLayout: previewLayout)
        obj.isPagingEnabled = true
        obj.showsVerticalScrollIndicator = false
        obj.showsHorizontalScrollIndicator = false
        return obj
    }()

    required init(sizeForIndex: ((Int) -> CGSize)?) {
        super.init(frame: .zero)
        setupUI()
        createConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        addSubview(livePhotosCollectionView)
        addSubview(saveLivePhotoButton)
    }

    func createConstraints() {
        
        saveLivePhotoButton.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        livePhotosCollectionView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(saveLivePhotoButton.snp.top)
        }
    }
}
