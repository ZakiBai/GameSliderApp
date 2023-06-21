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
    @State private var sliderValue: Float = 50.0
    
    var body: some View {
        VStack(spacing: 25) {
            
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            
            HStack {
                Text("0")
                UISliderRepresentation(value: $sliderValue)
                Text("100")
            }
            
            Button("Проверь меня!") {
                showAlert = true
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Your score"), message: Text(computeScore().formatted()))
            }
            
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
            }
            
        }
        .padding()
    }
  
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(sliderValue)))
        return 100 - difference
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


