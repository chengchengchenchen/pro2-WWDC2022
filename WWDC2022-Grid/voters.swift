//
//  voters.swift
//  WWDC2022-Grid
//
//  Created by qjc on 2023/6/11.
//

import SwiftUI

struct Voters: Identifiable, Equatable {
    let type: String
    let color: Color
    var votes: Int = 0
    var id: String { type }
}


