//
//  HistoryView.swift
//  Geofencing
//
//  Created by measthmatic on 24/03/23.
//

import SwiftUI
import Foundation



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
                
//                Text("April")
//                    .padding(10)
//                    .foregroundColor(.white)
//                    .background(terColor2)
//                    .cornerRadius(8)
//                    .font(.system(size: 16))
            }
            .padding(EdgeInsets(top: 5, leading: 24, bottom: 8, trailing: 16))
            
                Spacer()
//            List Var
            List { 
                Section {
                    VStack(alignment: .leading) {
                        Text("\(UserDefaults.standard.string(forKey: "historyDCI") ?? "-")")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.bottom, -2.0)
                        HStack {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Clock In: ")
                                        .font(.subheadline)
                                    Text("\(UserDefaults.standard.string(forKey: "historyTCI") ?? "-")")
                                        .font(.body)
                                        .fontWeight(.bold)
                                        .foregroundColor(primBlue)
                                }
                                .padding(.vertical, 2.0)
                                HStack {
                                    Text("Clock Out: ")
                                        .font(.subheadline)
                                    Text("\(UserDefaults.standard.string(forKey: "historyTCO") ?? "-")")
                                        .font(.body)
                                        .fontWeight(.bold)
                                        .foregroundColor(primBlue)
                                }
                                .padding(.bottom, 2.0)
                            }
                            Spacer()

                            //Text Kanan
                            Text("\(attendanceStatus())")
                                .padding(8)
                                .foregroundColor(.white)
                                .background(attendanceStatusColor())
                                .cornerRadius(12)
                                .bold()
                        }
                        .padding(.all)
                        .background(.white)
                        .cornerRadius(16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                            .stroke(primBlue, lineWidth: 2))
                    }

                }
                .listSectionSeparator(.hidden)
                
           }
           .padding(.horizontal, 4.0)
           .listStyle(.plain)
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
