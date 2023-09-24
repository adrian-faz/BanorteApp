//
//  ShowPDFView.swift
//  BanorteApp
//
//  Created by Adrian Faz on 24/09/23.
//

import SwiftUI

struct ShowPDFView: View {
    let pdfUrl = Bundle.main.url(forResource: "CETE", withExtension: "pdf")!

    var body: some View {
        
        PDFKitView(url: pdfUrl)
            .frame(maxWidth: 450,maxHeight: 850)
    }
}

struct ShowPDFView_Previews: PreviewProvider {
    static var previews: some View {
        ShowPDFView()
    }
}
