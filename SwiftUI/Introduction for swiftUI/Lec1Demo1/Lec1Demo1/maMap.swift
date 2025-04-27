//
//  maMap.swift
//  Lec1Demo1
//
//  Created by Usef on 09/02/2025.
//

import SwiftUI
import MapKit

struct MapViewUI: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ uiViewController: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: 29.973189629124562, longitude: 31.128094768194135)
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiViewController.setRegion(region, animated: true)
    }
}



struct maMap: View {
    var body: some View {
        MapViewUI().frame(height: 300)
    }
}

#Preview {
    maMap()
}
