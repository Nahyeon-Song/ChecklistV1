//
//  EditChecklistItemView.swift
//  ChecklistV1
//
//  Created by Release on 2020/06/03.
//  Copyright © 2020 Release. All rights reserved.
//

import SwiftUI

struct EditChecklistItemView: View {
    // Properties
    // ==========
    @Binding var checklistItem: ChecklistItem
    
    var body: some View {
        Form {
            TextField("Name", text: $checklistItem.name)
            Toggle("Completed", isOn: $checklistItem.isChecked)
        } // End of Form
    }
}

struct EditChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditChecklistItemView(checklistItem: .constant(ChecklistItem(name:"Sample item")))
    }
}
