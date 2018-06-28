//
//  UIImageViewExtensions.swift
//  YYSwift
//
//  Created by Phoenix on 2018/1/8.
//  Copyright © 2018年 Phoenix. All rights reserved.
//

import UIKit

// MARK: - Methods
public extension UIImageView {
    
    /// YYSwift: Set image from a URL.
    ///
    /// - Parameters:
    ///   - url: URL of image.
    ///   - contentMode: imageView content mode (default is .scaleAspectFit).
    ///   - placeHolder: optional placeholder image
    ///   - completionHandler: optional completion handler to run when download finishs (default is nil).
    public func download(from url: URL,
                         contentMode: UIView.ContentMode = .scaleAspectFit,
                         placehoder: UIImage? = nil,
                         completionHandler: ((UIImage?) -> Void)? = nil) {
        image = placehoder
        self.contentMode = contentMode
        URLSession.shared.dataTask(with: url) { (data, response, _) in
            guard
                let httpURLResponse = response as? HTTPURLResponse,
                    httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType,
                    mimeType.hasPrefix("image"),
                let data = data,
                let image = UIImage(data: data) else {
                    completionHandler?(nil)
                    return
            }
            DispatchQueue.main.async {
                self.image = image
                completionHandler?(image)
            }
        }.resume()
    }
    
    /// YYSwift: Make image view blurry
    ///
    /// - Parameter style: UIBlurEffectStyle (default is .light).
    public func blur(withStyle style: UIBlurEffect.Style = .light) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight] // for supporting device rotation
        addSubview(blurEffectView)
        clipsToBounds = true
    }
    
    /// YYSwift: Blurred version of an image view
    ///
    /// - Parameter style: UIBlurEffectStyle (default is .light).
    /// - Returns: blurred version of self.
    public func blurred(withStyle style: UIBlurEffect.Style = .light) -> UIImageView {
        let imgView = self
        imgView.blur(withStyle: style)
        return imgView
    }
}
