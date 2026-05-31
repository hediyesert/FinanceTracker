import Foundation
import Combine

final class FinanceViewModel: ObservableObject {
    @Published var balance: Double = 35688000.85
    
    @Published var transactions: [Transaction] = [
        Transaction(name: "Hameed Yusuf", type: "Transfer", amount: -4500, date: "20 min ago"),
        Transaction(name: "Esther Joel", type: "Deposit", amount: 4500, date: "12 July 2024"),
        Transaction(name: "Card Withdrawal", type: "Withdraw", amount: -4600, date: "13 July 2024")
    ]
    
    @Published var contacts: [String] = ["Linda", "James", "Aleeah", "Bradley", "Anthony"]
}
