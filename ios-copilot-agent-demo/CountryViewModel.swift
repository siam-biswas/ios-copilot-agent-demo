import Foundation

/// ViewModel for managing and filtering country data.
class CountryViewModel: ObservableObject {
    /// List of all countries loaded from the JSON file.
    @Published var countries: [Country] = []
    /// Search text used to filter the list of countries.
    @Published var searchText: String = "" {
        didSet {
            filterCountries()
        }
    }
    /// List of countries filtered based on the search text.
    @Published var filteredCountries: [Country] = []
    /// The currently selected country.
    @Published var selectedCountry: Country?

    /// Initializes the ViewModel and loads the country data.
    init() {
        loadCountries()
    }

    /// Loads country data from a JSON file in the app bundle.
    /// - Parameter fileName: The name of the JSON file (default is "countries").
    func loadCountries(from fileName: String = "countries") {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            print("Failed to locate \(fileName).json in bundle.")
            countries = []
            filteredCountries = []
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decodedCountries = try JSONDecoder().decode([Country].self, from: data)
            self.countries = decodedCountries
            self.filteredCountries = decodedCountries
        } catch {
            print("Failed to decode \(fileName).json: \(error.localizedDescription)")
            countries = []
            filteredCountries = []
        }
    }

    /// Filters the list of countries based on the search text.
    private func filterCountries() {
        if searchText.isEmpty {
            filteredCountries = countries
        } else {
            filteredCountries = countries.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

    /// Sets the selected country.
    /// - Parameter country: The country to select.
    func selectCountry(_ country: Country) {
        selectedCountry = country
    }
}
