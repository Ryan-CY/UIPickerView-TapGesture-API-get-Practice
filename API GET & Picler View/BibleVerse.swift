//
//  BibleVerse.swift
//  API GET & Picler View
//
//  Created by Ryan Lin on 2023/3/5.
//

import Foundation

struct BibleVerse: Decodable {
    let reference: String
    let text: String
    let translation_id: String
}
