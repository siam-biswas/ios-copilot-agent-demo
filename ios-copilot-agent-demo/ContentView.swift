//
//  ContentView.swift
//  ios-copilot-agent-demo
//
//  Created by MD Siam Biswas on 5/10/25.
//

import SwiftUI

/// The main view displaying a list of countries.
struct ContentView: View {
    /// The ViewModel managing the country data.
    @StateObject private var viewModel = CountryViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.filteredCountries) { country in
                NavigationLink(destination: CountryDetailView(country: country)) {
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(country.name)
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text(country.capital)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Text(country.isoCode)
                            .font(.body)
                            .foregroundColor(.blue)
                            .padding(8)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(8)
                    }
                    .padding(.vertical, 8)
                }
            }
            .searchable(text: $viewModel.searchText)
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Country List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    /// A preview of the `ContentView`.
    static var previews: some View {
        ContentView()
    }
}
