//
//  ContentView.swift
//  PlanGeneralContable
//
//  Created by Maxim Macari on 22/1/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Home()
                .preferredColorScheme(.light)
                .navigationBarTitle(Text("Plan General Contable"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
