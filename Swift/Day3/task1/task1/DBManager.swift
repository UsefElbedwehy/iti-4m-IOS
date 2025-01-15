//
//  DBManager.swift
//  task1
//
//  Created by Uef on 14/01/2025.
//

import Foundation
import SQLite3

class DBManager {
    public static let dBMangerSharedInstance = DBManager()
    let dataPath: String = "MyDB"
    private var db: OpaquePointer?
    
    private init(){
            db = openDatabase()
            createMovieTable()
        }
    func openDatabase() -> OpaquePointer? {
        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(dataPath)
        print("\(filePath)")
        var db: OpaquePointer? = nil
        if sqlite3_open(filePath.path(), &db) != SQLITE_OK {
            print("Cannot open DB.")
            return nil
        }else{
            print("DB successfully created.")
            return db
        }
    }
    
    func createMovieTable() {
        let createTableString = """
                    CREATE TABLE IF NOT EXISTS Movie (
                        title TEXT PRIMARY KEY,
                        rating REAL,
                        releaseYear INTEGER,
                        genre TEXT,
                        image TEXT
                    );
                """
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
                    if sqlite3_step(createTableStatement) == SQLITE_DONE {
                        print("Movie table is created successfully.")
                    } else {
                        print("Movie table creation failed.")
                    }
                } else {
                    print("Movie table creation failed.")
                }

                sqlite3_finalize(createTableStatement)
    }
    
    func insertMovie(_ movie: Movie) -> Bool{
            let movies = getAllMovies()
            for moviee in movies{
                if movie.title == moviee.title {
                    return false
                }
            }
            
            let insertStatementString = "INSERT INTO Movie (title, rating, releaseYear, genre, image) VALUES (?, ?, ?, ?, ?);"
            var insertStatement: OpaquePointer? = nil
            
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                sqlite3_bind_text(insertStatement,   1, (movie.title as NSString).utf8String, -1, nil)
                sqlite3_bind_double(insertStatement, 2, movie.rating)
                sqlite3_bind_int(insertStatement,    3, Int32(movie.releaseYear))
                sqlite3_bind_text(insertStatement,   4, (movie.genre as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement,   5, (movie.image as NSString).utf8String, -1, nil)

                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    print("Movie is created successfully.")
                    sqlite3_finalize(insertStatement)
                    return true
                } else {
                    print("Could not add.")
                    return false
                }
            } else {
                print("INSERT statement is failed.")
                return false
            }
        }
    
    func getAllMovies() -> [Movie] {
            let queryStatementString = "SELECT * FROM Movie;"
            var queryStatement: OpaquePointer? = nil
        var movies : [Movie] = []
            if sqlite3_prepare_v2(db,  queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
                while sqlite3_step(queryStatement) == SQLITE_ROW {
                    let title = String(describing: String(cString: sqlite3_column_text(queryStatement, 0)))
                    let rating = sqlite3_column_double(queryStatement, 1)
                    let rYear = sqlite3_column_int(queryStatement, 2)
                    let genre = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                    let imgUrl = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                    
                    movies.append(Movie(title: title, rating: Double(rating), releaseYear: Int(rYear), genre: genre, image: imgUrl))
                    print("Movie Details:")
                    print("\(title) | \(rating) | \(rYear) | \(genre) | \(imgUrl)")
                }
            } else {
                print("SELECT statement is failed.")
            }
            sqlite3_finalize(queryStatement)
        return movies
        }
    
    func updateMovie(movie: Movie) -> Bool{
        let updateStatementString = "UPDATE Movie SET rating = ?, releaseYear = ?, genre = ?, image = ? WHERE title = ?;"
        var updateStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK {
            sqlite3_bind_double(updateStatement, 1, movie.rating)
            sqlite3_bind_int(updateStatement,    2, Int32(movie.releaseYear))
            sqlite3_bind_text(updateStatement,   3, (movie.genre as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateStatement,   4, (movie.image as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateStatement,   5, (movie.title as NSString).utf8String, -1, nil)
            
            if sqlite3_step(updateStatement) == SQLITE_DONE {
                print("Movie updated successfully.")
                sqlite3_finalize(updateStatement)
                return true
            } else {
                print("Failed to update movie.")
                return false
            }
        } else {
            print("Failed to prepare update statement.")
            return false
        }
    }
    
    
}
