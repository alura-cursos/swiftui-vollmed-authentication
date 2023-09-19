//
//  AuthenticationManager.swift
//  Vollmed
//
//  Created by Giovanna Moeller on 18/09/23.
//

import Foundation

class AuthenticationManager {
    var token: String?
    var patientID: String?
    
    init() {
        self.token = KeychainHelper.get(for: "app-vollmed-token")
        self.patientID = KeychainHelper.get(for: "app-vollmed-patient-id")
    }
    
    func saveToken(token: String) {
        KeychainHelper.save(value: token, key: "app-vollmed-token")
        self.token = token
    }
    
    func removeToken() {
        KeychainHelper.remove(for: "app-vollmed-token")
        self.token = nil
    }
    
    func savePatientID(id: String) {
        KeychainHelper.save(value: id, key: "app-vollmed-patient-id")
        self.patientID = id
    }
    
    func removePatientID() {
        KeychainHelper.remove(for: "app-vollmed-patient-id")
        self.patientID = nil
    }
}
