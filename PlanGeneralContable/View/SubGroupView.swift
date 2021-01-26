//
//  SubGroup.swift
//  PlanGeneralContable
//
//  Created by Maxim Macari on 22/1/21.
//

import SwiftUI

struct SubGroupView: View {
    
    var subGroup: SubGroup
    let height = UIScreen.main.bounds.height * 0.20
    
    var body: some View {
        VStack{
            VStack{
                Spacer()
                
                Spacer()
                
                if let nombre = subGroup.nombre {
                    
                    Text("\(nombre)")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .minimumScaleFactor(0.4)
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
                Spacer()
            }
            .frame(width: height, alignment: .center)
//            .fixedSize(horizontal: false, vertical: true)
            .background(Color("Sandy_brown"))
            
            if let codigo = subGroup.codigo {
                Text("\(codigo)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .frame(maxWidth: height, maxHeight: height * 0.2)
                    .padding(.top, 5)
                    .background(
                        BottomView()
                    )
                
            }
            
            Spacer()
        }
        .frame(width: height, height: height)
        .cornerRadius(16)
        .shadow(color: Color.green.opacity(0.3), radius: 10, x: -2, y: 2)
    }
    
    struct BottomView: View {
        var body: some View {
            VStack(spacing: 0){
                Rectangle()
                    .fill(Color.primary)
                    .frame(height: 2)
                
                Color("Burnt_sienna")
                    .cornerRadius(15, corners: [.bottomRight, .bottomLeft])
                    .padding(.bottom, -20)
                    .zIndex(-1000)
            }
        }
    }
}

struct SubGroupVieew_Previews: PreviewProvider {
    static var previews: some View {
        SubGroupView(subGroup: testSubGroup)
    }
}

var testSubGroup = SubGroup(codigo: "10", nombre: "Capital Capital Capital Capital", definicion: "\\nLas cuentas de este subgrupo figurarán en el patrimonio neto del balance, formando parte de los fondos propios, con las excepciones establecidas en las cuentas 103 y 104.", cuentas: [testCuenta, testCuenta, testCuenta, testCuenta])

