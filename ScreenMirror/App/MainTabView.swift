import SwiftUI

struct MainTabView: View {
    @State var selectedTab: Tab = .home
    @ObservedObject var homeViewModel: HomeViewModel
    @StateObject var settingsVM = SettingsViewModel()   
    @State private var showEnableSheet = false
    
    var body: some View {
        ZStack {
            switch selectedTab {
            case .home:
                HomeView(viewModel: homeViewModel)
                    .environmentObject(PremiumViewModel.shared)
            case .settings:
                SettingsView(viewModel: settingsVM)
                    .environmentObject(PremiumViewModel.shared)
                    .zIndex(settingsVM.showIconMenu ? 2 : 0)
            }
            
            //Tab bar
            VStack {
                Spacer()
                CustomTabBarView(selectedTab: $selectedTab) {
                    withAnimation(.easeInOut) {
                        showEnableSheet = true
                    }
                }
            }
            
            if showEnableSheet {
                
                ZStack {
                    CustomDimmedBackdropView {
                        withAnimation {
                            showEnableSheet = false
                        }
                    }
                    
                    VStack {
                        Spacer()
                        EnableScreenMirrorSheetView {
                            withAnimation { showEnableSheet = false }
                        }
                        .transition(.move(edge: .bottom))
                    }
                    .ignoresSafeArea()
                    .zIndex(10)
                }
                .zIndex(1)
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

