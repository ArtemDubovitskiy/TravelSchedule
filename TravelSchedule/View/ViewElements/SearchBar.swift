//
//  SearchBar.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 19.05.2024.
//
import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @State var isSearching: Bool = false
    // TODO: Добавить локализацию
    var placeholder = "Введите запрос"
    
    var body: some View {
        HStack (spacing: 0) {
            HStack (spacing: 0) {
                HStack {
                    TextField(placeholder, text: $searchText)
                        .font(.system(size: 17))
                        .padding(.leading, 8)
                        .autocorrectionDisabled(true)
                        .autocapitalization(.none)
                }
                .padding()
                .cornerRadius(16)
                .padding(.horizontal)
                .onTapGesture(perform: {
                    isSearching = true
                })
                .overlay(
                    HStack {
                        Image.magnifyingGlass
                            .resizable()
                            .frame(width: 17, height: 17)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        if isSearching && searchText.count > 0 {
                            Button(action: { searchText = "" }, label: {
                                Image.circleXmark
                                    .foregroundColor(.gray)
                                    .padding(.vertical)
                            })
                            
                        }
                        
                    }.padding(.horizontal, 10)
                        .foregroundColor(.gray)
                )
            }
            .frame(height: 36)
            .background(.ypLightGrayBar)
            .cornerRadius(10)
        }
        .frame(height: 52)
        .padding(.horizontal, 16)
    }
}
