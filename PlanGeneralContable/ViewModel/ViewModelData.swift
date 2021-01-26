//
//  ViewModelData.swift
//  PlanGeneralContable
//
//  Created by Maxim Macari on 22/1/21.
//

import SwiftUI

class ViewModelData: ObservableObject {
    
    @Published var data: PGCData?
    
    init() {
        readLocalFile()
    }
    
    private func readLocalFile() {
        do {
            if let bundlePath = Bundle.main.path(forResource: "PGC_2008",ofType: "json"), let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                //parse
                let decodedData = try JSONDecoder().decode(PGCData.self, from: jsonData)
                self.data = decodedData
                
            }
        } catch {
            print(error)
        }
    }
    
}







