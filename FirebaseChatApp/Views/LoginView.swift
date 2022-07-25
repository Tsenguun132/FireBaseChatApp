//
//  LoginView.swift
//  FirebaseChatApp
//
//  Created by Tsenguun on 25/7/22.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject private var userRegistrationViewModel = UserRegistrationModel()
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            Text("Create account")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
                .padding(.bottom, 30)
            
            FormField(fieldName: "Username", fieldValue: $userRegistrationViewModel.username, isSecure: false)
            RequirementText(isStrikeThrough: userRegistrationViewModel.isUsernameLengthValid, text: "A minimum of 5 characters", iconColor: userRegistrationViewModel.isUsernameLengthValid ? .secondary : .purple)
                .padding()
            
            FormField(fieldName: "Password", fieldValue: $userRegistrationViewModel.password, isSecure: true)
            
            VStack {
                RequirementText(isStrikeThrough: userRegistrationViewModel.isPasswordLengthValid, text: "A miminum of 8 Characters", iconName: "lock.open", iconColor: userRegistrationViewModel.isPasswordLengthValid ? .secondary : .purple)
                    .padding(.bottom, 5)
                RequirementText(isStrikeThrough: userRegistrationViewModel.isPasswordCapitalLetter, text: "One uppercase letter", iconName: "lock.open", iconColor: userRegistrationViewModel.isPasswordCapitalLetter ? .secondary : .purple)
            } 
            .padding()
            
            FormField(fieldName: "Confirm Password", fieldValue: $userRegistrationViewModel.passwordConfirm, isSecure: true)
            RequirementText(isStrikeThrough: userRegistrationViewModel.isPasswordConfirmValid, text: "Confirmed password should be identical to password", iconColor: userRegistrationViewModel.isPasswordConfirmValid ? .secondary : .purple)
                .padding()
            
            Button {
                self.signIn()
            } label: {
                Text("Sign Up")
                    .font(.system(.title3, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red: 114/255, green: 14/255, blue: 158/255), Color(red: 238/255, green: 130/255, blue: 238/255)]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
            HStack {
                Text("Already have an account?")
                    .font(.system(.headline, design: .rounded))
                Button {
                    // Sign In action
                } label: {
                    Text("Sign In")
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 238/255, green: 130/255, blue: 238/255))
                }
            }
            .padding()
            Spacer()
        }
        .padding()
        
    }
    
    func signIn() {
        guard !userRegistrationViewModel.username.isEmpty else {
            return
        }
        
        let defaults = UserDefaults.standard
        defaults.set(userRegistrationViewModel.username, forKey: "username")
        
        viewRouter.currentPage = .chatView
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct RequirementText: View {
    
    var isStrikeThrough = false
    var text = ""
    var iconName = "xmark.square"
    var iconColor: Color
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(iconColor)
            Text(text)
                .font(.system(.body, design: .rounded))
                .foregroundColor(.secondary)
                .strikethrough(isStrikeThrough)
            Spacer()
        }
    }
}

struct FormField: View {
    var fieldName = ""
    @Binding var fieldValue: String
    
    var isSecure = false
    
    var body: some View {
        VStack {
            if isSecure {
                SecureField(fieldName, text: $fieldValue)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
            } else {
                TextField(fieldName, text: $fieldValue)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
            }
            
            Divider()
                .frame(height: 2)
                .background(Color(red: 240/255, green: 240/255, blue: 240/255))
                .padding(.horizontal)
        }
    }
}
