//
//  Bible.swift
//  API GET & Picler View
//
//  Created by Ryan Lin on 2023/3/5.
//

import Foundation

struct Bible {
    let bookName: String
    let chapters: [Chapter]
}

struct Chapter {
    let chapterNo: String
    let verses:[String]
}
