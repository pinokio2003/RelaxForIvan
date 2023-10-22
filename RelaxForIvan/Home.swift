//
//  Home.swift
//  RelaxForIvan
//
//  Created by Anatolii Kravchuk on 22.10.2023.
//

import SwiftUI

struct Home: View {
    @State var show: Bool = false
    
    var body: some View {
        
        GeometryReader { proxy in
            let size = proxy.size
            
            CubeTransitionView(show: $show) {
                ZStack {

                    UkraineView()
                        .frame(width: size.width, height: size.width, alignment: .bottom)
                }
                
            } detail: {
                ZStack {
                    ContentView()
                        .frame(width: size.width, height: size.width, alignment: .bottom)
                }
            }
        }
        .overlay(alignment: .top) {
            HStack(spacing: 12) {
                Text("Custom Image")
                    .font(.title.bold())
                    .foregroundColor(.black)
            }
            .padding()
            .padding(.top, 4)
            .frame(maxWidth: .infinity,alignment: .leading)
        }
        .onTapGesture {
            show.toggle()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
