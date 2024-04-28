//
//  Book.swift
//  BookMagagementApp
//
//  Created by Zhixuan Duan on 2024/4/28.
//

import Foundation

struct BookModel: Identifiable {
    var id: Int64
    var title: String
    var author: String
    var publicationYear: String
    var isbn: String
}
