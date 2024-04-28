//
//  BookListView.swift
//  BookMagagementApp
//
//  Created by Zhixuan Duan on 2024/4/28.
//

import SwiftUI

struct BookListView: View {
    @StateObject var bookViewModel = BookViewModel(bookList: [])
    @State private var selectedBook: BookModel = BookModel(id: 0, title: "", author: "", publicationYear: "", isbn: "")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(bookViewModel.bookList) { book in
                    NavigationLink {
                        BookDetailView(bookModel: $selectedBook)
                    } label: {
                        BookItemView(bookModel: book)
                    }
                    .onTapGesture {
                        selectedBook = book
                    }
                }
            }
            .navigationTitle("Book Management")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink {
                    AddBookView()
                } label: {
                    Image(systemName: "plus.circle")
                }
            }
        }
    }
}

#Preview {
    BookListView()
}
