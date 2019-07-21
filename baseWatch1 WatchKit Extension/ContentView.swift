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
    
    @State private var now = Date()
    @State private var refNow = Date().addingTimeInterval(5.0)
    
    var body: some View {
        
        VStack {
            Text(getRecipe())
            CurrentDateView(now: $now, refNow: $refNow)
        }
        
    }
    
    func getRecipe() -> String {
        let recipe = BuildRecipe(name: "pour over 1", coffeeWeight: 26.6)
        let name = recipe.name
        let coffee = recipe.coffeeWeight
        let output = name + ": " + "\(coffee)"
        
        return output
    }
    
}

struct StepView: View {
    
    @Binding var currStep: Int
    
    var body: some View {
        VStack {
            Text("\(currStep)")
        }
    }
    
    func getRecipeSteps() -> String {
            let recipe = BuildRecipe(name: "pour over 1", coffeeWeight: 26.6)
            
            let steps = recipe.steps
            let desc = steps[currStep].desc
            let water = steps[currStep].water.rounded()
            
            let row0 = desc + " " + "\(water)" + "\(currStep)"
            
            return row0
        }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        //ContentView(referenceDate: Date().addingTimeInterval(11.0))
        ContentView()
    }
}
#endif
