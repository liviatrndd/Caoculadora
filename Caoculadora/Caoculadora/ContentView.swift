//
//  ContentView.swift
//  Caoculadora
//
//  Created by Lívia Trindade on 08/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var years: Int?
    @State var months: Int?
    @State var result: Int?
    
    let portes = ["Pequeno", "Médio", "Grande"]
    @State var porteSelecionado = "Pequeno"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) 
            {
            Text("Qual a idade do seu cão?")
            Text ("Anos")
            TextField(
                "Quantos anos completos tem seu cão?",
                value: $years,
                format: .number
            )
            Text ("Meses")
            TextField(
                "E quantos meses além disso ele tem?",
                value: $months,
                format: .number
            )
            Text("Porte")
            
            // aqui vai o segmented control
            Picker("Portes", selection: $porteSelecionado) 
                {
                ForEach(portes, id: \.self) { porte in
                    Text(porte)
                }
            }
                .pickerStyle(.segmented)
            
            Divider()
            
            Spacer()
            
            if let result {
                Text("Seu cachorro tem, em idade humana...")
                Text("\(result) anos")
            } else {
                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .shadow(radius: 5)
            }
            
            Spacer()
        
            
            Button("Cãocular", action: processYears) // puxando a função criada, antes o que estava dentro das chaves, estava no lugar do action
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(.indigo)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .bold()
        }
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
        .padding()
    }
    
    func processYears() {
        print("cãocular")
        
        guard let years, let months else {
            print("Campos não preenchidos")
            return
        }
        
        guard months > 0 || years > 0 else {
            print("Pelo menos um campo deve ser maior que zero")
            return
        }
        
        let multiplicador: Int
        switch porteSelecionado {
        case "Pequeno":
            multiplicador = 6
        case "Médio":
            multiplicador = 7
        case "Grande":
            multiplicador = 8
        default:
            multiplicador = 0
        }
        
        // o resultado vai ser os anos * 7 + a fração do ano em meses * 7
        result = years * multiplicador + months * multiplicador / 12
    }
}

#Preview {
    ContentView()
}

