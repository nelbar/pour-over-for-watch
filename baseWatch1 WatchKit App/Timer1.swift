//
//  Timer1.swift
//  baseWatch1 WatchKit Extension
//
//  Created by V Nelson Barnes on 7/21/19.
//  Copyright © 2019 Linus T Dogg. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct CurrentDateView : View {
    
    @Binding var recipe: Recipe
    @ObjectBinding var currStep: CurrStep
    @ObjectBinding var timerData: TimerData
    
    
    let calendar = Calendar(identifier: .gregorian)
    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()

    var body: some View {
        
        VStack {
            if (timerData.refNow > timerData.now) && currStep.showTimer {
                countDownString(beg: timerData.now, end: timerData.refNow).onReceive(timer) {_ in self.timerData.now = Date() }
            }
            else {
                if currStep.showTimer {
                    Text("DONE" )
                        .onAppear(perform: {
                            self.endStep()
                            
                        })
                }
            }
        }
    }
    
    
    
    func countDownString(beg: Date, end: Date) -> Text {
        if end > beg {
            let components = calendar.dateComponents([.day, .hour, .minute, .second],
                from: beg,
                to: end)
            let viewData = String(format: "%02d:%02d",
                  components.minute ?? 00,
                  components.second ?? 00)
            
            return Text(viewData)
                .fontWeight(.bold)
                
        
        }
        
        return Text("")
    }
    
    func endStep() {
        
        WKInterfaceDevice.current().play(.stop)
        if self.currStep.count < recipe.steps.count - 1 {
            self.currStep.count += 1
            self.timerData.now = Date()
            self.timerData.refNow = Date().addingTimeInterval(TimeInterval(recipe.steps[currStep.count].duration))
        }
            
        
    }
}


