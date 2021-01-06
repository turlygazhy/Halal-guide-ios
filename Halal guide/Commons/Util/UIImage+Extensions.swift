//
//  UIImage+Extensions.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import UIKit
import CoreImage

extension UIImage {
    
    /// Get resized image by keeping its aspect ratio
    ///
    /// - Parameter size: maximum size
    /// - Returns: resized image
    func fitted(in size: CGSize) -> UIImage? {
        let newSize: CGSize
        let aspectRatio = self.size.width / self.size.height
        
        if aspectRatio < 1 {
            let width = size.height * aspectRatio
            if width > size.width {
                let newHeight = size.width / aspectRatio
                newSize = CGSize(width: size.width, height: newHeight)
            } else {
                newSize = CGSize(width: width, height: size.height)
            }
        } else {
            let height = size.width / aspectRatio
            if height > size.height {
                let newWidth = size.height * aspectRatio
                newSize = CGSize(width: newWidth, height: size.height)
            } else {
                newSize = CGSize(width: size.width, height: height)
            }
        }
        
        return resized(to: newSize)
    }
    
    /// Get resized image
    ///
    /// - Parameter size: new image size
    /// - Returns: resized UIImage object
    func resized(to size: CGSize) -> UIImage? {
        let rect = CGRect(origin: .zero, size: size)
        let renderingMode = self.renderingMode
        // Perform image resizing
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        draw(in: rect)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return result?.withRenderingMode(renderingMode)
    }

    // MARK: - UIImage+Resize
    func compressTo(_ expectedSizeInMb: Int) -> Data? {
        let sizeInBytes = expectedSizeInMb * 1024 * 1024
        var needCompress: Bool = true
        var imgData: Data?
        var compressingValue: CGFloat = 1.0
        while needCompress && compressingValue > 0.0 {
            if let data: Data = jpegData(compressionQuality: compressingValue) {
                if data.count < sizeInBytes {
                    needCompress = false
                    imgData = data
                } else {
                    compressingValue -= 0.1
                }
            }
        }
        if let data = imgData {
            if data.count < sizeInBytes {
                return data
            }
        }
        return nil
    }
}
