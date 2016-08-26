//
//  GeneralClass.swift
//  Page1ProductB1
//
//  Created by admin on 8/11/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import Foundation

// MARK: Delay
//  delay(time) {
//      to do!!
//  }

func delay(delay:Double, closure:()->()) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), closure)
}

// MARK: DummyImage
// dummyImage("300x300") -> NSURL
func dummyImage(sizeDummy: String) -> String {
    let dummyImageURL = "https://placehold.it/"+sizeDummy
    
    return dummyImageURL
}