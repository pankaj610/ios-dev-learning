//
//  DetailView.swift
//  NB News
//
//  Created by Pankaj Verma on 25/11/22.
//

import SwiftUI

struct DetailView: View {
    var url: String;
    var body: some View {
        MyWebVew(urlString: url)
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://google.com")
    }
}
