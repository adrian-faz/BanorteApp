//
//  MainView.swift
//  BanorteApp
//
//  Created by Adrian Faz on 24/09/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack{
            
            RoundedRectangle(cornerRadius:  12)
                .fill(Color("RedBanorte"))
                .frame(height:100)
            
            
            Text("Hola Mario! Bienvenido a Mis Inversiones")
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .padding(.top,40)
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
