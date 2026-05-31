import SwiftUI

struct TransactionsView: View {
    @ObservedObject var viewModel: FinanceViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.purple.opacity(0.9), Color.black],
                           startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading) {
                    Text("All Transactions")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .padding(.bottom, 15)
                    ForEach(viewModel.transactions) { transaction in
                        TransactionRow(transaction: transaction)
                    }
                }
                .padding()
            }
        }
    }
}

