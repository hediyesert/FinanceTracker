import Foundation

struct Transaction: Identifiable {
    let id = UUID()
    let name: String
    let type: String   // "Transfer", "Deposit", "Withdraw"
    let amount: Double
    let date: String
}

