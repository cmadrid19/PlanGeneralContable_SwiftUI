//  Data.swift
//  PlanGeneralContable
//  Created by Maxim Macari on 22/1/21.

import Foundation

// MARK: - PGCData
struct PGCData: Codable, Hashable {
    var grupos: [Grupo]
}

// MARK: - Grupo
struct Grupo: Codable, Hashable {
    var codigo, definicion: String
    var subGroups: [SubGroup]
}

// MARK: - SubGroup
struct SubGroup: Codable, Hashable{
    var codigo: String?
    var nombre: String?
    var definicion: String?
    var cuentas: [Cuenta]?
}

// MARK: - Cuenta
struct Cuenta: Codable, Hashable{
    var codigo, nombre, definición, movDebe: String?
    var movHaber: String?
    var ejemplos: Ejemplos?
    
}

// MARK: - Ejemplos
struct Ejemplos: Codable, Hashable {
}
