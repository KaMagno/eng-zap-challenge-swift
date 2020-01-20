//
//  PropertyCellCollectionViewCell.swift
//  ZAP
//
//  Created by kaique.magno.santos on 16/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import UIKit
import Kingfisher

class PropertyCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var outletImageView: UIImageView!
    @IBOutlet weak var outletTitle: UILabel!
    @IBOutlet weak var outletPrice: UILabel!
    @IBOutlet weak var outleBedRooms: UILabel!
    @IBOutlet weak var outletBathRooms: UILabel!
    @IBOutlet weak var outletUsableAreas: UILabel!
    @IBOutlet weak var outletParkingSpaces: UILabel!

    func setup(imageURL: URL?,
               title: BusinessType,
               price: String,
               bedRooms: Int,
               bathRooms: Int,
               usableAreas: Int,
               parkingAreas: Int?) {

        if let imageURL = imageURL {
            outletImageView.kf.setImage(with: imageURL)
        }else{
            outletImageView.image = Asset.photoPlaceholder.image
        }

        outletTitle.text = Formatter.title(title)
        outletPrice.text = Formatter.price(price)
        outleBedRooms.text = Formatter.bedRooms(bedRooms)
        outletBathRooms.text = Formatter.bathRooms(bathRooms)
        outletUsableAreas.text = Formatter.usableAreas(usableAreas)
        if let parkingAreas = parkingAreas {
            outletParkingSpaces.text = Formatter.parkingAreas(parkingAreas)
        }
    }

    override func prepareForReuse() {
        outletImageView.image = Asset.photoPlaceholder.image
        outletTitle.text = nil
        outletPrice.text = nil
        outleBedRooms.text = nil
        outletBathRooms.text = nil
        outletUsableAreas.text = nil
        outletParkingSpaces.text = nil
    }
}
