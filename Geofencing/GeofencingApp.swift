//
//  GeofencingApp.swift
//  Geofencing
//
//  Created by Juliandy on 21/03/23.
//

import SwiftUI

@main
struct GeofencingApp: App {
    
    init() {
        //ViewController.instance.requestAuthorization()
        let geofencingLocation = GeofencingLocation()
        geofencingLocation.requestAuthorization()
        
    }
    
    var body: some Scene {
//        WindowGroup {
//            MyViewControllerWrapper()
//        }
        WindowGroup {
            ContentView()
            
        }
    }
}
