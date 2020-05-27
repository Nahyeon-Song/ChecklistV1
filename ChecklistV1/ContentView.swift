//
//  ContentView.swift
//  ChecklistV1
//
//  Created by Release on 2020/05/27.
//  Copyright © 2020 Release. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Walk the dog")
                Text("Brush my teeth")
                Text("Learn iOS development")
                Text("Soccer practice")
                Text("Eat ice cream")
            } // End of List
            .navigationBarTitle("Checklist")
        } // End of Navigation View
    } // End of body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
