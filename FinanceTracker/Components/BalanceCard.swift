import SwiftUI

struct BalanceCard: View {
    var balance: Double
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.purple.opacity(0.7), Color.purple.opacity(0.4)],
                           startPoint: .topLeading, endPoint: .bottomTrailing)
                .cornerRadius(20)
                .frame(height: 150)
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Available Balance")
                        .font(.footnote)
                        .foregroundColor(.white.opacity(0.8))
                    Text("₦\(String(format: "%.2f", balance))")
                        .font(.title3.bold())
                        .foregroundColor(.white)
                    Text("Main Account")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.7))
                }
                Spacer()
                Image(systemName: "globe.europe.africa")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.white.opacity(0.2))
            }
            .padding()
        }
    }
}

