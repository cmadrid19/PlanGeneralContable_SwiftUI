//
//  Home.swift
//  PlanGeneralContable
//
//  Created by Maxim Macari on 22/1/21.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject var vmData = ViewModelData()
    
    var body: some View {
        VStack(spacing: 0){
            if let data = vmData.data {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(data.grupos, id: \.self) { grupo in
                        
                        GroupView(grupo: grupo)
                        
                    }
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
