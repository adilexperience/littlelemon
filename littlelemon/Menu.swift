//
//  Menu.swift
//  littlelemon
//
//  Created by Muhammad Adil Mehmood on 01/05/2023.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack{
            Text("Little Lemon")
                .multilineTextAlignment(.center)
            Text("Sargodha, Punjab, Pakistan")
                .multilineTextAlignment(.center)
            Text("Satisfy your hunger cravings instantly with our food app! Browse our mouth-watering menu and order your favorite fast food with just a few taps.")
                .multilineTextAlignment(.center)
            
            List{
                
            }
        }
        .padding(.horizontal, 20)
        .frame(maxHeight: .infinity)
        .background(Color(hex: backgroundColor))
        
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
