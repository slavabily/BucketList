//
//  Map+Circle+ButtonView.swift
//  BucketList
//
//  Created by slava bily on 11/5/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import SwiftUI
import MapKit

struct Map_Circle_ButtonView: View {
    @Binding var centerCoordinate: CLLocationCoordinate2D
    @Binding var selectedPlace: MKPointAnnotation?
    @Binding var showingPlaceDetails: Bool
    @Binding var showingEditScreen: Bool
    
    @Binding var locations: [CodableMKPointAnnotation]
    
    var body: some View {
        ZStack {
            MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annotations: locations)
                .edgesIgnoringSafeArea(.all)
            Circle()
                .fill(Color.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        let newLocation = CodableMKPointAnnotation()
                        newLocation.coordinate = self.centerCoordinate
                        newLocation.title = "Example location"
                        self.locations.append(newLocation)
                        self.selectedPlace = newLocation
                        self.showingEditScreen = true
                    }) {
                        Image(systemName: "plus")
                            .padding()
                            .background(Color.black.opacity(0.75))
                            .foregroundColor(.white)
                            .font(.title)
                            .clipShape(Circle())
                            .padding(.trailing)
                    }
                }
            }
        }
     }
}

struct Map_Circle_ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Map_Circle_ButtonView(centerCoordinate: .constant(CodableMKPointAnnotation.example.coordinate), selectedPlace: .constant(CodableMKPointAnnotation.example), showingPlaceDetails: .constant(false), showingEditScreen: .constant(false), locations: .constant([CodableMKPointAnnotation.example]))
    }
}
