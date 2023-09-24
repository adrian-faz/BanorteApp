//
//  ContentView.swift
//  BanorteApp
//
//  Created by Adrian Faz on 23/09/23.
//

import SwiftUI

struct FondoModel: Hashable {
    var tituloFondo: String = ""
    var siglasFondo: String = ""
    var perfil: String = ""
    var plazoMinimo: String = ""
    var inversionMinimia: String = ""
    var tipoDeuda: String = ""
    var riesgo: String = ""
    var estrategia: String = ""
}

var fondos1: [FondoModel] = [
    
    FondoModel(
        tituloFondo: "Fondo Banorte Plazo",
        siglasFondo: "NTEPZO",
        perfil: "Obtener un premio adicional por su permanencia",
        plazoMinimo: "91 días",
        inversionMinimia: "$50,000",
        tipoDeuda: "Fondo de Deuda",
        riesgo: "Extremadamente bajo",
        estrategia: "Es un fondo 100% de deuda con un horizonte de inversión a corto plazo compuesto por valores gubernamentales, bancarios y/o corporativos con la mejor calidad crediticia (AAA) y un rendimiento objetivo del 100% CETES a 91 días."
    ),
    FondoModel(
        tituloFondo: "Fondo Banorte Digital",
        siglasFondo: "NTEDIG",
        perfil: "Crecer sus ahorros de una forma totalmente digital",
        plazoMinimo: "1 mes",
        inversionMinimia: "$50",
        tipoDeuda: "Fondo de Deuda",
        riesgo: "Extremadamente bajo",
        estrategia: "Es un fondo 100% de deuda con un horizonte de inversión a corto plazo compuesto por valores gubernamentales y bancarios que busca obtener un rendimiento adicional a la deuda gubernamental."
    ),
    FondoModel(
        tituloFondo: "Fondo Banorte Cete",
        siglasFondo: "NTECT",
        perfil: "Crecer sus ahorros",
        plazoMinimo: "1 mes",
        inversionMinimia: "$50",
        tipoDeuda: "Fondo de Deuda",
        riesgo: "Extremadamente bajo",
        estrategia: "Es un fondo 100% de deuda con un horizonte de inversión a corto plazo compuesto por valores gubernamentales y bancarios que busca obtener un rendimiento adicional a la deuda gubernamental."
    )
]

var familiaEstrategicos: [String] = ["Estratégico Renta Fija (NTED)", "Portafolio Básico (NTE1)", "Portafolio Equilibrado (NTE2)", "Portafolio Crecimiento (NTE3)"]



var fondos2: [FondoModel] = [
    FondoModel(
        tituloFondo: "Fondo Estrategia",
        siglasFondo: "NTED",
        perfil: "Rendimiento superior a la deuda gubernamental",
        plazoMinimo: "1 a 3 años",
        inversionMinimia: "$50",
        tipoDeuda: "Fondo de Deuda",
        riesgo: "Moderado",
        estrategia: "Es un fondo 100% de deuda con un horizonte de inversión a mediano plazo compuesto por Fondos de deuda gubernamental nacional, internacional y corporativa, todos administrados por la Operadora de Fondos Banorte."
    ),
    FondoModel(
        tituloFondo: "Fondo Estrategia",
        siglasFondo: "NTE1",
        perfil: "Diversificar y hacer crecer sus inversiones",
        plazoMinimo: "3 años",
        inversionMinimia: "$50",
        tipoDeuda: "Fondo de Estrategia Discrecional",
        riesgo: "Moderado a alto",
        estrategia: "Invierte alrededor del 80% de los activos de su cartera en instrumentos de Deuda, y el 20% en instrumentos de Renta Variable. Los valores podrán estar invertidos en mercados locales e internacionales. Obtendrás mayores rendimientos con un horizonte de inversión a largo plazo."
    ),
    FondoModel(
        tituloFondo: "Fondo Estrategia",
        siglasFondo: "NTE2",
        perfil: "Diversificar y hacer crecer sus inversiones",
        plazoMinimo: "3 años",
        inversionMinimia: "$50",
        tipoDeuda: "Fondo de Estrategia Discrecional",
        riesgo: "Alto",
        estrategia: "Invierte alrededor del 60% de los activos de su cartera en instrumentos de Deuda, y el 40% en instrumentos de Renta Variable. Los valores podrán estar invertidos en mercados locales e internacionales. Obtendrás mayores rendimientos con un horizonte de inversión a largo plazo."
    ),
    FondoModel(
        tituloFondo: "Fondo Estrategia",
        siglasFondo: "NTE3",
        perfil: "Diversificar sus inversiones para obtener mayores rendimientos",
        plazoMinimo: "3 años",
        inversionMinimia: "$50",
        tipoDeuda: "Fondo de Estrategia Discrecional",
        riesgo: "Alto",
        estrategia: "Invierte alrededor del 40% de los activos de su cartera en instrumentos de Deuda, y el 60% en instrumentos de Renta Variable. Los valores podrán estar invertidos en mercados locales e internacionales. Obtendrás mayores rendimientos con un horizonte de inversión a largo plazo."
    )
]

