//
//  GastosDetailView.swift
//  BanorteApp
//
//  Created by Alumno on 23/09/23.
//

import SwiftUI

struct Locura: Codable {
    var spendings: Spendings
}

struct Spendings: Codable {
    var fijos: Gastos
    var hormiga: Gastos
    var total: Int
}

struct Gastos: Codable {
    var percentage: Int
    var total: Int
}

struct Ingreso: Codable {
var Ingreso: Int
}


struct GastosDetailView: View {
    
    @State var TotalMoney = Double(20000)
    // Aqui pones el porcentaje de Gastos Insispensables
    @State var IndispensablesPercentage = Double(40) / 100
    // Aqui pones el porcentaje de Gastos Insispensables
    @State var HormigaPercentage = Double(40) / 100
    // Aqui pones el porcentaje de Gastos Hormiga
    @State var LeftOverMoneyToInvest = Double(0)
    // Aqui pones el porcentaje de Gastos que quedan al hacer el analisis de gastos
    
    @State private var percentageToInvest: Double = 0
    
    
    var body: some View {
        let importantMoney = TotalMoney * IndispensablesPercentage
        let nonImportantMoney = TotalMoney * HormigaPercentage
        let LeftOverPercentage = 1.00 - IndispensablesPercentage - HormigaPercentage
        let LeftOverMoney = TotalMoney * LeftOverPercentage
        let TotalToInvest = LeftOverMoney + LeftOverMoneyToInvest
        var moneyToInvest = TotalToInvest * (percentageToInvest / 100)
        var minimumMoneyToInvest = 50 * 100 / TotalToInvest
        
        VStack {
            
            ZStack{
                
                RoundedRectangle(cornerRadius:  12)
                    .fill(Color("RedBanorte"))
                    .frame(height:100)
                    
                
                Text("Resumen de Inversiones")
                    .foregroundColor(.white)
                    .padding(.top,40)
                    .font(.title)
                    .font(Font.title3.weight(.bold))
                    
            }
            
            Text("Resumen de Gastos")
                .padding(.top,5)
                .font(.title)
                .font(Font.title3.weight(.bold))
            
            ScrollView{
                
                VStack{
                    HStack (){
                        Text("Ingreso Mensual:")
                            .padding(.vertical,20)
                            .foregroundColor(.black)
                            .font(.title2)
                            .font(Font.title3.weight(.bold))
                        Text("$\(TotalMoney, specifier: "%.2f")")
                            .padding(.vertical,20)
                            .foregroundColor(.black)
                            .font(.title2)
                            .font(Font.title3.weight(.bold))
                    }
                    
                    
                    CircularProgressView(progressImportant: IndispensablesPercentage,
                                         progressNonImportant: HormigaPercentage)
                                .frame(width: 200, height: 200)
                                .padding(.vertical,20)
                    
                    HStack {
                        Image(systemName: "circle.fill")
                            .foregroundColor(.green)
                        Text("Gastos Insispensables - $\(importantMoney, specifier: "%.2f")")
                            .padding(.bottom,5)
                            .foregroundColor(.black)
                            .font(.title3)
                            .font(Font.title3.weight(.bold))
                    }
                    
                    HStack {
                        Image(systemName: "circle.fill")
                            .foregroundColor(.purple)
                        Text("Gastos No Insispensables - $\(nonImportantMoney, specifier: "%.2f")")
                            .padding(.bottom,5)
                            .foregroundColor(.black)
                            .font(.title3)
                            .font(Font.title3.weight(.bold))
                    }
                    
                    HStack {
                        Image(systemName: "circle.fill")
                            .foregroundColor(.blue)
                        Text("Dinero no usado - $\(LeftOverMoney, specifier: "%.2f")")
                            .foregroundColor(.black)
                            .font(.title3)
                            .font(Font.title3.weight(.bold))
                    }
                    
                    HStack (){
                        Text("Disponible para Invertir:")
                            .padding(.vertical,20)
                            .foregroundColor(.black)
                            .font(.title2)
                            .font(Font.title3.weight(.bold))
                        Text("$\(TotalToInvest, specifier: "%.2f")")
                            .padding(.vertical,20)
                            .foregroundColor(.black)
                            .font(.title)
                            .font(Font.title3.weight(.bold))
                    }.onAppear{
                        Task{
                            await getSpendings(ingreso: 20000)
                        }
                    }
                    
                    VStack {
                        VStack {
                            Text("Porcentaje a invertir: \(percentageToInvest, specifier: "%.1f")%")
                                .padding(.top,10)
                                .foregroundColor(.black)
                                .font(.title2)
                                .font(Font.title3.weight(.bold))
                            Slider(value: $percentageToInvest, in: minimumMoneyToInvest...100, step: 1.0)
                            Text("Total a invertir: \(moneyToInvest, specifier: "%.1f")")
                                .padding(.bottom,10)
                                .foregroundColor(.black)
                                .font(.title2)
                                .font(Font.title3.weight(.bold))
                        }
                        .frame(width: 320)
                        
                        Text("Escoje tu fondo de inversion")
                            .padding(.top,20)
                            .foregroundColor(.black)
                            .font(.title)
                            .font(Font.title3.weight(.bold))
                        
                        // Copia y pega esto vvv por cada fondo, y cambia el porcentale y el decimal
                        VStack{
                            VStack (){
                                Text("Fondo Banorte CETE")
                                    .padding(.vertical, 20)
                                    .foregroundColor(.black)
                                    .font(.title2)
                                    .font(Font.title3.weight(.bold))
                                Text("Riesgo: Extremadamente Bajo")
                                    .foregroundColor(.black)
                                    .font(.title3)
                                    .font(Font.title3.weight(.bold))
                                Text("(Esto es una aproximación ideal)")
                                    .padding(.bottom, 20)
                                    .foregroundColor(.black)
                                    .font(.title3)
                                    .font(Font.title3.weight(.bold))
                                
                                Text("Sí invierto: $\(moneyToInvest, specifier: "%.1f")")
                                    .padding(.trailing)
                                    .foregroundColor(.black)
                                    .font(.title2)
                                    .font(Font.title3.weight(.bold))
                                Text("Me espero: 1 mes")
                                    .padding(.trailing)
                                    .foregroundColor(.black)
                                    .font(.title2)
                                    .font(Font.title3.weight(.bold))
                                
                                HStack {
                                    Text("Ganaré: $\(moneyToInvest * 0.0874, specifier: "%.1f")")
                                        .padding(.trailing)
                                        .foregroundColor(.black)
                                        .font(.title2)
                                        .font(Font.title3.weight(.bold))
                                    Text(" (8.74%)")
                                        .padding(.trailing)
                                        .foregroundColor(.green)
                                        .font(.title2)
                                        .font(Font.title3.weight(.bold))
                                }
                                
                                let comisionCETE = (moneyToInvest * 0.0874) * 0.0205;
                                
                                HStack {
                                    Text("Comisión: $\(comisionCETE, specifier: "%.1f")")
                                        .padding(.trailing)
                                        .foregroundColor(.black)
                                        .font(.title2)
                                        .font(Font.title3.weight(.bold))
                                    Text(" (2.05%)")
                                        .padding(.trailing)
                                        .foregroundColor(.orange)
                                        .font(.title2)
                                        .font(Font.title3.weight(.bold))
                                }
                                
                                Text("Me quedaré con: $\(moneyToInvest * 1.0874 - comisionCETE, specifier: "%.1f")")
                                    .padding(.trailing)
                                    .foregroundColor(.black)
                                    .font(.title2)
                                    .font(Font.title3.weight(.bold))
                                
                                HStack {
                                    Button {
                                        //print("Image tapped!")
                                    } label: {
                                        Text("Más información")
                                            .padding(5)
                                            .foregroundColor(.white)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("GrayBanorte")))
                                            .font(.title2)
                                            .font(Font.title3.weight(.bold))
                                    }
                                    
                                    Button {
                                        //print("Image tapped!")
                                    } label: {
                                        Text("Invertir")
                                            .padding(5)
                                            .foregroundColor(.white)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("RedBanorte")))
                                            .font(.title2)
                                            .font(Font.title3.weight(.bold))
                                    }
                                    
                                }
                            }
                            .padding(.bottom, 15)
                            
                        }
                        .frame(width: 320)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                        .padding(.bottom, 15)
                        
                        // Copia y pega esto vvv por cada fondo, y cambia el porcentale y el decimal
                        VStack{
                            VStack (){
                                Text("Fondo Banorte Digital")
                                    .padding(.vertical, 20)
                                    .foregroundColor(.black)
                                    .font(.title2)
                                    .font(Font.title3.weight(.bold))
                                Text("Riesgo: Extremadamente Bajo")
                                    .foregroundColor(.black)
                                    .font(.title3)
                                    .font(Font.title3.weight(.bold))
                                Text("(Esto es una aproximación ideal)")
                                    .padding(.bottom, 20)
                                    .foregroundColor(.black)
                                    .font(.title3)
                                    .font(Font.title3.weight(.bold))
                                Text("Sí invierto: $\(moneyToInvest, specifier: "%.1f")")
                                    .padding(.trailing)
                                    .foregroundColor(.black)
                                    .font(.title2)
                                    .font(Font.title3.weight(.bold))
                                Text("Me espero: 1 mes")
                                    .padding(.trailing)
                                    .foregroundColor(.black)
                                    .font(.title2)
                                    .font(Font.title3.weight(.bold))
                                
                                HStack {
                                    Text("Ganaré: $\(moneyToInvest * 0.1, specifier: "%.1f")")
                                        .padding(.trailing)
                                        .foregroundColor(.black)
                                        .font(.title2)
                                        .font(Font.title3.weight(.bold))
                                    Text(" (10.00%)")
                                        .padding(.trailing)
                                        .foregroundColor(.green)
                                        .font(.title2)
                                        .font(Font.title3.weight(.bold))
                                }
                                
                                let comisionDig = (moneyToInvest * 0.1) * 0.01;
                                
                                HStack {
                                    Text("Comisión: $\(comisionDig, specifier: "%.1f")")
                                        .padding(.trailing)
                                        .foregroundColor(.black)
                                        .font(.title2)
                                        .font(Font.title3.weight(.bold))
                                    Text(" (1.00%)")
                                        .padding(.trailing)
                                        .foregroundColor(.orange)
                                        .font(.title2)
                                        .font(Font.title3.weight(.bold))
                                }
                                
                                Text("Me quedaré con: $\(moneyToInvest * 1.1 - comisionDig, specifier: "%.1f")")
                                    .padding(.trailing)
                                    .foregroundColor(.black)
                                    .font(.title2)
                                    .font(Font.title3.weight(.bold))
                                
                                HStack {
                                    Button {
                                        //print("Image tapped!")
                                    } label: {
                                        Text("Más información")
                                            .padding(5)
                                            .foregroundColor(.white)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("GrayBanorte")))
                                            .font(.title2)
                                            .font(Font.title3.weight(.bold))
                                    }
                                    
                                    Button {
                                        //print("Image tapped!")
                                    } label: {
                                        Text("Invertir")
                                            .padding(5)
                                            .foregroundColor(.white)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("RedBanorte")))
                                            .font(.title2)
                                            .font(Font.title3.weight(.bold))
                                    }
                                    
                                }
                            }
                            .padding(.bottom, 15)
                            
                        }
                        .frame(width: 320)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                        .padding(.bottom, 15)
                        
                        // Copia y pega esto vvv por cada fondo, y cambia el porcentale y el decimal
                        VStack{
                            VStack (){
                                Text("Fondo Banorte Dólares")
                                    .padding(.vertical, 20)
                                    .foregroundColor(.black)
                                    .font(.title2)
                                    .font(Font.title3.weight(.bold))
                                Text("Riesgo: Bajo")
                                    .foregroundColor(.black)
                                    .font(.title3)
                                    .font(Font.title3.weight(.bold))
                                Text("(Esto es una aproximación ideal)")
                                    .padding(.bottom, 20)
                                    .foregroundColor(.black)
                                    .font(.title3)
                                    .font(Font.title3.weight(.bold))
                                Text("Sí invierto: $\(moneyToInvest, specifier: "%.1f")")
                                    .padding(.trailing)
                                    .foregroundColor(.black)
                                    .font(.title2)
                                    .font(Font.title3.weight(.bold))
                                Text("Me espero: 1 año")
                                    .padding(.trailing)
                                    .foregroundColor(.black)
                                    .font(.title2)
                                    .font(Font.title3.weight(.bold))
                                
                                HStack {
                                    Text("Ganaré: $\(moneyToInvest * 0.1, specifier: "%.1f")")
                                        .padding(.trailing)
                                        .foregroundColor(.black)
                                        .font(.title2)
                                        .font(Font.title3.weight(.bold))
                                    Text(" (12.68%)")
                                        .padding(.trailing)
                                        .foregroundColor(.green)
                                        .font(.title2)
                                        .font(Font.title3.weight(.bold))
                                }
                                
                                let moneyDollars = moneyToInvest * 1.2682417;
                                let comisionDol = moneyDollars * 0.0175;
                                
                                HStack {
                                    Text("Comisión: $\(comisionDol, specifier: "%.1f")")
                                        .padding(.trailing)
                                        .foregroundColor(.black)
                                        .font(.title2)
                                        .font(Font.title3.weight(.bold))
                                    Text(" (1.75%)")
                                        .padding(.trailing)
                                        .foregroundColor(.orange)
                                        .font(.title2)
                                        .font(Font.title3.weight(.bold))
                                }
                                
                                Text("Me quedaré con: $\(moneyDollars - comisionDol,specifier: "%.1f")")
                                    .padding(.trailing)
                                    .foregroundColor(.black)
                                    .font(.title2)
                                    .font(Font.title3.weight(.bold))
                                
                                HStack {
                                    Button {
                                        //print("Image tapped!")
                                    } label: {
                                        Text("Más información")
                                            .padding(5)
                                            .foregroundColor(.white)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("GrayBanorte")))
                                            .font(.title2)
                                            .font(Font.title3.weight(.bold))
                                    }
                                    
                                    Button {
                                        //print("Image tapped!")
                                    } label: {
                                        Text("Invertir")
                                            .padding(5)
                                            .foregroundColor(.white)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("RedBanorte")))
                                            .font(.title2)
                                            .font(Font.title3.weight(.bold))
                                    }
                                    
                                }
                            }
                            .padding(.bottom, 15)
                            
                        }
                        .frame(width: 320)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                        .padding(.bottom, 15)
                    }
                    
                }
                
            }
            
        }.ignoresSafeArea(.all)
        
    }
    
    func getSpendings(ingreso: Int) async {
        
        guard let url = URL(string: "http://127.0.0.1:5000/spendings/user") else {
            print("No sirve el URL")
            return
        }
        

        let body: Ingreso = Ingreso(Ingreso: ingreso)
        
        print(body)
    

        guard let finalBody = try? JSONEncoder().encode(body) else {
            return
        }
        
        
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, res, err) in
            
            guard let data = data, err == nil else {return}
                        
            let result = try? JSONDecoder().decode(Locura.self, from: data)
            
            if let result = result {
                DispatchQueue.main.async {
                    self.IndispensablesPercentage = Double(result.spendings.fijos.percentage)/100
                    self.HormigaPercentage = Double(result.spendings.hormiga.percentage)/100
                    
                    print(result)

                }
            }
        }.resume()
            
        
        
    }
}

