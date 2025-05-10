import Foundation

/// Represents a country with its details.
struct Country: Codable, Identifiable, Equatable {
    /// Unique identifier for the country.
    let id = UUID()
    /// Name of the country.
    let name: String
    /// Capital city of the country.
    let capital: String
    /// ISO code of the country.
    let isoCode: String
    /// Additional details about the country.
    let details: String

    enum CodingKeys: String, CodingKey {
        case name
        case capital
        case isoCode = "iso_code"
        case details
    }
}
