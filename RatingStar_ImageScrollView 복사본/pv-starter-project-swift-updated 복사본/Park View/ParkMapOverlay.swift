//
//  ParkMapOverlay.swift
//  Park View
//
//  Created by kpugame on 2016. 5. 3..
//  Copyright © 2016년 Chris Wagner. All rights reserved.
//

import Foundation

import UIKit
import MapKit

class ParkMapOverlay: NSObject, MKOverlay  {
    var coordinate: CLLocationCoordinate2D
    var boundingMapRect: MKMapRect
    
    init(park: Park){
        boundingMapRect = park.overlayBoundingMapRect
        coordinate = park.midCoordinate
    }
    
    
}