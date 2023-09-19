//
//  SignInView.swift
//  Vollmed
//
//  Created by Giovanna Moeller on 18/09/23.
//

import SwiftUI

struct SignInView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    
    var authManager = AuthenticationManager.shared
    
    let service = WebService()
    
    func login() async {
        do {
            if let response = try await service.loginPatient(email: email, password: password) {
                authManager.saveToken(token: response.token)
                authManager.savePatientID(id: response.id)
            } else {
                showAlert = true
            }
        } catch {
            showAlert = true
            print("Ocorreu um erro no login: \(error)")
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Image(.logo)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 36.0, alignment: .center)
            
            Text("Olá!")
                .font(.title2)
                .bold()
                .foregroundStyle(.accent)
            
            Text("Preencha para acessar sua conta.")
                .font(.title3)
                .foregroundStyle(.gray)
                .padding(.bottom)
            
            Text("Email")
                .font(.title3)
                .bold()
                .foregroundStyle(.accent)
            
            TextField("Insira seu email", text: $email)
                .padding(14)
                .background(Color.gray.opacity(0.25))
                .cornerRadius(14.0)
                .autocorrectionDisabled()
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
            
            Text("Senha")
                .font(.title3)
                .bold()
                .foregroundStyle(.accent)
            
            SecureField("Insira sua senha", text: $password)
                .padding(14)
                .background(Color.gray.opacity(0.25))
                .cornerRadius(14.0)
            
            Button(action: {
                Task {
                    await login()
                }
            }, label: {
                ButtonView(text: "Entrar")
            })
            
            NavigationLink {
                SignUpView()
            } label: {
                Text("Ainda não possui uma conta? Cadastre-se.")
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .padding()
        .navigationBarBackButtonHidden()
        .alert("Ops, algo deu errado!", isPresented: $showAlert) {
            Button(action: {}, label: {
                Text("Ok")
            })
        } message: {
            Text("Houve um erro ao entrar na sua conta. Por favor tente novamente.")
        }
    }
}

#Preview {
    SignInView()
}
