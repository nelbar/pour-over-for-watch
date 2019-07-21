//
//  PourData.swift
//  baseWatch1 WatchKit Extension
//
//  Created by V Nelson Barnes on 7/20/19.
//  Copyright © 2019 Linus T Dogg. All rights reserved.
//

import Foundation

struct Recipe {
    let name: String
    var coffeeWeight: Double
    var steps: [Step]
}

struct Step {
    var desc: String
    var duration: Double
    var water: Double
}

func BuildRecipe(name: String, coffeeWeight: Double) -> Recipe {
    let duration = 180.0 * coffeeWeight / 21.0
    let qsteps = duration / 30.0
    
    let water = coffeeWeight * 15.5 / qsteps
    
    var step = Step(desc: "Blume", duration: 30.0, water: water)
    var steps = [step]
    
    step = Step(desc: "Pour", duration: 30.0, water: water)
    steps.append(step)
    
    
    let recipe = Recipe(name: name, coffeeWeight: coffeeWeight, steps: steps)
    
    return recipe
}
