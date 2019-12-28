//
//  ContentView.swift
//  UrhoboPictureGame
//
//  Created by Ufuoma Okoro on 28/12/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    
    var body: some View {
        
        
         NavigationView {
                
                            //Create main menu & Background
                    ZStack(alignment: .top) {
                        
                    
                    
                                Image("background")
                                .resizable()
                                .scaledToFill()
                                .edgesIgnoringSafeArea(.all)
                        
                        VStack {
                            Spacer().frame(height: 100)
                            
                            Text("The Picture Guesing Game")
                                .foregroundColor(Color.blue)
                            
                            Rectangle()
                            .frame(width: 400, height: 3)
                            .foregroundColor(Color.black)
                               
                                Image("agogoArtV2")
                                .resizable()
                                    .frame(width: 300,height: 150)
                                    .scaledToFill()
                                    .border(Color.gray,width: 3)
                                    .shadow(radius: 6)
                            
                            Rectangle()
                                .frame(width: 400, height: 3)
                                .foregroundColor(Color.black)
                            
                            
                            
                        }//End Vstack for poistioning Picture
                        
                        
                        VStack {
                            Spacer().frame(height: 290)
                        //Call menu
                    
                        menuItem()
                        
                            .padding()
                        }
                    
                    } //Ztack End
                
                    
                        
                        
                        
                    .navigationBarTitle(Text("Home 🏚"))
                }//NavigationView End
                
                
            }
        }
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//******** CUSTOMISED STRUCTS FROM HERE *********

//Struct for Dictionart Input
struct dictionaryDataInput: View {
    
    //Bring in Observerable Object - Dictionary
    @ObservedObject var dicDetails = Dictionary()
    
    
    //CoreData - Entity Dictionary
    @Environment(\.managedObjectContext) var managedObjectContext
    //@FetchRequest(entity: Dictionary.entity(), sortDescriptors: []) var dictionary: FetchedResults<Dictionary>
    
    
    //Input Variables
    @State private var inEnglishName = ""
    @State private var inUrhoboName = ""
    @State private var inImangeName = ""
    
    
    
    
    var body: some View {
        
        
        
        
        
        //NavigationView {
        
        
        Form {
            VStack {
            
            
            Text("Hello World")
                
            
                    
                    TextField("Enter English Word",text: $inEnglishName)
                    TextField("Enter Urhobo Transation",text: $inUrhoboName)
                    
                    .autocapitalization(.words)
                    .disableAutocorrection(true)
                    
                
                
                
                
                Spacer()
            }
         
        //.padding()
        }
        
        .padding()

    }
    
}
