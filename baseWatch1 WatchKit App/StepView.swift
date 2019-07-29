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
    var showTimer = false {
        didSet {
            self.willChange.send()
        }
        
    }
    var count = 0 {
        didSet {
            self.willChange.send()
        }
    }
    
    var willChange = PassthroughSubject<Void, Never>()
    
}


class TimerData: BindableObject {
    
    var willChange = PassthroughSubject<Void, Never>()
    
    var now = Date() {
        didSet {
                self.willChange.send()
            }
        }
    var refNow = Date().addingTimeInterval(30.0) {
        didSet {
                self.willChange.send()
            }
    }
    
    
   
    
}

 
struct StepView: View {
    @Binding var recipe: Recipe
    @ObjectBinding var timerData: TimerData
    @ObjectBinding var currStep: CurrStep
    
    var startTime: Date {
            return Date()
        }
        
    var endTime: Date {
        return Date().addingTimeInterval(TimeInterval(recipe.steps[currStep.count].duration))
    }
       
    
    var body: some View {
        
        VStack {

            doubleToString(number: recipe.steps[currStep.count].water)
            HStack {
                Text(recipe.steps[currStep.count].desc)
                CurrentDateView(recipe: $recipe, currStep: currStep, startTime: startTime, endTime: endTime)
            }
        }
    }
          
    func doubleToString(number: Double) -> Text {
        let new = (number * 10).rounded() / 10
        
        let newString = String(format: "%.0f", new)
        
        return Text("Pour to ~" + newString + "g Water")
    }

}

