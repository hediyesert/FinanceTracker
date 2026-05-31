import SwiftUI

struct TransactionRow: View {
    var transaction: Transaction
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(transaction.name)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(transaction.type)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.6))
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("\(transaction.amount > 0 ? "+" : "")₦\(String(format: "%.0f", transaction.amount))")
                    .foregroundColor(transaction.amount > 0 ? .green : .red)
                    .bold()
                Text(transaction.date)
                    .font(.caption2)
                    .foregroundColor(.white.opacity(0.5))
            }
        }
        .padding(.vertical, 8)
    }
}

