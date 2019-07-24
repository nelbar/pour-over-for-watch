//
//  HostingController.swift
//  baseWatch1 WatchKit Extension
//
//  Created by Linus T Dogg on 7/17/19.
//  Copyright © 2019 Linus T Dogg. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

class HostingController : WKHostingController<ContentView> {
    override var body: ContentView {
        //return ContentView(referenceDate: Date().addingTimeInterval(11.0))
        return ContentView(currStep: CurrStep())
    }
}