var fondos3: [FondoModel] = [
    FondoModel(
    tituloFondo: "Fondo Banorte Dólares",
    siglasFondo: "NTEDLS",
    perfil: "Estabilidad y un mejor resguardo del valor del peso respecto al dólar (USD)",
    plazoMinimo: "1 año o más",
    inversionMinimia: "$50",
    tipoDeuda: "Fondo de Cobertura",
    riesgo: "Bajo",
    estrategia: "Es un fondo conformado principalmente por activos de deuda con la mejor calidad crediticia (AAA) denominados, indizados y/o referenciados al dólar."
),
FondoModel(
    tituloFondo: "Fondo Banorte Dólares+",
    siglasFondo: "NTEDLS+",
    perfil: "Inversión internacional",
    plazoMinimo: "2 años o más",
    inversionMinimia: "$50",
    tipoDeuda: "Fondo de Renta Variable en Dólares",
    riesgo: "Moderado",
    estrategia: "Es un fondo conformado principalmente por activos denominados en dólares."
),

FondoModel(
    tituloFondo: "Fondo Banorte IPC+",
    siglasFondo: "NTEIPC+",
    perfil: "Invertir en la Bolsa Mexicana de Valores",
    plazoMinimo: "3 a 5 años",
    inversionMinimia: "$50",
    tipoDeuda: "Fondo de Renta Variable",
    riesgo: "Muy alto",
    estrategia: "Invierte al menos 90% de su cartera en acciones de empresas enlistadas en las Bolsas de Valores y en menor proporción en instrumentos de Deuda Nacional e Internacional, permitiendo así obtener mayores rendimientos con un horizonte de inversión a largo plazo."
)
]


struct ContentView: View {
    
    var familiaBasicos: [String] = ["Fondo Banorte Digital (NTEDIG)", "Fondo Banorte Plazo (NTEPZO)", "Fondo Banorte (NTECT)"]
    var familiaEstrategicos: [String] = ["Estratégico Renta Fija (NTED)", "Portafolio Básico (NTE1)", "Portafolio Equilibrado (NTE2)", "Portafolio Crecimiento (NTE3)"]
    var familiaEspecializados: [String] = ["Líquido Dólares NTEDLS", "Estratégico Dólares (NTEDLS+)", "Empresas México (NTEIPC+)", "Empresas Sustentables (NTEESG)"]
    
    var body: some View {
        VStack {
            
            NavigationStack{
                
                ZStack{
                    
                    RoundedRectangle(cornerRadius:  12)
                        .fill(Color("RedBanorte"))
                        .frame(height:100)
                    
                    
                    Text("Hola Mario! Bienvenido a Mis Inversiones")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .padding(.top,40)
                    
                }
                
                Text("Explora los diferentes fondos de inversión y conoce más detalles sobre ellos!")
                    .padding(.horizontal)
                    .padding(.top,5)
                    .font(.callout)
                
                
                ScrollView{
                    
                    VStack{
                        HStack (){
                            Text("Familia Básicos")
                                .padding(.vertical,20)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.title3)
                        }
                        .frame(width: 320)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("RedBanorte")))
                        .shadow(color: .black, radius: 2)
                        
                        
                        
                        ForEach(fondos1, id: \.self) { fondo in
                            
                            FondoView(myFondo: fondo)
                            
                        }
                    }
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                    .padding()
                    
                    
                    
                    VStack{
                        HStack (){
                            Text("Familia Estratégicos")
                                .padding(.vertical,20)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.title3)
                        }
                        .frame(width: 320)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("RedBanorte")))
                        .shadow(color: .black, radius: 2)
                        
                        
                        
                        ForEach(fondos3
                                , id: \.self) { fondo in
                            
                            FondoView(myFondo: fondo)
                            
                        }
                    }
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                    .padding()
                    
                    VStack{
                        HStack (){
                            Text("Familia Especializados")
                                .padding(.vertical,20)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.title3)
                        }
                        .frame(width: 320)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("RedBanorte")))
                        .shadow(color: .black, radius: 2)
                        
                        ForEach(fondos2, id: \.self) { fondo in
                            
                            FondoView(myFondo: fondo)
                        }
                    }
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                    .padding()
                    
                    
                    NavigationLink{
                        GastosDetailView()
                    } label: {
                        Text("Mis Fondos")
                            .foregroundColor(Color("RedBanorte"))
                            .fontWeight(.bold)
                            .padding(15)
                    }
                    
                }
            }

        }.ignoresSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FondoView: View {
    var myFondo: FondoModel
    var body: some View {
        
        VStack (alignment:.leading){
            NavigationLink{
                FondoDetailsView(tituloFondo: myFondo.tituloFondo, siglasFondo: myFondo.siglasFondo, perfil: myFondo.perfil, plazoMinimo: myFondo.plazoMinimo, inversionMinimia: myFondo.inversionMinimia, tipoDeuda: myFondo.tipoDeuda, riesgo: myFondo.riesgo, estrategia: myFondo.estrategia)
            } label: {
                HStack{
                    Text(myFondo.tituloFondo)
                        .padding(8)
                        .foregroundColor(.black)
                        .underline()
                        .font(.callout)
                }
                .padding(5)
            }
        }
    }
}





