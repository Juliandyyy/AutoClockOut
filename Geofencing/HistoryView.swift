//
//  HistoryView.swift
//  Geofencing
//
//  Created by measthmatic on 24/03/23.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        VStack (alignment: .leading){
            
            //History Headline
            HStack {
                NavigationLink(destination: ContentView()) {
//                    Image(systemName: "chevron.backward")
//                        .imageScale(.large)
//                        .foregroundColor(.black)
                }
                Text("History")
                    .font(.title)
                    .fontWeight(.semibold)
                
//                        .font(.system(size: 24))
                
            }
            .padding(EdgeInsets(top: 8, leading: 24, bottom: -1
                                , trailing: 8))
            
            //Pilihan Bulan
            HStack{
                Text("Januari")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(terColor2)
                    .cornerRadius(8)
                    .font(.system(size: 16))
                
                Text("Februari")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(terColor2)
                    .cornerRadius(8)
                    .font(.system(size: 16))
                
                Text("March")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(primBlue)
                    .cornerRadius(8)
                    .font(.system(size: 16))
                
                Text("April")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(terColor2)
                    .cornerRadius(8)
                    .font(.system(size: 16))
            }
            .padding(EdgeInsets(top: 5, leading: 24, bottom: 15, trailing: 16))
            
            //List Var
            List {
                Section("Thursday, 16 March 2023") {
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Clock In: ")
                                    .font(.subheadline)
                                Text("08.59 AM")
                                    .font(.body)
                                    .bold()
                                    .foregroundColor(primBlue)
                            }
                            .padding(.vertical, 2.0)
                            HStack {
                                Text("Clock Out: ")
                                    .font(.subheadline)
                                Text("-")
                                    .bold()
                            }
                            .padding(.bottom, 2.0)
                        }
                        Spacer()
                        
                        //Text Kanan
                        Text("On Time")
                            .padding(8)
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(12)
                            .bold()
                    }
                }.padding(10).listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                
                Section("Wednesday, 15 March 2023") {
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Clock In: ")
                                Text("09.30 AM")
                                    .bold()
                                    .foregroundColor(primBlue)
                            }
                            .padding(.vertical, 2.0)
                            HStack {
                                Text("Clock Out: ")
                                Text("-")
                                    .bold()
                            }
                            .padding(.bottom, 2.0)
                        }
                        Spacer()
                        
                        //Text Kanan
                        Text("Late")
                            .padding(8)
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(12)
                            .bold()
                    }
                }.padding(10).listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                
                Section("Tuesday, 14 March 2023") {
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Clock In: ")
                                Text("08.37 AM")
                                    .bold()
                                    .foregroundColor(primBlue)
                            }
                            .padding(.vertical, 2.0)
                            HStack {
                                Text("Clock Out: ")
                                Text("-")
                                    .bold()
                            }
                            .padding(.bottom, 2.0)
                        }
                        Spacer()
                        
                        //Text Kanan
                        Text("On Time")
                            .padding(8)
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(12)
                            .bold()
                    }
                }.padding(10).listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                
                Section("Monday, 13 March 2023") {
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Clock In: ")
                                Text("08.14 AM")
                                    .bold()
                                    .foregroundColor(primBlue)
                            }
                            .padding(.vertical, 2.0)
                            HStack {
                                Text("Clock Out: ")
                                Text("-")
                                    .bold()
                            }
                            .padding(.bottom, 2.0)
                        }
                        Spacer()
                        
                        //Text Kanan
                        Text("On Time")
                            .padding(8)
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(12)
                            .bold()
                    }
                }.padding(10).listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            }
        }
        
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
