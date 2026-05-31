import SwiftUI

struct MainTabView: View {
    @StateObject var viewModel = FinanceViewModel()
    
    var body: some View {
        TabView {
            DashboardView(viewModel: viewModel)
                .tabItem { Label("Home", systemImage: "house.fill") }
            
            TransactionsView(viewModel: viewModel)
                .tabItem { Label("Transactions", systemImage: "list.bullet") }
            
            AddTransactionView()
                .tabItem { Label("Add", systemImage: "plus.circle.fill") }
            
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person.fill") }
        }
        .accentColor(.white)
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

