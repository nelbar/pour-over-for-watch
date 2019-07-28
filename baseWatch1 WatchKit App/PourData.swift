//
//  PourData.swift
//  baseWatch1 WatchKit Extension
//
//  Created by V Nelson Barnes on 7/20/19.
//  Copyright © 2019 Linus T Dogg. All rights reserved.
//

import Foundation
import Combine

struct Step {
    var desc: String
    var duration: Int
    var water: Double
}


struct Recipe {
    let name: String
    var coffeeWeight: Double
    var steps: [Step]
}

func BuildRecipe(name: String, coffeeWeight: Double) -> Recipe {
    let duration = Int(180.0 * coffeeWeight / 21.0)
    let qsteps = duration / 30
    
    let waterIncrement = coffeeWeight * 15.5 / Double(qsteps)
    
    var currWaterTotal = waterIncrement
    
    var step = Step(desc: "Blume", duration: 30, water: currWaterTotal)
    var steps = [step]
    
    for _ in 1...qsteps-2 {
        currWaterTotal += waterIncrement
        step = Step(desc: "Pour", duration: 6, water: currWaterTotal)
        steps.append(step)
    }
    
    currWaterTotal = coffeeWeight * 15.5
    step = Step(desc: "Pour", duration: 3, water: currWaterTotal)
    steps.append(step)
    
    
    
    let recipe = Recipe(name: name, coffeeWeight: coffeeWeight, steps: steps)
    
    return recipe
}
