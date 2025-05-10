import SwiftUI

/// A view that displays detailed information about a country.
struct CountryDetailView: View {
    /// The country to display details for.
    let country: Country

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(country.name)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Capital: \(country.capital)")
                .font(.title2)

            Text("ISO Code: \(country.isoCode)")
                .font(.title3)

            Text(country.details)
                .font(.body)

            Spacer()
        }
        .padding()
        .navigationTitle(country.name)
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    /// A preview of the `CountryDetailView` with sample data.
    static var previews: some View {
        CountryDetailView(country: Country(name: "Sample Country", capital: "Sample Capital", isoCode: "SC", details: "Sample details about the country."))
    }
}
