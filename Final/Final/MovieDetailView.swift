import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let url = movie.posterURL {
                    AsyncImage(url: url) { image in
                        image.resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(maxWidth: .infinity)
                    .scaledToFit()
                }
                Text(movie.title)
                    .font(.title)
                    .padding(.bottom, 4)
                Text(movie.overview)
                    .font(.body)
                if let date = movie.releaseDate {
                    HStack {
                        Text("Fecha de lanzamiento:")
                        Spacer()
                        Text(date)
                    }
                }
                HStack {
                    Text("Puntaje:")
                    Spacer()
                    Text(String(format: "%.1f", movie.voteAverage))
                }
            }
            .padding()
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MovieDetailView(movie: Movie(id: 0, title: "Titulo", overview: "Descripcion", posterPath: nil, releaseDate: "2025-01-01", voteAverage: 0.0))
}
