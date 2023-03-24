//
//  ContentView.swift
//  Geofencing
//
//  Created by Juliandy on 21/03/23.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    var body: some View {
        
        NavigationView(){
            HomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
