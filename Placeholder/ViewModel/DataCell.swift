//
//  DataCell.swift
//  Placeholder
//
//  Created by Lucas Clahar on 9/11/20.
//  Copyright © 2020 Tsahai Clahar. All rights reserved.
//

import UIKit

class DataCell: UITableViewCell {

 
    @IBOutlet weak var displayImageViewContainer: UIView!
    @IBOutlet weak var displayImageView: UIImageView!
    @IBOutlet weak var titleTextLabel: UILabel!
    
    
    func setInfo(data: Data){

        titleTextLabel.text = data.title
        
        ImageLoader.getImage(withURL: data.thumbnailUrl!){ image in
            self.displayImageView.image = image
        }
            
        displayImageView.setShadow(cornerRadius: displayImageView.frame.width / 2, shadowColor: .gray, shadowRadius: 5)
        displayImageViewContainer.setShadow(cornerRadius: displayImageViewContainer.frame.width / 2, shadowColor: .darkGray, shadowRadius: 5)

        
    }
}

// UIView extension that adds background shadow to UIViews
extension UIView {
    
    func setShadow(cornerRadius: CGFloat, shadowColor: UIColor, shadowOffset: CGSize = .zero, shadowOpacity: Float = 0.7, shadowRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        layer.shadowRadius = shadowRadius
    }
}
