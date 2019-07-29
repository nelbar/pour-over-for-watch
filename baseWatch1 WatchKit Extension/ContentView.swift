//
//  ContentView.swift
//  baseWatch1 WatchKit Extension
//
//  Created by Linus T Dogg on 7/17/19.
//  Copyright © 2019 Linus T Dogg. All rights reserved.
//

import SwiftUI
import Combine



struct ContentView : View {
    
    @State private var recipe = BuildRecipe(name: "pour over 1", coffeeWeight: 26.6)
    //@Binding var recipe: Recipe
    @ObjectBinding var currStep: CurrStep
    @ObjectBinding var timerData: TimerData
    
    var timerPrefix: String {
        if currStep.showTimer {
            return "Stop"
            
        }
        else {
            return "Start"
        }
    }
    
    var body: some View {
        
        VStack {
            
            HStack {
                Text(recipe.name)
                    .font(.headline)
                    .foregroundColor(Color.yellow)
                    
                Spacer()
            }
            
            Divider()
            
           
           if currStep.showTimer {
                ZStack {
                    StepView(recipe: $recipe, timerData: timerData, currStep: currStep)
                                   .padding()
                                   .background(Color.blue )
                                   .cornerRadius(6)
               }
           } else {
               ///*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                Text("Coffee: " + String(recipe.coffeeWeight) + "g" )
                               .font(.footnote)
                Text("Water: " + String(recipe.coffeeWeight * 15.5 ) + "g" )
                   .font(.footnote)
               
                Divider()
           }
            
            Toggle(isOn: $currStep.showTimer) {
                //self.startTimer()
                Text(timerPrefix + " Brewing")
                
           }
           
        }
        
    }
    
    func startTimer() -> Text {
        currStep.count = 0
        timerData.now = Date()
        timerData.refNow = Date().addingTimeInterval(TimeInterval(recipe.steps[currStep.count].duration))
        
        return Text(timerPrefix + " Brewing")
    }
    
}


#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        //ContentView(referenceDate: Date().addingTimeInterval(11.0))
        //ContentView(currStep: CurrStep(), timerData: TimerData())
        ContentView(currStep: CurrStep(), timerData: TimerData() )
    }
}
#endif
