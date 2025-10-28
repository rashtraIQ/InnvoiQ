//
//  Screens.swift
//  Task1
//
//  Created by Rashtra Humane on 16/09/25.
//

import SwiftUI
import Lottie

struct Screens: View {
    var body: some View {
        LottieView(animation: .named("splashAnimation"))
            .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
    }
}

struct Screens2: View {
    var body: some View {
        LottieView(animation: .named("successAnimation"))
            .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
    }
}



#Preview {
    Screens()
}
