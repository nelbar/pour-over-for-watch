//
//  ContentView.swift
//  baseWatch1 WatchKit Extension
//
//  Created by Linus T Dogg on 7/17/19.
//  Copyright © 2019 Linus T Dogg. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    

    @State var nowDate: Date = Date()
    @State var count: Int = 0
    
    let referenceDate: Date
    let calendar = Calendar(identifier: .gregorian)
    
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            self.nowDate = Date()
        }
    }
    
    
    var body: some View {
    
        VStack {
            Text("Hello World")
            if self.nowDate <= self.referenceDate {
                Text(countDownString(from: referenceDate, until: nowDate))
                    .font(.body)
                    .onAppear(perform: {
                        let _ = self.timer
                        
                    })
            }
            
            else {
                Text("DONE" )
                    .onAppear(perform: {
                        WKInterfaceDevice.current().play(.stop)
                    })
            }
        
        }
        
    }
    func countDownString(from date: Date, until nowDate: Date) -> String {
            let components = calendar.dateComponents([.day, .hour, .minute, .second],
                                                     from: nowDate,
                                                     to: date)
            /*
                WKInterfaceDevice.current().play(.stop)
                case Notification 
                 case DirectionUp 
                 case DirectionDown 
                 case Success 
                 case Failure 
                 case Retry 
                 case Start 
                 case Stop 
                 case Click 
            */
            return String(format: "%02dm:%02ds",
                                      //components.day ?? 00,
                                      //components.hour ?? 00,
                                      components.minute ?? 00,
                                      components.second ?? 00)
        
        }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView(referenceDate: Date().addingTimeInterval(11.0))
    }
}
#endif
