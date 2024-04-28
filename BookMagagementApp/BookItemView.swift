//
//  BookItemView.swift
//  BookMagagementApp
//
//  Created by Zhixuan Duan on 2024/4/28.
//

import SwiftUI

struct BookItemView: View {
    var bookModel: BookModel
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "book")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.blue)
                    .padding(5)
                VStack(alignment: .leading) {
                    HStack {
                        Text(bookModel.title)
                            .font(.title)
                            .fontWeight(.medium)
                        Text(bookModel.author)
                            .font(.title2)
                            
                    }
                    HStack {
                        Text(bookModel.isbn)
                            .font(.caption)
                            .foregroundColor(.gray)
                        Spacer()
                        Text(bookModel.publicationYear)
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
    }
}

