//
//  ListingViewCell.swift
//  learnios
//
//  Created by Guanming Qiao on 3/14/18.
//

import UIKit

class ListingViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 6
        containerView.layer.masksToBounds = true
    }
    var listing: ListingModel? {
        didSet {
            if let listing = listing {
                imageView.image = listing.image
                captionLabel.text = listing.caption
                descriptionView.text = listing.comment
                priceLabel.text =
                    listing.price
            }
        }
    }
    
}
