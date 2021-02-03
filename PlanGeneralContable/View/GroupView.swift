//  Grupo.swift
//  PlanGeneralContable
//  Created by Maxim Macari on 22/1/21.

import SwiftUI

struct GroupView: View {
    
    var grupo: Grupo
    let titleHoriMarginalSpace: CGFloat = 30
    @State var showDefinition = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            VStack(alignment: .leading, spacing: 0){
                
                HStack{
                    Text("\(grupo.codigo)")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .minimumScaleFactor(0.65)
                        .scaledToFit()
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        withAnimation(Animation.spring()){
                            self.showDefinition.toggle()
                        }
                    }, label: {
                        Image(systemName: "rectangle.expand.vertical")
                            .foregroundColor(self.showDefinition ? Color.blue : Color.primary)
                            .padding(10)
                            .background(Color("Orange_yellow_crayola").opacity(0.8))
                            .cornerRadius(15)
                            .shadow(color: Color("Orange_yellow_crayola").opacity(0.05), radius: 2, x: -2, y: 2)
                            .shadow(color: Color("Orange_yellow_crayola").opacity(0.05), radius: 2, x: 2, y: -2)
                    })
                    
                }
                .padding(10)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 10){
                        ForEach(grupo.subGroups, id: \.self){ sg in
                            if sg.cuentas != nil {
                                LazyHStack{
                                    NavigationLink(
                                        destination: ListCuentas(subGrupo: sg),
                                        label: {
                                            SubGroupView(subGroup: sg)
                                            
                                        })
                                }
                            }
                            
                        }
                        .frame(maxHeight: UIScreen.main.bounds.height * 0.20)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(10)
                
                
                if showDefinition {
                    
                    Text("\(grupo.definicion.removeNewLines)")
                        .font(.body)
                        .baselineOffset(3)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .padding(.horizontal)
                        .padding(.bottom)
                        .onTapGesture {
                            withAnimation(.spring()){
                                self.showDefinition.toggle()
                            }
                            
                        }
                    
                }
                
            }
            .frame(maxWidth: .infinity)
            .background(Color("Persian_green"))
            //            .clipShape(GroupShape(a: 30)) // current bug in iOS14, where scrollView doesnt show complety if its clipshped with a customShape.
            .cornerRadius(16)
            .padding(.horizontal, 8)
        }
    }
    
    struct GroupShape: Shape {
        
        var a: CGFloat
        
        func path(in rect: CGRect) -> Path {
            
            var path = Path()
            
            let titleVerticalMarginalSpace = rect.maxX * 0.12
            let titleHorizontalSpace = rect.maxX * 0.7
            
            //top
            path.move(to: CGPoint(x: rect.minX, y: rect.minY + titleVerticalMarginalSpace + a))
            path.addQuadCurve(to: CGPoint(x: rect.minX + 15, y: rect.minY + titleVerticalMarginalSpace), control: CGPoint(x: rect.minX, y: rect.minY + titleVerticalMarginalSpace))
            
            //title bottom left
            path.addQuadCurve(to: CGPoint(x: rect.minX + a, y: rect.minY + titleVerticalMarginalSpace/2), control: CGPoint(x: rect.minX + a, y: rect.minY + a * 1.5))
            
            
            //title top left
            path.addQuadCurve(to: CGPoint(x: rect.minX + a * 1.5, y: rect.minY), control: CGPoint(x: rect.minX + a, y: rect.minY))
            
            //title top right
            path.addLine(to: CGPoint(x: titleHorizontalSpace - 40, y: rect.minY))
            path.addQuadCurve(to: CGPoint(x: titleHorizontalSpace, y: rect.minY + titleVerticalMarginalSpace / 2), control: CGPoint(x: titleHorizontalSpace, y: rect.minY))
            
            //title bottom right
            path.addQuadCurve(to: CGPoint(x: titleHorizontalSpace + (titleVerticalMarginalSpace / 2), y: rect.minY + titleVerticalMarginalSpace), control: CGPoint(x: titleHorizontalSpace, y: rect.minY + titleVerticalMarginalSpace))
            
            //top rigth
            path.addLine(to: CGPoint(x: rect.maxX - 40, y: rect.minY + titleVerticalMarginalSpace))
            path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.minY + titleVerticalMarginalSpace + 40), control: CGPoint(x: rect.maxX, y: rect.minY + titleVerticalMarginalSpace))
            
            //bottom
            //right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - 40))
            path.addQuadCurve(to: CGPoint(x: rect.maxX - 40, y: rect.maxY), control: CGPoint(x: rect.maxX, y: rect.maxY))
            //        left
            path.addLine(to: CGPoint(x: rect.minY + 40, y: rect.maxY))
            path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY - 40), control: CGPoint(x: rect.minX, y: rect.maxY))
            
            path.closeSubpath()
            
            return path
        }
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView(grupo: testGroup)
    }
}

