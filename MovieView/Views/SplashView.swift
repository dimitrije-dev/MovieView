import SwiftUI

struct SplashView: View {
    @State private var isVisible = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Text("DimiMovie")
                .font(.system(size: 42, weight: .bold, design: .rounded))
                .kerning(1.2)
                .foregroundStyle(.white)
                .scaleEffect(isVisible ? 1.0 : 0.9)
                .opacity(isVisible ? 1.0 : 0.0)
                .shadow(color: .white.opacity(0.15), radius: 8, x: 0, y: 4)
                .animation(.easeOut(duration: 0.6), value: isVisible)
        }
        .onAppear {
            isVisible = true
        }
    }
}

#Preview {
    SplashView()
}
