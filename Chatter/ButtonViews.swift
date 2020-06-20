//
//  ButtonViews.swift
//  Chatter
//
//  Created by Martin on 2020-06-20.
//  Copyright © 2020 Spotwise. All rights reserved.
//

import SwiftUI

struct PrimaryButton: View {
    
    let title: String
    
    var body: some View {
        Text(title.uppercased())
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .cornerRadius(5)
            .shadow(color: .shadow, radius: 15, x: 0, y: 5)
    }
}

struct SecondaryButton: View {
    
    let title: String
    
    var body: some View {
        Text(title.uppercased())
            .fontWeight(.bold)
            .foregroundColor(.accentColor)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(5)
            .shadow(color: .shadow, radius: 15, x: 0, y: 5)
    }
}

struct ButtonViews_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PrimaryButton(title: "Primary")
                .previewLayout(.fixed(width: 300, height: 100))

            PrimaryButton(title: "This button has a really long text")
                .previewLayout(.fixed(width: 300, height: 100))

            SecondaryButton(title: "Secondary")
                .previewLayout(.fixed(width: 300, height: 100))
        }
    }
}

//struct ButtonViews: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct ButtonViews_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonViews()
//    }
//}
