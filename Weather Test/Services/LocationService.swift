//
//  LocationService.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 11/08/26.
//

import Foundation
import CoreLocation
import MapKit

@Observable
final class LocationService: NSObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    private var continuation: CheckedContinuation<CLLocation, Error>?

    private(set) var authorizationStatus: CLAuthorizationStatus
    private(set) var lastLocation: CLLocation?

    override init() {
        authorizationStatus = manager.authorizationStatus
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyKilometer
    }

    func requestCurrentLocation() async throws -> CLLocationCoordinate2D {
        if let lastLocation {
            return lastLocation.coordinate
        }

        let location = try await withCheckedThrowingContinuation { continuation in
            self.continuation = continuation

            switch manager.authorizationStatus {
                case .notDetermined:
                    manager.requestWhenInUseAuthorization()
                case .denied, .restricted:
                    continuation.resume(throwing: LocationError.permissionDenied)
                    self.continuation = nil
                default:
                    manager.requestLocation()
            }
        }

        print("Latitude: \(location.coordinate.latitude), Longitude: \(location.coordinate.longitude)")

        return location.coordinate
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus

        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            if continuation != nil {
                manager.requestLocation()
            }
        case .denied, .restricted:
            if let continuation {
                continuation.resume(throwing: LocationError.permissionDenied)
                self.continuation = nil
            }
        default:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        lastLocation = location

        if let continuation {
            continuation.resume(returning: location)
            self.continuation = nil
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if let continuation {
            continuation.resume(throwing: error)
            self.continuation = nil
        }
    }

    func currentCity() async throws -> String {
        let coordinate = try await requestCurrentLocation()

        let location = CLLocation(
            latitude: coordinate.latitude,
            longitude: coordinate.longitude
        )

        guard let request = MKReverseGeocodingRequest(location: location) else {
            throw LocationError.locationNotFound
        }

        let mapItems = try await request.mapItems

        guard let mapItem = mapItems.first,
              let city = mapItem.addressRepresentations?.cityName else {
            throw LocationError.locationNotFound
        }

        print(mapItems.first ?? "Error in mapItems")

        return city
    }
}
