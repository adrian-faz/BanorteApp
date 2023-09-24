//
//  ChatView.swift
//  BanorteApp
//
//  Created by Adrian Faz on 24/09/23.
//

import SwiftUI

import SwiftUI

struct Message: Codable, Hashable {
    var role: String
    var content: String
}

struct listMessages: Codable {
    var messsages: [Message]
}

struct Response: Codable {
    var response: String
}


struct ChatView: View {
    @State private var message = ""
    @State var messages: listMessages = listMessages(messsages: [Message(role: "system", content: "Eres un asesor financiero. Mis preguntas muy probablemente estén relacionadas con este fondo de inversión del Banco Banorte: * Fondo Banorte IPC+ (NTEIPC+) - Tipo de fondo: Fondo de Renta Variable. - Perfil de inversión: Invertir en la Bolsa Mexicana de Valores - Riesgo: Muy alto. - Estrategia: Invierte al menos 90% de su cartera en acciones de empresas enlistadas en las Bolsas de Valores y en menor proporción en instrumentos de Deuda Nacional e Internacional, permitiendo así obtener mayores rendimientos con un horizonte de inversión a largo plazo. - Plazo mínimo: 3 a 5 años - Inversión mínima: $50 Por favor responde claro y conciso a mis preguntas y asume que tengo poco conocimiento del tema. Trata de no separarte del tema aunque el usuario desvie la conversacion. Tus respuestas no deben ser muy largas, pero concretas."),Message(role: "assistant",content:"Entiendo, soy un asesor financero que te ayudará a comprender mejor ese fondo de inversion y temas generales sobre inversiones. Estos son los unicos temas que tocaré y no me desviare del tema."),Message(role: "assistant", content: "¿En qué te puedo ayudar?")])
    @State var infoLoaded : Int = 0
    @State var newResponse: String = ""
    var body: some View {
        
        VStack{
            Text("Barny")
                .font(.title2)
                .foregroundColor(Color("RedBanorte"))
                .fontWeight(.bold)
            ScrollView{
                ForEach(messages.messsages.dropFirst(2), id: \.self) { message in
                    if (message.role == "user"){
                        HStack{
                            Spacer()
                            Text(message.content)
                                .padding()
                                .foregroundColor(.white)
                                .background(.red.opacity(0.9))
                                .cornerRadius(10)
                            
                                .padding(.horizontal,16)
                                .padding(.bottom,10)
                        }
                    
                    } else {
                        HStack{
                            Image("Banortito")
                                .resizable()
                                .scaledToFit()
                                .frame(width:50)
                                .padding(.leading)
                            
                            HStack{
                                Text(message.content)
                                    .frame(width:200)
                                    .padding()
                                    .foregroundColor(.black)
                                    .background(.gray.opacity(0.15))
                                    .cornerRadius(10)
                                    .padding(.horizontal,16)
                                    .padding(.bottom,10)
                                Spacer()
                            }
                        }
                    }
                }.rotationEffect(.degrees(180))
                
            }.rotationEffect(.degrees(180))
            
            HStack{
                TextField("Ingresa tu pregunta: ", text: $message)
                    .padding()
                    .background(Color.teal.opacity(0.1))
                    .cornerRadius(10)
                    .onSubmit {
                        sendMessage(message: message)
                    }
                
                Button {
                    sendMessage(message: message)
                } label: {
                    Image(systemName: "paperplane.fill")
                }.font(.system(size: 16))
                    .padding(.horizontal,10)
            }.padding()
            
        }
        
        
    }
    func sendMessage(message: String){
        withAnimation{
            messages.messsages.append(Message(role: "user", content: message))
            self.message = ""
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1 ){
                
                    Task {
                        await getResponse(messages: messages)
                    } 
                
            }
        }
    }
    
    func getResponse(messages: listMessages) async {
        
        
        guard let url = URL(string: "http://127.0.0.1:5000/chat/fondo") else {
            print("No sirve el URL")
            return
        }
        

        let body: listMessages = messages
        
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
                        
            let result = try? JSONDecoder().decode(Response.self, from: data)
            
            infoLoaded = 3
            if let result = result {
                DispatchQueue.main.async {
                    print(result.response)
                    self.newResponse = result.response
                    print(result)
                    withAnimation{
                        self.messages.messsages.append(Message(role:"assistant",content: newResponse))
                    }

                }
            }
        }.resume()
            
        
        
    }

}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}


