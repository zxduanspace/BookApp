//
//  BookListView.swift
//  BookMagagementApp
//
//  Created by Zhixuan Duan on 2024/4/28.
//

import SwiftUI

struct BookListView: View {
    @StateObject var bookViewModel = BookViewModel(bookList: [])
    
    var body: some View {
        NavigationView {
            List {
                ForEach(bookViewModel.bookList) { book in
                    NavigationLink {
                        EmptyView()
                    } label: {
                        BookItemView(bookModel: book)
                    }
                }
            }
            .navigationTitle("Book Management")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    BookListView()
}
