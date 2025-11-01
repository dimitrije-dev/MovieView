import SwiftUI

struct HorizontalListView: View {
    let header: String
    var titles: [Title]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .font(.title)
                .padding(.horizontal, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 10) {
                    ForEach(Array(titles.enumerated()), id: \.element.id) { index, title in
                        ZStack(alignment: .bottomLeading) {
                            AsyncImage(url: URL(string: title.posterPath ?? "")) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 120, height: 200)
                            
                            // Netflix-style number
                            Text("\(index + 1)")
                                .font(.system(size: 45, weight: .semibold))
                                .foregroundColor(.gray.opacity(0.8))
                                .shadow(radius: 10)
                                .padding(8)
                                
                        }
                    }
                }
                .padding(.horizontal, 10)
            }
        }
        .frame(height: 250)
    }
}
#Preview {
    HorizontalListView(header: "Test", titles: Title.previewTitles)
}
