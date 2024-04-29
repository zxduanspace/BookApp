//
//  BookDetailView.swift
//  BookMagagementApp
//
//  Created by Zhixuan Duan on 2024/4/28.
//

import SwiftUI

struct BookDetailView: View {
    @StateObject var bookViewModel: BookViewModel
    @Binding var bookModel: BookModel
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Book Detail")
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
            HStack(alignment: .center) {
                Spacer()
                Button {
                    bookViewModel.updateBook(book: bookModel)
                } label: {
                    Text("Save")
                }
                Spacer()
                Button {
                    bookViewModel.deleteBook(id: bookModel.id)
                } label: {
                    Text("Delete")
                }
                .foregroundColor(.red)
                Spacer()
            }
        }
        .onAppear() {
            bookViewModel.getBookById(id: bookModel.id)
        }
    }
}

//#Preview {
//    BookDetailView()
//}
