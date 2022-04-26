//
//  PosterView.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 22/4/22.
//

import SwiftUI

struct PosterView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var image: Image
    
    var body: some View {
        VStack {
            image
                .resizable()
                .scaledToFill()
                .background(.gray)
        }
        .edgesIgnoringSafeArea(.top)
        .overlay( //Botón para cerrar la vista
            HStack{
                Spacer()
                
                VStack{
                    Button(action:{
                        self.presentationMode.wrappedValue.dismiss() //usado para dismis
//                            self.showAlertView = true //activar la vista de mostrar Alerta
                    }, label: {
                    Image(systemName: "chevron.down.circle")
                        .font(.largeTitle)
//                        .foregroundColor(.blue)
                    })
                    .padding(.trailing, 20)
                    .padding(.top, 20)
                    
                    Spacer()
                }
            })
    }
}

struct PosterView_Previews: PreviewProvider {
    static var previews: some View {
        PosterView(image: Image(systemName: "star"))
    }
}
