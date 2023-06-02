//
//  Onboarding.swift
//  littlelemon
//
//  Created by Muhammad Adil Mehmood on 01/05/2023.
//

import SwiftUI

let uniqueFirstNameUD : String = "firstNameUD"
let uniqueLastNameUD : String = "lastNameUD"
let uniqueEmailAddressUD : String = "emailAddressUD"

let kIsLoggedIn = "kIsLoggedIn"

let backgroundColor : String = "F1F6F9"
let strongTextColor : String = "9BA4B5"
let lightTextColor : String = "F1F6F9"
let primaryColor : String = "212A3E"

struct Onboarding: View {
    @State private var firstName : String = ""
    @State private var lastName : String = ""
    @State private var emailAddress : String = ""
    @State private var showError : Bool = false
    @State private var isLoggedIn : Bool = false
    
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                
                TextField("First name", text: $firstName)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .border(showError && firstName.isEmpty ? Color.red : Color.white)
                    .background(Color.white)
                    .foregroundColor(Color(hex: primaryColor))
                    .accentColor(Color(hex: strongTextColor))
                Spacer()
                    .frame(maxHeight: 15.0)
                TextField("Last name", text: $lastName)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .border(showError && lastName.isEmpty ? Color.red : Color.white)
                    .background(Color.white)
                Spacer()
                    .frame(maxHeight: 15.0)
                TextField("Email Address", text: $emailAddress)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .border(showError && emailAddress.isEmpty ? Color.red : Color.white)
                    .background(Color.white)
                Spacer()
                    .frame(maxHeight: 30.0)
                
                Button("Register")
                {
                    if(firstName.isEmpty){
                        showError = true
                    }
                    else if(lastName.isEmpty) {
                        showError = true
                    }
                    else if(emailAddress.isEmpty){
                        showError = true
                    }
                    else {
                        UserDefaults.standard.set(firstName, forKey: uniqueFirstNameUD)
                        UserDefaults.standard.set(lastName, forKey: uniqueLastNameUD)
                        UserDefaults.standard.set(emailAddress, forKey: uniqueEmailAddressUD)
                        
                        isLoggedIn = true
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(15.0)
                .background(Color(hex: primaryColor))
                .foregroundColor(Color(hex: backgroundColor))
                
                
                
            }
            .frame(maxHeight: .infinity)
            .padding(20)
            .background(Color(hex: backgroundColor))
            
            .onAppear {
                if(UserDefaults.standard.bool(forKey: kIsLoggedIn)) {
                    isLoggedIn = true
                }
            }
            
        }
        
        
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0

        scanner.scanHexInt64(&rgbValue)

        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}
