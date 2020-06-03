//
//  ContentView.swift
//  ChecklistV1
//
//  Created by Release on 2020/05/27.
//  Copyright © 2020 Release. All rights reserved.
//

import SwiftUI

struct ChecklistView: View {
    // Properties
    // ==========
    @ObservedObject var checklist = Checklist()
    
    // Content layout
    var body: some View {
        NavigationView {
            List {
                ForEach(checklist.items) {
                    checklistItem in
                        HStack{
                            Text(checklistItem.name)
                            Spacer()
                            Text(checklistItem.isChecked ? "☑️" : "⬛️")
                        } // End of HStack
                        .background(Color.white) // for whole row clickable
                        .onTapGesture {
                            //print("The user tapped a list item!", checklistItem.name)
                            if let matchingIndex = self.checklist.items.firstIndex(where: {$0.id == checklistItem.id}){
                                self.checklist.items[matchingIndex].isChecked.toggle()
                            }
                            self.printChecklistContents()
                        }
                } // End of ForEach
                    .onDelete(perform: checklist.deleteListItem)
                    .onMove(perform: checklist.moveListItem)
            } // End of List
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("Checklist")
                .onAppear() {
                    self.printChecklistContents()
            }
        } // End of Navigation View
    } // End of body
    
    // Method
    func printChecklistContents() {
        for item in checklist.items {
            print(item)
        }
    }
    
    func deleteListItem(whichElement: IndexSet) {
        checklist.items.remove(atOffsets: whichElement)
        printChecklistContents()
    }
    
    func moveListItem(whichElement: IndexSet, destination:Int) {
        checklist.items.move(fromOffsets: whichElement, toOffset: destination)
        printChecklistContents()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
