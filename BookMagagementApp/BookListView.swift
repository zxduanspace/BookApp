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
                ForEach(bookViewModel.bookList, id: \.self) { book in
                    NavigationLink {
                        BookDetailView(bookViewModel: bookViewModel, bookModel: $selectedBook)
                    } label: {
                        BookItemView(bookModel: book)
                    }
                    .onTapGesture {
                        selectedBook = book
                    }
                }
            }
            .onAppear() {
                bookViewModel.getAllBooks()
            }
            .navigationTitle("Book Management")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink {
                    AddBookView(bookViewModel: bookViewModel)
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
