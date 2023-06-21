//
//  ContentView.swift
//  GameSliderApp
//
//  Created by Zaki on 21.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 0...100)
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 25) {
            
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            
            // Place to slider
            
            Button("Проверь меня!") {
                showAlert = true
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Your score"), message: Text("12"))
            }
            
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
            }
            
        }
        .padding()
    }
  
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(12)) //currentValue
        return 100 - difference
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


