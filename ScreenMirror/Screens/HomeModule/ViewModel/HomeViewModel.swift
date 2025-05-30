
import Foundation

class HomeViewModel: ObservableObject {
    @Published var showPaywall = false
    
    var data = [
        Category(id: 0, text: "Photo", image: "photoImage"),
        Category(id: 1, text: "Video", image: "videoImage"),
        Category(id: 2, text: "Safari", image: "safariImage"),
        Category(id: 3, text: "Files", image: "filesImage")
    ]
}

