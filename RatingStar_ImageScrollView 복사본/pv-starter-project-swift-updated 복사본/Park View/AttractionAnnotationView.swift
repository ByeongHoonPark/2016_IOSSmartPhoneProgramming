//
//  AttractionAnnotationView.swift
//  Park View
//
//  Created by kpugame on 2016. 5. 10..
//  Copyright © 2016년 Chris Wagner. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class AttractionAnnotationView: MKAnnotationView {
    // Required for MKAnnotationView
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    // Called when drawing the AttractionAnnotationView
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        let attractionAnnotation = self.annotation as! AttractionAnnotation
        switch (attractionAnnotation.type) {
        case .AttractionFirstAid:
            image = UIImage(named: "firstaid")
        case .AttractionFood:
            image = UIImage(named: "food")
        case .AttractionRide:
            image = UIImage(named: "ride")
        default:
            image = UIImage(named: "star")
        }
    }
}