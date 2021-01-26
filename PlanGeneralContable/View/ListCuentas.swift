//
//  ListCuentas.swift
//  PlanGeneralContable
//
//  Created by Maxim Macari on 25/1/21.
//

import SwiftUI

struct ListCuentas: View {
    
    var subGrupo: SubGroup
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack() {
                    Spacer()
                    
                    if let cuentas = subGrupo.cuentas {
                        ForEach(cuentas, id: \.self) { cuenta in
                            if cuenta.codigo != nil {
                                ListCell(cuenta: cuenta)
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    private struct ListCell: View {
        
        var cuenta: Cuenta
        @State private var tapped: Bool = false
        
        var body: some View{
            VStack(spacing: 0) {
                HStack(spacing: 0){
                    
                    VStack{
                        Text("\(cuenta.codigo ?? "")")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .minimumScaleFactor(0.7)
                    }
                    .padding()
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.2,maxHeight: .infinity, alignment: .leading)
                    .background(Color("Persian_green"))
                    .cornerRadius(15)
                    
                    VStack{
                        Text("\(cuenta.nombre ?? "")")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .minimumScaleFactor(0.7)
                        
                    }
                    .padding()
                    .frame(maxHeight: .infinity,alignment: .leading)
                    
                }
                .frame(width: UIScreen.main.bounds.width,height: 90, alignment: .leading)
                .background(Color("Orange_yellow_crayola"))
                .cornerRadius(15)
                .padding(.horizontal,5)
                .padding(.top, 5)
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(.primary)
                .onTapGesture(perform: {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        tapped.toggle()
                    }
                })
                
                if tapped {
                    VStack(spacing: 0){
                        
                        Text("\(cuenta.definición?.removeNewLines ?? "")")
                            .font(.caption)
                            .kerning(0.1)
                            .multilineTextAlignment(.center)
                        
                        if let debe = cuenta.movDebe {
                            VStack(spacing: 0){
                                HStack(spacing: 0){
                                    Text("Movimientos al debe")
                                        .fontWeight(.semibold)
                                        .frame(alignment: .leading)
                                    
                                    Spacer()
                                }
                                .frame(alignment: .leading)
                                
                                
                                Text("\(debe.removeNewLines)")
                                    .font(.caption)
                                    .padding(.leading, 10)
                                    .padding(.top, -15)
                                    .multilineTextAlignment(.leading)
                            }
                            .padding(.top)
                            .frame(alignment: .leading)
                            
                        }
                        
                        if let haber = cuenta.movHaber {
                            VStack(spacing: 0){
                                HStack(spacing: 0){
                                    Text("Movimientos al haber")
                                        .fontWeight(.semibold)
                                        .frame(alignment: .leading)
                                    
                                    Spacer()
                                    
                                }
                                .frame(alignment: .leading)
                                
                                
                                Text("\(haber.removeNewLines)")
                                    .font(.caption)
                                    .padding(.leading, 10)
                                    .padding(.top, -15)
                                    .multilineTextAlignment(.leading)
                            }
                            .padding(.top)
                            .frame(alignment: .leading)
                            
                        }
                        
                    }
                    .padding([.leading, .trailing, .bottom], 30)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.primary)
                    .background(Color("Orange_yellow_crayola").opacity(0.4))
                    .padding(.bottom, -30)
                    .offset(y: -10)
                    .zIndex(-2)
                    
                }
            }
        }
    }
}

struct ListCuentas_Previews: PreviewProvider {
    static var previews: some View {
        ListCuentas(subGrupo: testSubGroup)
    }
}









