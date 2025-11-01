import SwiftUI

struct TopRatedHorizontalListView: View {
    let header: String
    var titles: [Title]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .font(.title)
                .bold()
                .padding(.horizontal, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(Array(titles.enumerated()), id: \.element.id) { index, title in
                        ZStack(alignment: .bottomLeading) {
                            // Large translucent number behind poster
                            Text("\(index + 1)")
                                .font(.system(size: 130, weight: .heavy))
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [.gray.opacity(0.3), .gray.opacity(0.1)],
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .overlay(
                                    Text("\(index + 1)")
                                        .font(.system(size: 130, weight: .heavy))
                                        .foregroundColor(.black.opacity(0.3))
                                )
                                .offset(x: -30, y: 40)
                            
                            // Poster overlapping the number
                            AsyncImage(url: URL(string: title.posterPath ?? "")) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 120, height: 180)
                            .shadow(radius: 5)
                            .offset(x: 30) // moves image right over the number
                        }
                        .frame(width: 160, height: 200)
                    }
                }
                .padding(.horizontal, 10)
            }
        }
        .padding(.vertical)
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    TopRatedHorizontalListView(header: "Top 10 Movies", titles: Title.previewTitles)
}

