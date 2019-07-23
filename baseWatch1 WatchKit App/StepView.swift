//
//  StepView.swift
//  baseWatch1 WatchKit Extension
//
//  Created by V Nelson Barnes on 7/22/19.
//  Copyright © 2019 Linus T Dogg. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

struct StepView: View {
    @Binding var recipe: Recipe
    @Binding var currStep: Int
    
    var body: some View {
            VStack {
                Text(recipe.steps[currStep].desc)
                Text( String(recipe.steps[currStep].duration) )
                doubleToString(number: recipe.steps[currStep].water)
            }
        }
          
    func doubleToString(number: Double) -> Text {
        let new = (number * 10).rounded() / 10
        
        let newString = String(format: "%.1f", new)
        
        return Text(newString)
    }

}

