//
//  SignUpView.swift
//  Vollmed
//
//  Created by Giovanna Moeller on 18/09/23.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var cpf: String = ""
    @State private var phoneNumber: String = ""
    @State private var healthPlan: String
    @State private var password: String = ""
    
    let healthPlans: [String] = [
        "Amil", "Unimed", "Bradesco Saúde", "SulAmérica", "Hapvida", "Notredame Intermédica", "São Francisco Saúde", "Golden Cross", "Medial Saúde", "América Saúde", "Outro"
    ]
    
    init() {
        self.healthPlan = healthPlans[0]
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16.0) {
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 36.0, alignment: .center)
                    .padding(.vertical)
                
                Text("Olá, boas-vindas!")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.accent)
                
                Text("Insira seus dados para criar uma conta.")
                    .font(.title3)
                    .foregroundStyle(.gray)
                    .padding(.bottom)
                
                Text("Nome")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
                
                TextField("Insira seu nome completo", text: $name)
                    .padding(14)
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(14.0)
                    .autocorrectionDisabled()
                
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
                
                Text("CPF")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
                
                TextField("Insira seu CPF", text: $cpf)
                    .padding(14)
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(14.0)
                    .keyboardType(.numberPad)
                
                Text("Telefone")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
                
                TextField("Insira seu telefone", text: $phoneNumber)
                    .padding(14)
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(14.0)
                    .keyboardType(.numberPad)
                
                Text("Senha")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
                
                SecureField("Insira sua senha", text: $password)
                    .padding(14)
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(14.0)
                
                Text("Selecione o seu plano de saúde")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
                
                Picker("Plano de saúde", selection: $healthPlan) {
                    ForEach(healthPlans, id: \.self) { healthPlan in
                        Text(healthPlan)
                    }
                }
                
                Button(action: {
                    //
                }, label: {
                    ButtonView(text: "Cadastrar")
                })
                
                NavigationLink {
                    SignInView()
                } label: {
                    Text("Já possui uma conta? Faça o login!")
                        .bold()
                        .foregroundStyle(.accent)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
        .navigationBarBackButtonHidden()
        .padding()
    }
}

#Preview {
    SignUpView()
}
