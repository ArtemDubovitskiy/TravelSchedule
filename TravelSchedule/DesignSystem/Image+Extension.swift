//
//  Image.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 06.05.2024.
//
import SwiftUI

extension Image {
    // Images from Figma
    static let settingsTab = Image("Settings").renderingMode(.template)
    static let schuedleTab = Image("Schedule").renderingMode(.template)
    
    // SF Symbols
    static let radioButtonOn = Image(systemName: "record.circle")
    static let radioButtonOff = Image(systemName: "circle")
    
    static let checkBoxOn = Image(systemName: "checkmark.square.fill")
    static let checkBoxOff = Image(systemName: "square")
    
    static let chevronForward = Image(systemName: "chevron.forward")
    static let chevronBackward = Image(systemName: "chevron.backward")

    static let changeImage = Image(systemName: "arrow.2.squarepath")
    static let closeImage = Image(systemName: "multiply.circle.fill").renderingMode(.original)
    
    static let magnifyingGlass = Image(systemName: "magnifyingglass")
    static let circleXmark = Image(systemName: "xmark.circle.fill")
}
