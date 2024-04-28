//
//  BookViewModel.swift
//  BookMagagementApp
//
//  Created by Zhixuan Duan on 2024/4/28.
//

import Foundation

@MainActor class BookViewModel: ObservableObject {
    @Published var bookList: [BookModel]
    
    init (bookList: [BookModel]) {
        self.bookList = [
            BookModel(id: 1, title: "title1", author: "author1",publicationYear:"2000", isbn: "123-456"),
            BookModel(id: 2, title: "title2", author: "author2",publicationYear:"2001", isbn: "123-789"),
            BookModel(id: 3, title: "title3", author: "author3",publicationYear:"2002", isbn: "456-789")]
    }
}

