//
//  FondoDetailsView.swift
//  BanorteApp
//
//  Created by Adrian Faz on 23/09/23.
//

import SwiftUI
import PDFKit




struct FondoDetailsView: View {
    var tituloFondo: String = ""
    var siglasFondo: String = ""
    var perfil: String = ""
    var plazoMinimo: String = ""
    var inversionMinimia: String = ""
    var tipoDeuda: String = ""
    var riesgo: String = ""
    var estrategia: String = ""
    let pdfUrl = Bundle.main.url(forResource: "NTEDIG", withExtension: "pdf")!

    var body: some View {
        
        NavigationStack{
        
            VStack{
                Text(tituloFondo)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("RedBanorte"))
                    .padding(.top,12)
                
                Text(siglasFondo)
                    .foregroundColor(Color("GrayBanorte"))
                    .font(.title3)
                    .fontWeight(.semibold)
                    .italic()
                
                ScrollView{
                    Grid{
                        GridRow{
                            
                            GridRow{
                                VStack{
                                    
                                    Text("Perfil")
                                        .foregroundColor(.white)
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .padding(.bottom,4)
                                    
                                    
                                    Text(perfil)
                                        .font(.callout)
                                        .foregroundColor(.white)
                                    
                                    
                                }.padding(.horizontal)
                                    .frame(width:300, height: 140)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("RedBanorte")))
                            }
                            
                        }
                    }
                    
                    
                    Grid(){
                        GridRow{
                            
                            VStack{
                                
                                Text("Plazo mínimo")
                                    .foregroundColor(.white)
                                    .font(.callout)
                                    .fontWeight(.regular)
                                    .padding(2)
                                
                                Text(plazoMinimo)
                                    .fontWeight(.bold)
                                    .font(.title)
                                    .foregroundColor(.white)
                                
                                
                            }.frame(width:150, height: 130)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("GrayBanorte")))
                            VStack{
                                
                                Text("Inversión Mínima")
                                    .foregroundColor(.white)
                                    .font(.callout)
                                    .fontWeight(.regular)
                                    .padding(2)
                                
                                Text(inversionMinimia)
                                    .fontWeight(.bold)
                                    .font(.title)
                                    .foregroundColor(.white)
                                
                                
                                
                            }.frame(width:150, height: 130)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("GrayBanorte")))
                        }
                        
                        
                        
                        Grid{
                            GridRow{
                                
                                VStack{
                                    
                                    Text("Tipo de Deuda")
                                        .foregroundColor(.white)
                                        .font(.callout)
                                        .fontWeight(.regular)
                                        .padding(2)
                                    
                                    Text(tipoDeuda)
                                        .fontWeight(.bold)
                                        .font(.title3)
                                        .foregroundColor(.white)
                                    
                                    
                                }.frame(width:150, height: 130)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("GrayBanorte")))
                                VStack{
                                    
                                    Text("Riesgo")
                                        .foregroundColor(.white)
                                        .font(.callout)
                                        .fontWeight(.regular)
                                        .padding(2)
                                    
                                    Text(riesgo)
                                        .fontWeight(.bold)
                                        .font(.title3)
                                        .foregroundColor(.white)
                                    
                                    
                                    
                                }.frame(width:150, height: 130)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("GrayBanorte")))
                            }
                        }
                        
                        Grid{
                            GridRow{
                                
                                GridRow{
                                    VStack{
                                        
                                        Text("Estrategia")
                                            .foregroundColor(.white)
                                            .font(.title3)
                                            .fontWeight(.semibold)
                                            .padding(.bottom,4)
                                        
                                        Text(estrategia)
                                            .font(.callout)
                                            .foregroundColor(.white)
                                            .padding(.horizontal)
                                        
                                        
                                    }.frame(width:300, height: 200)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("RedBanorte")))
                                }
                                
                            }
                        }
                        
                        
                    }
                    
                }
                
            }
            
            VStack{
                
                NavigationLink{
                    ShowPDFView()
                } label: {
                    Text("Conoce más")
                }
                
                
                NavigationLink{
                    ChatView()
                } label: {
                    HStack{
                        Image("Banortito")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35)
                        
                        Text("Chatea")
                            .foregroundColor(Color("RedBanorte"))
                        
                    }
                    
                }
                 
                
            
            }

            }
           
        }
        
        
        
    }


struct FondoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FondoDetailsView()
    }
}

struct PDFKitView: UIViewRepresentable {
    let url: URL // new variable to get the URL of the document
    
    func makeUIView(context: UIViewRepresentableContext<PDFKitView>) -> PDFView {
        // Creating a new PDFVIew and adding a document to it
        let pdfView = PDFView()
        pdfView.document = PDFDocument(url: self.url)
        pdfView.autoScales = true
        return pdfView
    }
    
    func updateUIView(_ uiView: PDFView, context: UIViewRepresentableContext<PDFKitView>) {
        // we will leave this empty as we don't need to update the PDF
    }
}
