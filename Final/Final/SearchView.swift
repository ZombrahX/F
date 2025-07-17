import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.movies) { movie in
                NavigationLink(destination: MovieDetailView(movie: movie)) {
                    HStack(alignment: .top, spacing: 8) {
                        if let url = movie.posterURL {
                            AsyncImage(url: url) { image in
                                image.resizable()
                            } placeholder: {
                                Color.gray
                            }
                            .frame(width: 80, height: 120)
                            .cornerRadius(6)
                        }
                        VStack(alignment: .leading, spacing: 4) {
                            Text(movie.title)
                                .font(.headline)
                            Text(movie.overview)
                                .font(.subheadline)
                                .lineLimit(3)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Buscar Películas")
            .searchable(text: $viewModel.query, prompt: "Nombre de la película")
            .onSubmit(of: .search) {
                Task { await viewModel.search() }
            }
        }
    }
}

#Preview {
    SearchView()
}
