import SwiftUI

struct ContentView: View {
    @State private var showMainApp = false
    
    var body: some View {
        ZStack {
            // 🔹 Arka plan degrade + blur efekti
            LinearGradient(
                colors: [Color.purple.opacity(0.8), Color.black],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            // Arka plan ışık dokusu efekti
            Circle()
                .fill(Color.white.opacity(0.05))
                .blur(radius: 80)
                .offset(x: -150, y: -200)
            
            Circle()
                .fill(Color.purple.opacity(0.3))
                .blur(radius: 100)
                .offset(x: 160, y: 200)
            
            VStack(spacing: 40) {
                Spacer()
                
                // 🔹 Logo veya başlık kısmı
                VStack(spacing: 12) {
                    Image(systemName: "bolt.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.white.opacity(0.9))
                    Text("Sendr.")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 10)
                
                // 🔹 Başlık metinleri
                VStack(spacing: 16) {
                    Text("Track Your Transactions\nWith Sendr.")
                        .font(.system(size: 28, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    
                    Text("Stay on top of your finances with detailed transaction history. Know where your money goes, every step of the way.")
                        .font(.system(size: 15))
                        .foregroundColor(.white.opacity(0.8))
                        .multilineTextAlignment(.center)
                        .lineSpacing(4)
                        .padding(.horizontal, 30)
                }
                
                Spacer()
                
                // 🔹 Butonlar (Glassmorphism)
                HStack(spacing: 20) {
                    GlassButton(title: "Sign In", isFilled: false) {
                        withAnimation(.easeOut) {
                            showMainApp = true
                        }
                    }
                    
                    GlassButton(title: "Register", isFilled: true) {
                        withAnimation(.easeOut) {
                            showMainApp = true
                        }
                    }
                }
                .padding(.bottom, 50)
            }
            .padding()
        }
        .fullScreenCover(isPresented: $showMainApp) {
            MainTabView()   // Senin mevcut ana tabın
        }
    }
}


// MARK: - GlassButton Component
struct GlassButton: View {
    let title: String
    let isFilled: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .frame(width: 140, height: 50)
                .background(
                    ZStack {
                        if isFilled {
                            LinearGradient(colors: [Color.purple, Color.indigo],
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing)
                                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                )
                                .shadow(color: Color.purple.opacity(0.3), radius: 10, x: 0, y: 5)
                        } else {
                            Color.white.opacity(0.15)
                                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Color.white.opacity(0.25), lineWidth: 1)
                                )
                                .background(.ultraThinMaterial)
                        }
                    }
                )
                .foregroundColor(isFilled ? .white : .white.opacity(0.9))
        }
    }
}

#Preview {
    ContentView()
}


