//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import MapKit
import CoreLocation

// This component is an uber location search and selection view using MapKit and CoreLocation.
// It consists of a search bar, a list of search results, and an action button.
// The search results are displayed as cells with a title, subtitle, and an icon.
// The action button changes its appearance and behavior based on the current state of the view.

// MARK: - Enum Definitions

enum UberMapViewState {
    case noInput
    case searchingForLocation
    case locationSelected
}

// MARK: - Content

struct HomeView: View {
    @State private var mapState = UberMapViewState.noInput

    var body: some View {
        ZStack(alignment: .top) {
            LocationSearchView(mapState: $mapState)
            MapViewActionButton(mapState: $mapState)
                .padding(.leading)
                .padding(.top, 4)
        }
    }
}

// MARK: - LocationSearchView

struct LocationSearchView: View {
    // 1. Declare state variables for the search text and map state
    @State private var startLocationText = ""
    @Binding var mapState: UberMapViewState

    // 2. Declare an instance of the view model
    @StateObject var viewModel = LocationSearchViewModel()

    var body: some View {
        VStack {
            HStack {
                VStack {
                    Circle()
                        .fill(Color(.systemGray))
                        .frame(width: 6, height: 6)
                    Rectangle()
                        .fill(Color(.systemGray))
                        .frame(width: 1, height: 24)
                    Rectangle()
                        .fill(Color(.systemGray))
                        .frame(width: 6, height: 6)
                }
                VStack {
                    // 3. Bind the start location text field to the state variable
                    TextField("Current Location", text: $startLocationText)
                        .frame(height: 32)
                        .background(Color(.systemGroupedBackground))

                    // 4. Bind the destination text field to the view model's queryFragment property
                    TextField("Where to ?", text: $viewModel.queryFragment)
                        .frame(height: 32)
                        .background(Color(.systemGray4))
                }
            }
            .padding(.horizontal)
            .padding(.top, 64)

            Divider().padding(.vertical)

            // 5. Display search results in a scrollable list
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.results, id: \.self) { result in
                        LocationSearchResultCell(title: result.title, subTitle: result.subtitle)
                            .onTapGesture {
                                viewModel.selectLocation(searchCompletion: result) {
                                    self.mapState = .locationSelected
                                }
                            }
                    }
                }
            }
        }.background(Color(.systemBackground))
    }
}

// MARK: - LocationSearchViewModel

final class LocationSearchViewModel: NSObject, ObservableObject {
    // 1. Declare published properties for search results and selected location coordinates
    @Published var results = [MKLocalSearchCompletion]()
    @Published var selectedLocationCoordinate: CLLocationCoordinate2D?

    // 2. Initialize the search completer and bind its queryFragment to the view model's property
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment = "" {
        didSet {
            if queryFragment.isEmpty {
                results = []
            }
            searchCompleter.queryFragment = queryFragment
        }
    }

    // 3. Set the search completer delegate to the view model
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }

    // 4. Define methods for selecting a location and getting its coordinates
    func selectLocation(searchCompletion: MKLocalSearchCompletion, completionHandler: @escaping () -> Void) {
        getLocationCoordinates(searchCompletion: searchCompletion) { coordinate in
            if let coordinate = coordinate {
                self.selectedLocationCoordinate = coordinate
                completionHandler()
            }
        }
    }

    private func getLocationCoordinates(searchCompletion: MKLocalSearchCompletion, completionHandler: @escaping (CLLocationCoordinate2D?) -> Void) {
        let searchRequest = MKLocalSearch.Request(completion: searchCompletion)
        let search = MKLocalSearch(request: searchRequest)

        search.start { response, error in
            if error != nil {
                completionHandler(nil)
                return
            }

            guard let coordinate = response?.mapItems.first?.placemark.coordinate else {
                completionHandler(nil)
                return
            }

            completionHandler(coordinate)
        }
    }
}

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}

// MARK: - LocationSearchResultCell

struct LocationSearchResultCell: View {
    let title: String
    let subTitle: String

    var body: some View {
        HStack {
            // 1. Display an icon for the location
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(Color.black)
                .tint(.white)
                .frame(width: 40, height: 40)

            // 2. Display the title and subtitle of the location
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.body)
                Text(subTitle)
                    .font(.system(size: 15))
                    .foregroundColor(Color(.systemGray))
                Divider()
            }
            .padding(.leading, 8)
            .padding(.vertical, 8)
        }
        .padding(.leading)
    }
}

// MARK: - MapViewActionButton

struct MapViewActionButton: View {
    @Binding var mapState: UberMapViewState

    var body: some View {
        Button {
            withAnimation(.spring()) {
                actionForState(mapState)
            }
        } label: {
            imageForState(mapState)
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    // 1. Define the action for each state of the map view
    func actionForState(_ state: UberMapViewState) {
        switch mapState {
        case .noInput:
            print("no input")
        case .searchingForLocation, .locationSelected:
            mapState = .noInput
        }
    }

    // 2. Define the image for each state of the map view
    func imageForState(_ state: UberMapViewState) -> Image {
        switch mapState {
        case .noInput:
            return Image(systemName: "line.3.horizontal")
        case .searchingForLocation, .locationSelected:
            return Image(systemName: "arrow.left")
        }
    }
}

// MARK: - LocationManager

final class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard !locations.isEmpty else { return }
        locationManager.stopUpdatingLocation()
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
