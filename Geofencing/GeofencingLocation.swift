//
//  GeofencingLocation.swift
//  Geofencing
//
//  Created by measthmatic on 24/03/23.
//

import Foundation
import SwiftUI
import CoreLocation

class GeofencingLocation: NSObject, CLLocationManagerDelegate {
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.distanceFilter = 10
        
        let geoFenceRegion: CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2D(latitude: -6.3022067, longitude: 106.6521684), radius: 10, identifier: "Apple Academy")
        
        locationManager.startMonitoring(for: geoFenceRegion)
    }
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert,.badge,.sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("ERROR \(error)")
            }
            else {
                print("SUCCESS")
            }
        }
    }
    
    let locationManager: CLLocationManager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for currentLocation in locations{
            print("\(String(describing: index)):\(currentLocation)")
        }
    }
    
    //    func notification() {
    //        let region: CLLocation
    //        let clockIn = UNMutableNotificationContent()
    //                clockIn.title = ("Auto Clock In Berhasil")
    //                clockIn.subtitle = ("Ayo lakukan yang terbaik untuk hari ini, Semangat!")
    //                clockIn.sound = .default
    //                clockIn.badge = 1
    //        let triggerLocation = UNLocationNotificationTrigger(region: region, repeats: false)
    //        // request notif
    //                let request = UNNotificationRequest(
    //                    identifier: UUID().uuidString,
    //                    content: clockIn,
    //                    trigger: triggerLocation)
    //
    //                UNUserNotificationCenter.current().add(request)
    //    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("You are in", region.identifier)
        let defaults = UserDefaults.standard
        defaults.set(Date(), forKey: "currentDate")

        if let storedDate = defaults.object(forKey: "currentDate") as? Date {
            let content = UNMutableNotificationContent()
                content.title = "You have entered \(region.identifier)"
            content.body = "You are Clock In at \(storedDate.formatted(date: .numeric, time: .shortened))"
                content.sound = .default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                let request = UNNotificationRequest(identifier: "ExitRegionNotification", content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            print("Stored Dateeeee: ", storedDate)
            
            defaults.set("\(Date())", forKey: "historyDate")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("You are out from", region.identifier)
        let defaults = UserDefaults.standard
        defaults.set(Date(), forKey: "currentDate")

        if let storedDate = defaults.object(forKey: "currentDate") as? Date {
            let content = UNMutableNotificationContent()
                content.title = "You have left \(region.identifier)"
            content.body = "You are Clock Out at \(storedDate.formatted(date: .numeric, time: .shortened))"
            content.sound = .default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                let request = UNNotificationRequest(identifier: "ExitRegionNotification", content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            print("Stored Date: ", storedDate)
        }
    }
}
