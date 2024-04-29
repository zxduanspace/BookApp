//
//  BookViewModel.swift
//  BookMagagementApp
//
//  Created by Zhixuan Duan on 2024/4/28.
//

import Foundation

class BookViewModel: ObservableObject {
    @Published var bookList: [BookModel] = []
    let urlString: String = "http://localhost:8080/books"
    
    init (bookList: [BookModel]) {
        self.bookList = [
            BookModel(id: 1, title: "title1", author: "author1",publicationYear:"2000", isbn: "123-456"),
            BookModel(id: 2, title: "title2", author: "author2",publicationYear:"2001", isbn: "123-789"),
            BookModel(id: 3, title: "title3", author: "author3",publicationYear:"2002", isbn: "456-789")]
    }
    
    func getAllBooks() {
        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }

            guard let data = data else {
                return
            }

            do {
                let books = try JSONDecoder().decode([BookModel].self, from: data)
                self.bookList = books
            } catch {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }
    
    func getBookById(id: Int64) {
        var request = URLRequest(url: URL(string: urlString + "/\(id)")!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }

            guard let data = data else {
                return
            }

            do {
                let book = try JSONDecoder().decode(BookModel.self, from: data)
                print("Successful get book: \(book)")
            } catch {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }
    
    func createBook(book: BookModel) {
        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(book)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }

            guard let data = data else {
                return
            }

            do {
                let book = try JSONDecoder().decode(BookModel.self, from: data)
                print("Successful created book: \(book)")
                self.getAllBooks()
            } catch {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }
    
    func updateBook(book: BookModel) {
        var request = URLRequest(url: URL(string: urlString + "/\(book.id)")!)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(book)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }

            guard let data = data else {
                return
            }

            do {
                let book = try JSONDecoder().decode(BookModel.self, from: data)
                print("Successful updated book: \(book)")
                self.getAllBooks()
            } catch {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }
    
    func deleteBook(id: Int64) {
        var request = URLRequest(url: URL(string: urlString + "/\(id)")!)
        request.httpMethod = "DELETE"
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            self.getAllBooks()
        }.resume()
    }
    
}

