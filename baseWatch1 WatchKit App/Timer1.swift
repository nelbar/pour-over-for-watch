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
    @Binding var now: Date
    @Binding var refNow: Date
    @ObjectBinding var currStep: CurrStep
    
    let calendar = Calendar(identifier: .gregorian)
    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()

    var body: some View {
        VStack {
            if refNow > now {
                countDownString(beg: now, end: refNow).onReceive(timer) {_ in self.now = Date() }
            }
            else {
                Text("DONE" )
                    .onAppear(perform: {
                        self.endStep()
                        //WKInterfaceDevice.current().play(.stop)
                    })
                //.onReceive(CurrStep) {count in self.currStep.count = count }
                //.onReceive(currStep) {_ in self.currStep.count += 1 }
                //.onReceive(timer) {_ in self.currStep.count = 1 }
            
            }
        }
    }
    
    func endStep() {
        WKInterfaceDevice.current().play(.stop)
        self.currStep.count += 1
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
                
        
        }
        
        return Text("")
    }
    
    
}
