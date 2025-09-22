//
//  ContentView.swift
//  Task1
//
//  Created by Rashtra Humane on 16/09/25.
//

import SwiftUI
import Lottie

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack{
                LottieView(animation: .named("hola"))
                    .playbackMode(.playing(.toProgress(1, loopMode: .playOnce)))
                
                NavigationLink {
                    ButtonView()
                } label: {
                    HStack(spacing: 5){
                        Text("Next")
                            .font(.headline)
                            .foregroundColor(.red)
                        Image(systemName: "chevron.right")
                            .foregroundStyle(Color(.red))
                            
                    }
                }
            }
        }
    }
}

struct ButtonView: View{
    var body: some View{
        NavigationStack{
            VStack{
                NavigationLink{
                    Screens()
                } label: {
                    Text("SPLASH")
                        .padding()
                        .background(Color.red.opacity(0.7))
                        .cornerRadius(7)
                        .foregroundStyle(Color.black)
                }
                
                NavigationLink{
                    Screens2()
                } label: {
                    Text("DONE")
                        .padding()
                        .background(Color.red.opacity(0.7))
                        .cornerRadius(7)
                        .foregroundStyle(Color.black)
                }
            }
        }
    }
}

#Preview {
    ContentView()
        
}
