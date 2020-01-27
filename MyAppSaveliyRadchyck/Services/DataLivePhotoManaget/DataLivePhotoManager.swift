//
//  DataLivePhotoManager.swift
//  MyAppSaveliyRadchyck
//
//  Created by Saveliy Radchyck on 1/25/20.
//  Copyright © 2020 Saveliy Radchyck. All rights reserved.
//

import Foundation
import LPLivePhotoGenerator

class DataLivePhotoManager {
    
    static func getLivePhotos(completion: @escaping(LivePhotosResponse) -> ()) {
        let photoLivePathFactory = LivePhotosPathFactory()
        let arrayLivephoto = LivePhotosResponse(userData: photoLivePathFactory.imageVideoPaths) 
        completion(arrayLivephoto)
    }
    
    static func saveLivePhoto(_ livePhoto: LPLivePhoto) {
        livePhoto.writeToPhotoLibrary(completion: {(livePhoto: LPLivePhoto, error: Error?) in
            DispatchQueue.main.sync {
                if let error = error {
                    print(error)
                    ShowAllert.showWith(title: "Error", message: "\(error)")
                } else {
                    ShowAllert.showWith(title: "Good", message: "Live photo saved library")
                }
            }
        })
    }
}
