//
//  CountryViewModelTests.swift
//  ios-copilot-agent-demoTests
//
//  Created by MD Siam Biswas on 5/10/25.
//

import Testing
import XCTest
@testable import ios_copilot_agent_demo

class CountryViewModelTests: XCTestCase {

    var viewModel: CountryViewModel!

    override func setUp() {
        super.setUp()
        viewModel = CountryViewModel()
        viewModel.countries = [
            Country(name: "United States", capital: "Washington, D.C.", isoCode: "US", details: "Details about the US"),
            Country(name: "Canada", capital: "Ottawa", isoCode: "CA", details: "Details about Canada"),
            Country(name: "India", capital: "New Delhi", isoCode: "IN", details: "Details about India")
        ]
        viewModel.filteredCountries = viewModel.countries
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testLoadCountries() {
        XCTAssertFalse(viewModel.countries.isEmpty, "Countries should be loaded")
    }

    func testFilterCountriesEmptySearch() {
        viewModel.searchText = ""
        XCTAssertEqual(viewModel.filteredCountries.count, viewModel.countries.count, "Filtered countries should match all countries when search text is empty")
    }

    func testFilterCountriesWithSearch() {
        viewModel.searchText = "Canada"
        XCTAssertEqual(viewModel.filteredCountries.count, 1, "Filtered countries should match the search text")
        XCTAssertEqual(viewModel.filteredCountries.first?.name, "Canada", "Filtered country should be Canada")
    }

    func testFilterCountriesNoMatch() {
        viewModel.searchText = "Nonexistent"
        XCTAssertTrue(viewModel.filteredCountries.isEmpty, "Filtered countries should be empty when no match is found")
    }

    func testSelectCountry() {
        let country = viewModel.countries.first!
        viewModel.selectCountry(country)
        XCTAssertEqual(viewModel.selectedCountry, country, "Selected country should match the one set")
    }

    func testLoadCountriesError() {
        // Simulate an error scenario by providing an invalid file name
        viewModel.loadCountries(from: "invalid_file")
        XCTAssertTrue(viewModel.countries.isEmpty, "Countries should be empty when loading fails")
    }
}
