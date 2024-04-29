//
//  AddBookView.swift
//  BookMagagementApp
//
//  Created by Zhixuan Duan on 2024/4/28.
//

import SwiftUI

struct AddBookView: View {
    @StateObject var bookViewModel: BookViewModel
    @State var bookModel: BookModel = BookModel(id: 0, title: "", author: "", publicationYear: "", isbn: "")
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Add Book")
                .font(.title3)
            List {
                HStack {
                    Text("Title:")
                    TextField("Book Title", text: $bookModel.title)
                }
                HStack {
                    Text("Author:")
                    TextField("Book Author", text: $bookModel.author)
                }
                HStack {
                    Text("ISBN:")
                    TextField("ISBN", text: $bookModel.isbn)
                }
                HStack {
                    Text("Publication Year:")
                    TextField("Publication Year", text: $bookModel.publicationYear)
                }
            }
            Button {
                bookViewModel.createBook(book: bookModel)
            } label: {
                Text("Create Book")
            }
        }
    }
}

