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
    @State var newChecklistViewIsVisible = false
    
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
            .navigationBarItems(
                leading: Button(action: {self.newChecklistViewIsVisible = true}) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add item")
                    }
                },
                trailing: EditButton())
            // .navigationBarTitle("Checklist")
                .navigationBarTitle("Checklist", displayMode: .inline)
                .onAppear() {
                    self.checklist.printChecklistContents()
            }
        } // End of Navigation View
            .sheet(isPresented: $newChecklistViewIsVisible) {
                // Text("New item screen coming soon!")
                NewChecklistItemView(checklist: self.checklist)
        }
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
