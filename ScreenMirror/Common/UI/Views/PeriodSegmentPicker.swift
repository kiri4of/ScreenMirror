import SwiftUI

enum Period: String, CaseIterable {
    case year = "Year"
    case week = "Week"
}

struct PeriodSegmentedPicker: View {
    @Binding var selection: Period
    
    private let highlightGradient = LinearGradient(
        colors: [
            Color(red: 78/255, green: 75/255, blue: 75/255, opacity: 0.8),  // светлее слева
            Color(red: 41/255, green: 37/255, blue: 38/255, opacity: 0.8)   // темнее справа
        ],
        startPoint: .top,
        endPoint: .bottom
    )
    
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width / CGFloat(Period.allCases.count)
            
            ZStack(alignment: .leading) {
                // фон всей капсулы
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(red: 11/255, green: 11/255, blue: 11/255))
                
                // подсветка под выбранным сегментом
                highlightGradient
                    .clipShape(
                        RoundedRectangle(cornerRadius: 20)
                    )
                    .frame(width: width)
                    .offset(x: CGFloat(index(of: selection)) * width)
                    .animation(.easeInOut(duration: 0.25), value: selection)
                
                // сами кнопки
                HStack(spacing: 0) {
                    ForEach(Period.allCases, id: \.self) { period in
                        Text(period.rawValue)
                            .fontWeight(.semibold)
                            .foregroundColor(selection == period ? .white : .gray)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                if selection != period {
                                    selection = period
                                }
                            }
                    }
                }
            }
        }
        .frame(height: 50)          // высота капсулы
        .clipShape(RoundedRectangle(cornerRadius: 20))       // обрезаем всё под капсулу
    }
    
    // утилита для вычисления индекса
    private func index(of period: Period) -> Int {
        Period.allCases.firstIndex(of: period) ?? 0
    }
}
