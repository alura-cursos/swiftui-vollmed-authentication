//
//  Patient.swift
//  Vollmed
//
//  Created by Giovanna Moeller on 18/09/23.
//

import Foundation

struct Patient: Identifiable, Codable {
    let id: String?
    let cpf: String
    let name: String
    let email: String
    let password: String
    let phoneNumber: String
    let healthPlan: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case cpf
        case name = "nome"
        case email
        case password = "senha"
        case phoneNumber = "telefone"
        case healthPlan = "planoSaude"
    }
}
