//
//  ContentView.swift
//  SliderWithSwiftUIandUIKit
//
//  Created by Кирилл Тараско on 27.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentValue = 10.0
    @State private var targetValue = Int.random(in: 0...100)
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
            HStack {
                Text("0")
                SliderUI(currentValue: $currentValue, color: .red, alpha: computeScore())
            }
            Text("100")
        }
        .padding()
        Button("Проверь меня") {
            showAlert.toggle()
        }
        .alert("Ваш счёт", isPresented: $showAlert, actions: {}) {
            Text(String(computeScore()))
        }
        .padding()
        Button("Начать заново") {
            changeValue()
        }
    }
    
    private func changeValue() {
        let newValue = Int.random(in: 0...100)
        targetValue = newValue
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

