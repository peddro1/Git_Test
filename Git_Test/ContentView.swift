//
//  ContentView.swift
//  Git_Test
//
//  Created by Pedro Victor Furtado Sousa on 11/06/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var altura: String = ""
    @State var peso: String = ""
    @State var resultNum : Text = Text("")
    @State var resultText : Text = Text("")
    
    var body: some View {
        VStack {
            
            Image(systemName: "figure.american.football")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("IMC")
            .scenePadding(.bottom)
            
            TextField( "Altura (m)",
                       text: $altura)
            .multilineTextAlignment(.center)
            TextField( "Peso (kg)",
                       text: $peso)
            .multilineTextAlignment(.center)
            
            Button(action: {
                let result: Float = calculaIMC(altura: (altura as NSString).floatValue, peso: (peso as NSString).floatValue)
                resultNum = Text(" \(result)")
                resultText = Text(IMCClassification(imc: result))
            }, label: {
                Text("Calcular")
            }).padding()
            
            resultNum
            resultText
        }
        .padding()
    }
    
    func calculaIMC (altura: Float, peso: Float) -> Float{
        return peso/(altura * altura)
    }
    
    func IMCClassification(imc: Float) -> String{
        switch imc {
        case 0.0...18.5:
            return "Magreza"
        case 18.5...24.9:
            return "Normal"
        case 25.0...29.9:
            return "Sobrepeso"
        case 30.0...39.9:
            return "Obesidade"
        case 40.0...59:
            return "Obesidade Grave"
        default:
            return "Nao foi possivel calcular o imc"
        }
    }
}

#Preview {
    ContentView()
}
