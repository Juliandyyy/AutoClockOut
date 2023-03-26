//
//  HomeView.swift
//  Geofencing
//
//  Created by measthmatic on 24/03/23.
//

import SwiftUI

struct HomeView: View {
    @State private var play = true
    
    //untuk buat jam
    var timeSt: String{
        let jam = DateFormatter()
        jam.dateFormat = "HH:mm"
        return jam.string(from: Date())
    }
    
    //untuk buat tanggal
    var dateSt: String{
        let tanggal = DateFormatter()
        tanggal.dateFormat = "EEEE, dd MMMM yyyy"
        return tanggal.string(from: Date())
    }
    
    var body: some View {
        
        //untuk animasi loop
        ZStack {
            LottiePlusView(name: Constants.radarBlue,
                    loopMode: .loop,
                    animationSpeed: 1,
                    contentMode: .scaleAspectFill,
                    play: $play)
            
            VStack{
                //bagian atas
                HStack {
                    //kiri
                    VStack (alignment: .leading){
                        Text("Hi, Juliandy!")
                            .fontWeight(.bold)
                            .font(.system(size: 32))
                            .foregroundColor(primBlue)
                        Text("from Morning Session")
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                        //Spacer()
                    }
                    .padding(EdgeInsets(top: 28, leading: 16, bottom: 8, trailing: 16))
                    
                    Spacer()
                    
                    //kanan
                    NavigationLink(destination: HistoryView()) {
                        Image(systemName: "clock.arrow.circlepath")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 36, height: 36)
                                    .imageScale(.large)
                                    .foregroundColor(primBlue)
                                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
                            }
                        }
                    
                    Spacer()
                    
                    //bagian tengah
                    ZStack{
    //                    Ellipse()
    //                        .fill(.blue)
    //                        .frame(width: 200, height: 200)
                        VStack {
                            Image(systemName: "location.fill")
                                .resizable()
                                .imageScale(.small)
                                .scaledToFit()
                                .frame(width: 36, height: 36)
                                .foregroundColor(.white)
                            
                            Text("You are in \nAcademy")
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding(/*@START_MENU_TOKEN@*/.horizontal, 64.0/*@END_MENU_TOKEN@*/)
                                .scaledToFit()
                                .font(.system(size: 28))
                                .bold()
                        }
                        .padding()
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading){
                        //atas buat tanggal
                        HStack{
                            Text("\(Date().formatted(date: .complete, time: .omitted))")
                                .fontWeight(.semibold)
                                .font(.system(size: 16))
                        }
                        .padding(EdgeInsets(top: 8, leading: 32, bottom: -8, trailing: 16))
                        
                        //bawah buat jam clock in clock out
                        HStack {
                            //Text Kiri
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Clock In: ")
                                    
                                    Text("\(UserDefaults.standard.string(forKey: "historyTCI") ?? "-")")
                                        .fontWeight(.bold)
                                        .foregroundColor(primBlue)
                                }
                                .padding(.bottom, 0.25)
                                HStack {
                                    Text("Clock Out: ")
                                        
                                    Text("\(UserDefaults.standard.string(forKey: "historyTCO") ?? "-")")
                                        .fontWeight(.bold)
                                        .foregroundColor(primBlue)
                                }
                                .padding(.bottom, 1.0)
                            }
                            .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                            Spacer()
                            
                            //Text Kanan
                            HStack {
                                Text("\(attendanceStatus())")
                                    .padding(8)
                                    .foregroundColor(.white)
                                    .background(attendanceStatusColor())
                                    .cornerRadius(12)
                                    .bold()
                            }
                            .padding(.trailing, 16)
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(primBlue, lineWidth: 2)
                        )
                        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    }
                }
            .padding(EdgeInsets(top: 8, leading: 10, bottom: -12, trailing: 10))
        }
        }
    }

    //buat status attendance
    func attendanceStatus() -> String {
        let currentTime = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: currentTime)
        
        
        if hour > 7 && hour < 9 {
            return "Ontime"
        } else if hour > 9 {
            return "Late"
        } else if hour < 7 {
            return "Invalid Hour"
        }
        return ""
    }

    //buat status attendance color
    func attendanceStatusColor() -> Color {
        let currentTime = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: currentTime)
        
        
        if hour > 7 && hour < 9 {
            return .green
        } else if hour > 9 {
            return .red
        } else if hour < 7 {
            return .yellow
        }
        return .white
    }

    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
