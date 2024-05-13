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
