import SwiftUI

struct AddTransactionView: View {
    @State private var amount: String = ""
    
    var body: some View {
        VStack(spacing: 30) {
            VStack(alignment: .leading) {
                Text("Transfer")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                Text("Available Balance: ₦35,688,000.85")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.7))
            }
            
            Text("₦\(amount.isEmpty ? "0.00" : amount)")
                .font(.system(size: 40, weight: .semibold))
                .foregroundColor(.white)
            
            Spacer()
            
            VStack(spacing: 15) {
                ForEach([["1","2","3"],["4","5","6"],["7","8","9"],["","0","⌫"]], id: \.self) { row in
                    HStack(spacing: 25) {
                        ForEach(row, id: \.self) { item in
                            Button(action: { handleTap(item) }) {
                                Text(item)
                                    .font(.title2)
                                    .frame(width: 75, height: 75)
                                    .background(Color.white.opacity(0.1))
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                            }
                        }
                    }
                }
            }
            
            Spacer()
            
            Button("Transfer ₦\(amount.isEmpty ? "0.00" : amount)") {
                amount = ""
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(12)
            .padding(.horizontal)
        }
        .padding()
        .background(
            LinearGradient(colors: [Color.purple.opacity(0.9), Color.black],
                           startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
        )
    }
    
    private func handleTap(_ item: String) {
        switch item {
        case "⌫": if !amount.isEmpty { amount.removeLast() }
        case "": break
        default: amount.append(item)
        }
    }
}

