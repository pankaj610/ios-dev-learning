//
//  InfoView.swift
//  I am Rich
//
//  Created by Pankaj Verma on 25/11/22.
//

import Foundation
import SwiftUI

struct InfoView: View {
    let text: String
    let imageName: String
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.white)
            .frame(height: 50)
            .overlay(
                HStack {
                    Image(systemName: imageName)
                        .foregroundColor(.green)
                    Text(text)
                        .foregroundColor(.blue)
                }
            )
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "Hello", imageName: "phone.fill").previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            .previewLayout(.sizeThatFits)
    }
}
