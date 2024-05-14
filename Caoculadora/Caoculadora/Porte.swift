//
//  Porte.swift
//  Caoculadora
//
//  Created by Lívia Trindade on 13/05/24.
//

import Foundation

enum Porte: String, CaseIterable {
    case pequeno = "Pequeno"
    case medio = "Médio"
    case grande = "Grande"
    
    func calcularIdade(deAnos anosCaninos: Int, eMeses mesesCaninos: Int) -> Int {
        let multiplicador: Int
        switch self {
        case .pequeno:
            multiplicador = 6
        case .medio:
            multiplicador = 7
        case .grande:
            multiplicador = 8

        }
        
        // o resultado vai ser os anos * 7 + a fração do ano em meses * 7
        let result = anosCaninos * multiplicador + mesesCaninos * multiplicador / 12
        
        return result
    }

}

/* é possível construir esse enum das seguintes formas:

 enum Porte {
    case pequeno, medio, grande
}

 enum Porte {
 case pequeno
 case medio = "Médio"
 case grande
}
*/