/*
 {
 "spendings": {
     "fijos": {
         "list": [
             {
                 "category": "Transporte público",
                 "cost": 30
             },
             {
                 "category": "Electrónicos",
                 "cost": 1500
             },
             {
                 "category": "Libros",
                 "cost": 750
             },
             {
                 "category": "Transporte",
                 "cost": 270
             },
             {
                 "category": "Comida",
                 "cost": 525
             },
             {
                 "category": "Alquiler",
                 "cost": 12000
             },
             {
                 "category": "Material de estudio",
                 "cost": 240
             },
             {
                 "category": "Médico",
                 "cost": 1125
             },
             {
                 "category": "Farmacia",
                 "cost": 180
             },
             {
                 "category": "Deportes",
                 "cost": 450
             },
             {
                 "category": "Teléfono",
                 "cost": 570
             },
             {
                 "category": "Impresiones",
                 "cost": 105
             }
         ],
         "percentage": 89,
         "total": 17745
     },
     "hormiga": {
         "list": [
             {
                 "category": "Café",
                 "cost": 90
             },
             {
                 "category": "Cine",
                 "cost": 375
             },
             {
                 "category": "Pizza",
                 "cost": 195
             }
         ],
         "percentage": 3,
         "total": 660
     },
     "total": 18405
 }
}
 */

struct GastosDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GastosDetailView()
    }
}

struct CircularProgressView: View {
    let progressImportant: Double
    let progressNonImportant: Double
        
    var body: some View {
        
        let progressNotUsed = progressImportant + progressNonImportant
        
        ZStack {
            Circle()
                .stroke(
                    Color.blue,
                    lineWidth: 30
                )
            Circle()
                // 2
                .trim(from: 0, to: progressImportant)
                .stroke(
                    Color.green,
                    style: StrokeStyle(
                        lineWidth: 30
                    )
                )
                .rotationEffect(.degrees(-90))
            Circle()
                // 2
                .trim(from: progressImportant, to: progressNotUsed)
                .stroke(
                    Color.purple,
                    style: StrokeStyle(
                        lineWidth: 30
                    )
                )
                .rotationEffect(.degrees(-90))
        }
    }
}
