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
        ViewController.instance.requestAuthorization()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        WindowGroup {
            MyViewControllerWrapper()
        }
    }
}


struct MyViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        // Update view controller if needed
    }
}
