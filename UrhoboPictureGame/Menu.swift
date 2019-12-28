//
//  Menu.swift
//  UrhoboPictureGame
//
//  Created by Ufuoma Okoro on 28/12/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import SwiftUI


struct menuItem: View {
    
    //Variables for Menu Selection

    @State var showDictionaryMenu = false
    @State var showDcitionaryListMenu = false
    @State var showPlayGameMenu = false
    
    
    
    
    var body: some View {
       
        
    
        VStack {
            
        
            Spacer()
      
            
            if showDictionaryMenu {

                    VStack {
                        
                        NavigationLink(destination: dictionaryDataInput()) {
                            
                            setMenuItemIcons(icon: "book")
                            .foregroundColor(Color.red)
                            
                        }
                        
                        
                    }
                
                
            }//Add Dictionary End
            
        
            
            
            if showDcitionaryListMenu {
                setMenuItemIcons(icon: "list.bullet.below.rectangle")
                    .foregroundColor(Color.blue)
                
            }//End List Dictionary
        
            
            if showPlayGameMenu {
                
                setMenuItemIcons(icon: "gamecontroller")
                    .foregroundColor(Color.yellow)
                
            }//End play game
            
            
            Button(action: {
                
                self.showMenu()
                
            }) {
                VStack {
                    Text("Click")
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                Image(systemName: "plus.square.fill")
                .resizable()
                    .frame(width:80, height: 80)
                    .foregroundColor(Color.black)
                    .shadow(color: .gray, radius: 0.3, x: 1, y: 1)
                
            
            }
            }
                
            
        }
        
        
    
        
        
        
        
    }
    
    func showMenu() {
        
        withAnimation {
            self.showDictionaryMenu.toggle()
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            
            withAnimation {
                self.showDcitionaryListMenu.toggle()
                
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
            withAnimation {
                self.showPlayGameMenu.toggle()
            }
        }
        
        
    }//End Function
    
    
}


struct menuItem_Previews: PreviewProvider {
    static var previews: some View {
        menuItem()
    }
}








//Menu Item Icons

struct setMenuItemIcons: View {
    
    var icon:   String
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                //.foregroundColor(Color.black)
                .frame(width:   55, height: 55)
            Image(systemName: icon)
                .imageScale(.large)
                .foregroundColor(Color.white)
        
       }//Zstack End
            .shadow(color: .gray, radius: 0.3, x: 1, y: 1)
    }
}


