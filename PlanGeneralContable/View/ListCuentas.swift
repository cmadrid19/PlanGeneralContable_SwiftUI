//
//  ListCuentas.swift
//  PlanGeneralContable
//
//  Created by Maxim Macari on 25/1/21.
//

import SwiftUI

struct ListCuentas: View {
    
    var subGrupo: SubGroup
    @State private var totalHeight = CGFloat(100)
    
    var body: some View {
        
        NavigationView{
            ScrollView(showsIndicators: false) {
                
                GeometryReader { geo in
                    if geo.frame(in: .global).minY > -totalHeight {
                        VStack{
                            
                            Spacer(minLength: 40)
                            
                            Text("\(subGrupo.definicion?.removeNewLines ?? "")")
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .font(.callout)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding([.horizontal, .top])
                                .offset(y: -geo.frame(in: .global).minY)
                                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: totalHeight)
                        }
                        .background(GeometryReader {gp -> Color in
                            
                            DispatchQueue.main.async {
                                // update on next cycle with calculated height of ZStack !!!
                                self.totalHeight = gp.size.height
                            }
                            return Color.clear
                        })
                    }
                }
                //default frame
                .frame(height: totalHeight)
                
                VStack(spacing: 0){
                    
                    if let cuentas = subGrupo.cuentas {
                        ForEach(cuentas, id: \.self) { cuenta in
                            if cuenta.codigo != nil {
                                ListCell(cuenta: cuenta)
                            }
                        }
                    }
                    
                    Spacer(minLength: 40)
                }
                .background(Color("Burnt_sienna"))
                .cornerRadius(15)
            }
            
            .navigationBarTitle(Text("\(subGrupo.nombre ?? "")"))
            .navigationBarTitleDisplayMode(.inline)
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
                        
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.2,maxHeight: .infinity, alignment: .center)
                    .background(Color("Persian_green"))
                    .cornerRadius(15)
                    .padding([.leading, .top], tapped ? 8 : 0)
                    
                    VStack{
                        Text("\(cuenta.nombre ?? "")")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .minimumScaleFactor(0.7)
                        
                    }
                    .padding()
                    .frame(maxHeight: .infinity,alignment: .leading)
                    
                    
                }
                
                .frame(maxWidth: .infinity, minHeight: 80, alignment: .leading)
                .background(Color("Orange_yellow_crayola"))
                .cornerRadius(15)
                .padding(.top, tapped ? 0 : 8)
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(.primary)
                .onTapGesture(perform: {
                    withAnimation(.spring()) {
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
                        
                        Spacer(minLength: 20)
                    }
                    .padding([.leading, .trailing, .bottom], 30)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.primary)
                    .background(Color("Orange_yellow_crayola"))
                    .cornerRadius(15, corners: [.bottomRight, .bottomLeft])
                    .offset(y: -10)
                    .zIndex(-2)
                    .onTapGesture {
                        withAnimation(.spring()){
                            self.tapped.toggle()
                        }
                        
                    }
                    
                    
                    //Add corner radius at bottom
                }
                
                Spacer(minLength: tapped ? 0 : 10)
            }
            .padding([.horizontal],tapped == true ? 0 : 10)
        }
    }
}

struct ListCuentas_Previews: PreviewProvider {
    static var previews: some View {
        ListCuentas(subGrupo: testSubGroup)
    }
}

