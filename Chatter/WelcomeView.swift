//
//  WelcomeView.swift
//  Chatter
//
//  Created by Martin on 2020-06-20.
//  Copyright © 2020 Spotwise. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Create an account")
                .modifier(BodyText())
                .padding()
            
            Text("Connect with people around the world")
            .modifier(TitleText())
                .padding([.bottom, .leading, .trailing])

            VStack(alignment: .center) {
                Image("welcome")
                .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 35)
                    .padding([.leading, .trailing], 80)
                Text("""
                    This is a sample app.
                    Create an account or login to begin chatting
                    """)
                .modifier(BodyText())
                    .multilineTextAlignment(.center)
                    .padding([.leading, .trailing], 40)
            }
            
            VStack(spacing: 30) {
                Button(action: {} ) {
                    PrimaryButton(title: "Log in")
                }
                Button(action: {} ) {
                    SecondaryButton(title: "Sign up")
                }
            }
            .padding([.leading, .bottom, .trailing])
            .padding(.top, 40)
            
            Spacer()
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}
