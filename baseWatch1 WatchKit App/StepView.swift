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

class CurrStep: BindableObject {
    var count = 0 {
        didSet {
                self.willChange.send()
            }
    }
    
    var willChange = PassthroughSubject<Void, Never>()
    
}

struct StepView: View {
    @Binding var recipe: Recipe
    @ObjectBinding var currStep: CurrStep
    
    var body: some View {
            VStack {
                Text(recipe.steps[currStep.count].desc)
                Text( String(recipe.steps[currStep.count].duration) )
                doubleToString(number: recipe.steps[currStep.count].water)
            }
        }
          
    func doubleToString(number: Double) -> Text {
        let new = (number * 10).rounded() / 10
        
        let newString = String(format: "%.1f", new)
        
        return Text(newString)
    }

}

