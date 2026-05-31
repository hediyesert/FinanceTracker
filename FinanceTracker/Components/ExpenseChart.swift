import SwiftUI

struct ExpenseChart: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.purple.opacity(0.2))
            .frame(height: 120)
            .overlay(Text("Expense Chart Placeholder")
                        .foregroundColor(.white.opacity(0.6)))
    }
}

