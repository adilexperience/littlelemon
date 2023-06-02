//
//  Menu.swift
//  littlelemon
//
//  Created by Muhammad Adil Mehmood on 01/05/2023.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var dishes: [MenuItem] = []
    
    var body: some View {
        VStack{
        
            Text("Little Lemon")
                .multilineTextAlignment(.center)
        
            
            Text("Sargodha, Punjab, Pakistan")
                .multilineTextAlignment(.center)
            Text("Satisfy your hunger cravings instantly with our food app! Browse our mouth-watering menu and order your favorite fast food with just a few taps.")
                .multilineTextAlignment(.center)
            
            List(self.dishes) { (dish) in
                HStack {
                    Text(dish.title)
                        .foregroundColor(Color.red)
                    
                    AsyncImage(url: URL(string: dish.image)) { image in
                        image.resizable()
                            .frame(width: 120, height: 120)
                    } placeholder: {
                        ProgressView()
                    }
                }
            }
            
            .onAppear(){
                getMenuData() { (menuList) in
                    self.dishes = menuList
                    
                }
            }
            
        }
            .padding(.horizontal, 20)
            .frame(maxHeight: .infinity)
            .background(Color(hex: backgroundColor))
}

    
    func getMenuData(completion:@escaping ([MenuItem]) -> ()) {
    let API_URL : String = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        
        // adding ! in the end because it will never crash, every time this api will respond in success
        let url = URL(string: API_URL)!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                // Process the data
                let decoder = JSONDecoder()
                
                do {
                    let menuList = try decoder.decode(MenuList.self, from: data)
                    // use the menuList object here
                    
                    for menuItem in menuList.menu {
                        // Do something with each menu item
                        print(menuItem.title)
                    }
                    
                    DispatchQueue.main.async {
                        completion(menuList.menu)
                    }
                } catch let error {
                    print("Error decoding JSON: \(error)")
                }
                
            } else {
                    print("Error: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
        
        task.resume()
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
