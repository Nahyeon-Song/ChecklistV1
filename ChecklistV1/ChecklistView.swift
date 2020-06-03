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
                    /*
                    checklistItem in
                        RowView(checklistItem: checklistItem) */
                    index in RowView(checklistItem: self.$checklist.items[index])
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
