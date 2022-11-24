//
//  ContentView.swift
//  I am Rich
//
//  Created by Pankaj Verma on 23/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.systemTeal).edgesIgnoringSafeArea(.all)
            VStack {
                Text("Pankaj").font(Font.custom("RubikMicrobe-Regular", size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                Image("profile").resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                
                Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
                    .bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                InfoView(text: "+91 8285288162", imageName: "phone.fill")
                
                InfoView(text: "vermapankaj62@gmail.com", imageName: "message")
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone SE"))
    }
}
