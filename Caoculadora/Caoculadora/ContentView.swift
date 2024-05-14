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
    
    @State var porteSelected = Porte.pequeno
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0)
        {
            Text("Qual a idade do seu cão?")
                .font(.header5)
            Text ("Anos")
                .font(.body1)
            TextField(
                "Quantos anos completos tem seu cão?",
                value: $years,
                format: .number
            )
            Text ("Meses")
                .font(.body1)
            TextField(
                "E quantos meses além disso ele tem?",
                value: $months,
                format: .number
            )
            Text("Porte")
                .font(.body1)
            
            // aqui vai o segmented control
            Picker("Portes", selection: $porteSelected)
            {
                ForEach(Porte.allCases, id: \.self) { porte in
                    Text(porte.rawValue.capitalized)
                }
            }
            .pickerStyle(.segmented)
            
            Divider()
            
            Spacer()
            
            if let result {
                Text("Seu cachorro tem, em idade humana...")
                    .font(.body1)
                Text("\(result) anos")
                    .font(.body1)
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
                .font(.body1)
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
        
        result = porteSelected.calcularIdade(deAnos: years, eMeses: months)
    }
}
    
    #Preview {
        ContentView()
    }
    
