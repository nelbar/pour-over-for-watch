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
    @State private var recipe = BuildRecipe(name: "pour over 1", coffeeWeight: 26.6)
    @State private var currStep: Int = 0
    
    var body: some View {
        
    VStack {
            //Text(getRecipe())
        CurrentDateView(now: $now, refNow: $refNow, currStep: $currStep)
            
            StepView(recipe: $recipe, currStep: $currStep)
        }
        
    }
    
    func getRecipe() -> String {
        //let recipe = BuildRecipe(name: "pour over 1", coffeeWeight: 26.6)
        let name = recipe.name
        let coffee = recipe.coffeeWeight
        let output = name + ": " + "\(coffee)"
        
        return output
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