var testGroup = Grupo(codigo: "1. Financiación básica Financiación básica", definicion: "\\nComprende el patrimonio neto y la financiación ajena a largo plazo de la empresa destinados, en general, a financiar el activo no corriente y a cubrir un margen razonable del corriente; incluye también situaciones transitorias de financiación.En particular, se aplicarán las siguientes reglas:a) Los pasivos financieros incluidos en este grupo se clasificarán, con carácter general, a efectos de su valoración, en la categoría de «Débitos y partidas a pagar» No obstante, también pueden incluirse en la categoría de «Otros pasivos financieros a valor razonable con cambios en la cuenta de pérdidas y ganancias» en los términos establecidos en las normas de registro y valoración. En este grupo también se incluyen los derivados financieros tanto de cobertura como de negociación cuando su liquidación sea superior a un año.b) De acuerdo con lo dispuesto en las normas de elaboración de las cuentas anuales, en este grupo no se pueden incluir los pasivos financieros a largo plazo que, excepcionalmente, se tengan que clasificar en el momento de su reconocimiento inicial en la categoría de «Pasivos financieros mantenidos para negociar» por cumplir los requisitos establecidos en las normas de registro y valoración, salvo los derivados financieros cuyo plazo de liquidación sea superior a un año.c) Si los pasivos financieros se clasifican a efectos de su valoración en más de una categoría, se desarrollarán las cuentas de cuatro o más cifras que sean necesarias para diferenciar la categoría en la que se hayan incluido.d) Si se emiten o asumen pasivos financieros híbridos que de acuerdo con lo establecido en las normas de registro y valoración se valoren en su conjunto por su valor razonable, se incluirán en la cuenta que corresponda a la naturaleza del contrato principal, para lo que se crearán con el debido desglose, cuentas de cuatro o más cifras que identifiquen que se trata de un pasivo financiero híbrido a largo plazo valorado conjuntamente. Cuando se reconozcan separadamente el contrato principal y el derivado implícito, este último se tratará como si se hubiese contratado de forma independiente, por lo que se incluirá en la cuenta de los grupos 1, 2 ó 5 que proceda y el contrato principal se recogerá en la cuenta que corresponda a su naturaleza, desarrollándose con el debido desglose cuentas de cuatro o más cifras que identifiquen que se trata de un contrato principal financiero híbrido a largo plazo.e) Una cuenta que recoja pasivos financieros clasificados en la categoría de «Otros pasivos financieros a valor razonable con cambios en la cuentas de pérdidas y ganancias» se abonará o cargará, por las variaciones en su valor razonable, con cargo o abono, respectivamente, a las cuentas 663 y 763.f) Una cuenta que recoja pasivos financieros que, de acuerdo con lo establecido en las normas de registro y valoración, formen parte de un grupo enajenable de elementos mantenidos para la venta, se cargará en el momento en que se cumplan las condiciones para su clasificación con abono a la respectiva cuenta del subgrupo 58.g) La diferencia entre el valor por el que se reconocen inicialmente los pasivos financieros y su valor de reembolso, se registrará como un abono (o, cuando proceda, como un cargo) en la cuenta donde esté registrado el pasivo financiero con cargo (o abono) a la cuenta del subgrupo 66 que corresponda según la naturaleza del instrumento.Las cuentas de este subgrupo figurarán en el patrimonio neto del balance, formando parte de los fondos propios, con las excepciones establecidas en las cuentas 103 y 104.", subGroups: [testSubGroup])
