//
//  FondoSummaryView.swift
//  BanorteApp
//
//  Created by Alumno on 24/09/23.
//

import SwiftUI



struct FondoSummaryView: View {
    
    @State private var fondoTitle = "Fondo Banorte CETE"
    @State private var fondoCurrentMoney = Double(446)
    @State private var fondoExpectedMoney = Double(484.2)
    @State private var fondoTiempoRestante = "1 mes"
    @State private var fondoTiempoQueHaPasado = "0 días"
    @State private var fondoFechaCompra = "24/09/2023"
    @State private var fondoFechaVenta = "24/10/2023"
    @State private var fondoRiesgo = "Bajo"
    
    
    var body: some View {
        
        VStack {
            
            ZStack{
                
                RoundedRectangle(cornerRadius:  12)
                    .fill(Color("RedBanorte"))
                    .frame(height:100)
                    
                
                Text("\(fondoTitle)")
                    .foregroundColor(.white)
                    .padding(.top,40)
                    .font(.title)
                    .font(Font.title3.weight(.bold))
                    
            }

            VStack{
                VStack (){
                    Text("$\(fondoCurrentMoney, specifier: "%.1f")")
                        .padding(.top)
                        .foregroundColor(.black)
                        .font(.title)
                        .font(Font.title.weight(.bold))
                    
                    Text("Tiempo desde la compra: \(fondoTiempoQueHaPasado)")
                        .foregroundColor(.black)
                        .font(.title2)
                        .font(Font.title3.weight(.bold))
                    
                }
                .padding(.bottom, 15)
            }
            .frame(width: 320)
            .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
            .padding(.bottom, 15)
            
            ScrollView{
                VStack {
                    HStack {
                        Text("Fecha de compra: \(fondoFechaCompra)")
                            .padding()
                            .foregroundColor(.white)
                            .font(.title2)
                            .font(Font.title2.weight(.bold))
                            .frame(width: 150, height: 150)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("RedBanorte")))
                        
                        Text("Fecha mínima de venta: \(fondoFechaVenta)")
                            .padding()
                            .foregroundColor(.white)
                            .font(.title2)
                            .font(Font.title2.weight(.bold))
                            .frame(width: 150, height: 150)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("GrayBanorte")))
                    }
                    Text("Riesgo: \(fondoRiesgo)")
                        .padding()
                        .foregroundColor(.black)
                        .font(.title2)
                        .font(Font.title2.weight(.bold))
                        .frame(width: 320, height: 75)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                    HStack {
                        Text("Resultado esperado: $\(fondoExpectedMoney, specifier: "%.1f")")
                            .padding()
                            .foregroundColor(.white)
                            .font(.title2)
                            .font(Font.title2.weight(.bold))
                            .frame(width: 150, height: 150)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("GrayBanorte")))
                        
                        Text("Días sugeridos restantes: \(fondoTiempoRestante)")
                            .padding()
                            .foregroundColor(.white)
                            .font(.title2)
                            .font(Font.title2.weight(.bold))
                            .frame(width: 150, height: 150)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("RedBanorte")))
                    }
                    
                }
                .padding(.bottom, 15)
            }
            
        }.ignoresSafeArea(.all)
        
    }
}

struct FondoSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        FondoSummaryView()
    }
}
