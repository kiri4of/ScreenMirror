

import SwiftUI

struct PayWallView: View {
    @ObservedObject var viewModel: PayWallViewModel

    var body: some View {
        Group {
            if PremiumViewModel.shared.paywallType == 1 {
                PayWallType1View(viewModel: viewModel)
            } else {
                PayWallType2View(viewModel: viewModel)
            }
        }
    }
}
