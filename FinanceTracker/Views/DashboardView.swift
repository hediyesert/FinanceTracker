import SwiftUI

struct DashboardView: View {
    @ObservedObject var viewModel: FinanceViewModel
    
    var body: some View {
        ZStack {
            // 🔹 Arka plan gradient + blur
            LinearGradient(
                colors: [Color.purple.opacity(0.9), Color.black],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 25) {
                    // Header
                    HStack {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Good morning,")
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.8))
                            Text("Mr. Banks O.")
                                .font(.title2.bold())
                                .foregroundColor(.white)
                        }
                        Spacer()
                        Image(systemName: "bell.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .padding(10)
                            .background(.ultraThinMaterial)
                            .clipShape(Circle())
                    }
                    .padding(.top, 10)
                    
                    // 🔹 Cam efekti Kart
                    GlassBalanceCard(balance: viewModel.balance)
                    
                    // 🔹 İşlem butonları
                    HStack(spacing: 30) {
                        DashboardAction(icon: "arrow.left.arrow.right", title: "Transfer")
                        DashboardAction(icon: "dollarsign.circle", title: "Withdraw")
                        DashboardAction(icon: "plus.circle", title: "Deposit")
                    }
                    
                    Divider().background(Color.white.opacity(0.2))
                        .padding(.vertical, 10)
                    
                    // 🔹 İşlemler
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Recent Transactions")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.bottom, 6)
                        
                        ForEach(viewModel.transactions) { transaction in
                            TransactionRow(transaction: transaction)
                                .background(Color.white.opacity(0.05))
                                .cornerRadius(10)
                        }
                    }
                }
                .padding()
            }
        }
    }
}

/// Balance card with glassmorphism
struct GlassBalanceCard: View {
    var balance: Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.ultraThinMaterial)
                .background(
                    LinearGradient(colors: [Color.purple.opacity(0.5),
                                            Color.pink.opacity(0.3)],
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                        .blur(radius: 30)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                )
                .shadow(color: Color.purple.opacity(0.3), radius: 10, x: 0, y: 6)
                .frame(height: 150)
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Available Balance")
                        .font(.footnote)
                        .foregroundColor(.white.opacity(0.8))
                    Text("₦\(String(format: "%.2f", balance))")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                    Text("Main Account")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.7))
                }
                Spacer()
                Image(systemName: "globe.europe.africa")
                    .font(.system(size: 40))
                    .foregroundColor(.white.opacity(0.3))
            }
            .padding()
        }
    }
}


struct DashboardAction: View {
    let icon: String
    let title: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 55, height: 55)
                .background(.ultraThinMaterial)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white.opacity(0.2), lineWidth: 1)
                )
            Text(title)
                .font(.caption)
                .foregroundColor(.white.opacity(0.8))
        }
    }
}

