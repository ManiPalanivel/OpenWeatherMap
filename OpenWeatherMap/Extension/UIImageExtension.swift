////  OpenWeatherMap
//
//  Created by Mani on 19/09/19
//  Copyright © 2019 Mani. All rights reserved.
//

import UIKit

extension UIImage{
    static func scaleImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        image.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: newSize.width, height: newSize.height)))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
}

extension UIImageView{
    func setImage(from url : String){
        let urlString = Constant.urlScheme.appending("://").appending(Constant.baseURL).appending(Constant.imageDownloadPath).appending(url).appending(".png")
        let imageDownloadManager : ImageDownloadManager = ImageDownloadManager()
        imageDownloadManager.getData(urlString: urlString) {
            data in
                let image = UIImage(data: data)
                DispatchQueue.main.async() {
                    self.image = image
                }
        }
    }
}
