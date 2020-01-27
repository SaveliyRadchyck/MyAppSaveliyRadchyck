//
//  LivePhotoResponse.swift
//  MyAppSaveliyRadchyck
//
//  Created by Saveliy Radchyck on 1/25/20.
//  Copyright © 2020 Saveliy Radchyck. All rights reserved.
//

import LPLivePhotoGenerator

class LivePhotosResponse {
    
    var livePhotos: [LPLivePhoto] = []
    
    init(userData: [String: String]) {
        
        for obj in userData {
            let videosPath = obj.value
            let imagePath = obj.key
            
            LPLivePhotoGenerator.create(inputImagePath: imagePath, inputVideoPath: videosPath) { [weak self] (livePhoto: LPLivePhoto?, error: Error?) in
                if let livePhoto = livePhoto {
                    self?.livePhotos.append(livePhoto)
                    return
                }
                if let error = error {
                    print(error)
                }
            }
        }
    }
}
