//
//  DataModel.swift
//  Placeholder
//
//  Created by Lucas Clahar on 9/11/20.
//  Copyright © 2020 Tsahai Clahar. All rights reserved.
//

import Foundation

struct Data: Decodable {
    var albumId: Int?
    var id: Int?
    var title: String?
    var url: String?
    var thumbnailUrl: String?
}
