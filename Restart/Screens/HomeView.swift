//
//  HomeView.swift
//  Restart
//
//  Created by José Tony on 25/11/21.
//

import SwiftUI

struct HomeView: View {
    // MARK: PROPERTY
    @AppStorage("onboarding") var isOnboardingScreenActive: Bool = false
    
    @State private var isAnimating: Bool = false
    
    // MARK: BODY
    var body: some View {
        VStack(spacing: 20) {
            // MARK: HEADER
            Spacer()
            ZStack {
                CircleGroupView(shapeColor: .gray, shapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(
                        Animation
                            .easeOut(duration: 4)
                            .repeatForever(),
                        value:isAnimating
                    )
            }
            
            // MARK: CENTER
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            // MARK: FOOTER
            Spacer()
            Button {
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                    isOnboardingScreenActive = true
                }
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isAnimating = true
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
