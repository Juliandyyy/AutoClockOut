//
//  HomeView.swift
//  Geofencing
//
//  Created by measthmatic on 24/03/23.
//

import SwiftUI

struct HomeView: View {
    @State private var play = true
    
    var timeSt: String{
        let jam = DateFormatter()
        jam.dateFormat = "HH:mm"
        return jam.string(from: Date())
    }
    var dateSt: String{
        let tanggal = DateFormatter()
        tanggal.dateFormat = "EEEE, dd MMMM yyyy"
        return tanggal.string(from: Date())
    }
    
    var body: some View {
        
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
                        //atas
                        HStack{
                            Text("\(dateSt)")
                                .fontWeight(.semibold)
                                .font(.system(size: 16))
                        }
                        .padding(EdgeInsets(top: 8, leading: 32, bottom: -8, trailing: 16))
                        
                        //bawah
                        HStack {
                            //Text Kiri
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Clock In: ")
                                    
                                    Text("\(timeSt)")
                                        .fontWeight(.bold)
                                        .foregroundColor(primBlue)
                                }
                                .padding(.bottom, 0.25)
                                HStack {
                                    Text("Clock Out: ")
                                    Text("-")
                                        .bold()
                                }
                                .padding(.bottom, 1.0)
                            }
                            .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                            Spacer()
                            
                            //Text Kanan
                            HStack {
                                Text("On Time")
                                    .padding(8)
                                    .foregroundColor(.white)
                                    .background(Color.green)
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
    
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
