//
//  UserProfile.swift
//  littlelemon
//
//  Created by Muhammad Adil Mehmood on 01/05/2023.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    
    private let defaultFirstName : String = UserDefaults.standard.string(forKey: uniqueFirstNameUD) ?? ""
    private let defaultLastName : String = UserDefaults.standard.string(forKey: uniqueLastNameUD) ?? ""
    private let defaultEmailAddress : String = UserDefaults.standard.string(forKey: uniqueEmailAddressUD) ?? ""
    
    var body: some View {
        VStack {
            Text("Personal Information")
                .font(.system(size: 25))
                .fontWeight(.bold)
            
            Spacer()
                .frame(maxHeight: 30)
            
            Image("profile-image-placeholder")
            
            Text(defaultFirstName)
            Text(defaultLastName)
            Text(defaultEmailAddress)
            
            Spacer()
                .frame(maxHeight: 30)
            
            Button("Logout") {
                UserDefaults.standard.setValue(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
            .padding(.horizontal, 40)
            .padding(.vertical, 15)
            .background(Color(hex: primaryColor))
            .foregroundColor(Color(hex: lightTextColor))
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: backgroundColor))
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
