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
    @ObjectBinding var currStep: CurrStep
    
    var body: some View {
        
        VStack {
        
            StepView(recipe: $recipe, now: $now, refNow: $refNow, currStep: currStep)
        }
        
    }
    
    
}


#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        //ContentView(referenceDate: Date().addingTimeInterval(11.0))
        ContentView(currStep: CurrStep())
    }
}
#endif
