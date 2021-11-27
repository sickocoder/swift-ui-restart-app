//
//  ContentView.swift
//  Restart
//
//  Created by José Tony on 25/11/21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingScreenActive: Bool = true
    
    var body: some View {
        ZStack {
            if isOnboardingScreenActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
