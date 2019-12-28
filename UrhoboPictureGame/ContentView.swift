//
//  ContentView.swift
//  UrhoboPictureGame
//
//  Created by Ufuoma Okoro on 28/12/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import SwiftUI
import CoreData

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
    

    //Observable Object
    @ObservedObject var dicDetails = DictionaryWords()
    
    //CoreData - Entity Dictionary
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Dictionary.entity(), sortDescriptors: []) var dictionary: FetchedResults<Dictionary>
    
    
    //Input Variables
    @State private var inEnglishName = ""
    @State private var inUrhoboName = ""
    @State private var inImangeName = ""
    
    
    func processInput() {
        
        let reformatImageName = inEnglishName.lowercased()
        
        //Assign the values to observed variables
        dicDetails.imageName = reformatImageName
        dicDetails.englishName = inEnglishName
        dicDetails.urhoboName = inUrhoboName
        
    }
    
    //Function to reset the field
    func resetTextField() {
        
        self.inEnglishName = ""
        self.inUrhoboName = ""
        self.inImangeName = ""
        
    }
    
    
    
    var body: some View {
        
        NavigationView {
            
            
            
        
            VStack(alignment: .leading) {
                
                Spacer().frame(height: 20)
                
                Section(header: Text("Input Form").foregroundColor(Color.red)) {
        
        
                TextField("Enter English Word",text: $inEnglishName)
                    .autocapitalization(.words)
                    .disableAutocorrection(true)
                    .font(.system(size: 14))
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            
                TextField("Enter Urhobo Transation",text: $inUrhoboName)
                    .autocapitalization(.words)
                    .disableAutocorrection(true)
                    .font(.system(size: 14))
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            
                
                }
                
               
                
        
                
                
                Spacer().frame(height: 20)
                
                
                VStack(alignment: .center) {//Button Action
                        
                        Button(action: {
                            
                            self.processInput()
                            
                        }) {
                            
                            Text("Check Details")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                            .padding()
                            
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(6)
                            
                    }
                        
                }.padding(.horizontal, 150)
                
                
                
                         Spacer().frame(height: 40)
                
                Section(header: Text("Input Result").foregroundColor(Color.red)) {
                       
                        Spacer().frame(height: 20)
                    
                        VStack(alignment: .leading, spacing: 10) {
                        
                            Text("Image Name is: \(self.dicDetails.imageName)")
                            Text("English Word is: \(dicDetails.englishName)")
                            Text("Urhobo Transalation is: \(dicDetails.urhoboName)")
                            

                       }
                        .foregroundColor(Color.green)
                    
                    Spacer().frame(height: 50)
                    
                    VStack(alignment: .center) {//Button Action
                            
                            Button(action: {
                                
                                //Details to coreData Entity Dictionary
                                let word = Dictionary(context: self.managedObjectContext)
                                    word.englishName = self.dicDetails.englishName
                                    word.urhoboName = self.dicDetails.urhoboName
                                    word.imageName = self.dicDetails.imageName
                                
                                //Save the input
                                try? self.managedObjectContext.save()
                                
                                //Reset Text Field with delay of 5 seconds
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                
                                self.resetTextField()
                                }
                                
                            }) {
                                
                                Text("Save Details")
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                                .padding()
                                
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .cornerRadius(6)
                                
                        }
                            
                    }.padding(.horizontal, 150)
                    
                            
                }
                    
                    
                
        
    
    
                Spacer()
            }.padding()
            
            
        
                .navigationBarTitle(Text("Urhobo Dictionary"),displayMode: .inline)
        
       }//End of Navigation View

    }
    
    
}


//Struct to list all CoreData Dictionary words
struct listAllData: View {
    
    //CoreData Environment
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Dictionary.entity(), sortDescriptors: []) var dictionary: FetchedResults<Dictionary>
    
    
    
    
    var body: some View {
        
        NavigationView {
        
            List {
            
            
        
                ForEach(dictionary,id: \.self) { word in
                    
                    VStack(alignment: .leading, spacing: 5) {
                        
                    Text("English word:               \(word.englishName)")
                    Text("Urhobo Transalation:  \(word.urhoboName)")
                    Text("Image File Name:        \(word.imageName)")
                    
                        
                    }//VStack Ending
                    
                
                    
                }//ForEach Ending
                
                //Method for deleting record
                .onDelete(perform: deleteWord(indexSet:))
                
            }// List Ending
                
                //NavigationView Edit
                .navigationBarItems(trailing: EditButton())
                
                //Naviagtion View Title
                .navigationBarTitle(Text("Dictionary List"),displayMode: .inline)
            
        }//Navigation View Ending
        
                
     
            
        }
        
        
        func deleteWord(indexSet: IndexSet) {
                 
            let source = indexSet.first!
            let dicWord = dictionary[source]
                 managedObjectContext.delete(dicWord)
            
            //Update CoreDate
            try? managedObjectContext.save()
    }
    
    
    
}
