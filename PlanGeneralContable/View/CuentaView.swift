//
//  Cuenta.swift
//  PlanGeneralContable
//
//  Created by Maxim Macari on 23/1/21.
//

import SwiftUI

struct CuentaView: View {
    
    var cuenta: Cuenta
    
    var body: some View {
        
        VStack{
            
            
            VStack{
              
                Text("\(cuenta.codigo ?? "")")
                    .font(.title2)
                    .fontWeight(.semibold)
                    
                
                Text("\(cuenta.nombre ?? "")")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            
            Text("Definición: \n \(cuenta.definición ?? "")")
            
            
            Text("Movimientos al debe: \(cuenta.movDebe ?? "")")
            
            
            Text("Movimientos al haber: \(cuenta.movHaber ?? "")")
        }
        
        
    }
    
}

struct CuentaView_Previews: PreviewProvider {
    static var previews: some View {
        CuentaView(cuenta: testCuenta)
    }
}

var testCuenta: Cuenta = Cuenta(codigo: "108", nombre: "Acciones o participaciones propias en situaciones especiales", definición: "\\nAcciones o participaciones propias adquiridas por la empresa (sección cuarta del capítulo IV del Texto Refundido de la Ley de Sociedades Anónimas y de la Ley de Sociedades de Responsabilidad Limitada).Figurarán en el patrimonio neto, con signo negativo.", movDebe: "\\nSe cargarán por el importe de la adquisición de las acciones o participaciones, con abono, generalmente, a cuentas del subgrupo 57.", movHaber: "\\nSe abonarán:* Por la enajenación de las acciones o participaciones, con cargo, generalmente, a cuentas del subgrupo 57. La diferencia entre la cantidad obtenida en la enajenación de las acciones o participaciones propias y su valor contable se cargará o abonará, según proceda, a cuentas del subgrupo 11.* Por la reducción de capital, con cargo a la cuenta 100 por el importe del nominal de las acciones o participaciones. La diferencia entre el importe de adquisición de las acciones o participaciones y su valor nominal se cargará o abonará, según proceda, a cuentas del subgrupo 11.", ejemplos: nil)

