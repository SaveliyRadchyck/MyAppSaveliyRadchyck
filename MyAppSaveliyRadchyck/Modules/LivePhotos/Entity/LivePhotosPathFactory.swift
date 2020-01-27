//
//  LivePhotosPathFactory.swift
//  MyAppSaveliyRadchyck
//
//  Created by Saveliy Radchyck on 1/25/20.
//  Copyright © 2020 Saveliy Radchyck. All rights reserved.
//

import Foundation


struct LivePhotosPathFactory {
    
    private let image1 = Bundle.main.path(forResource: "1", ofType: "jpeg") ?? ""
    private let video1 = Bundle.main.path(forResource: "1", ofType: "mov") ?? ""
    
    private let image2 = Bundle.main.path(forResource: "2", ofType: "jpeg") ?? ""
    private let video2 = Bundle.main.path(forResource: "2", ofType: "mov") ?? ""
    
    private let image3 = Bundle.main.path(forResource: "3", ofType: "jpeg") ?? ""
    private let video3 = Bundle.main.path(forResource: "3", ofType: "mov") ?? ""

    var imageVideoPaths = [String : String]()
    
    init() {
        self.imageVideoPaths = [image1: video1, image2: video2, image3: video3]
    }
}
