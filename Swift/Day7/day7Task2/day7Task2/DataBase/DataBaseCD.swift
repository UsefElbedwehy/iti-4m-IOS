//
//  DataBaseCD.swift
//  day7Task2
//
//  Created by Usef on 17/01/2025.
//

import UIKit
import CoreData
class DataBaseCD {
    public static let sharedInstance = DataBaseCD()
    private var managedContex: NSManagedObjectContext!
    private var movies = [NSManagedObject]()
    private init(){
        let appDelegete = UIApplication.shared.delegate as! AppDelegate
        managedContex = appDelegete.persistentContainer.viewContext
    }
    func saveData(_ movObj: Movie) {
        let entity = NSEntityDescription.entity(forEntityName: "MovieCD", in: managedContex)
        let movie = NSManagedObject(entity: entity!, insertInto: managedContex)
        movie.setValue(movObj.id,           forKey: "id")
        movie.setValue(movObj.title,        forKey: "title")
        movie.setValue(movObj.year,         forKey: "year")
        movie.setValue(movObj.genre.joined(separator: ", "),        forKey: "genre")
        movie.setValue(movObj.rating,       forKey: "rating")
        movie.setValue(movObj.director,     forKey: "director")
        movie.setValue(movObj.actors.joined(separator: ", "),       forKey: "actors")
        movie.setValue(movObj.plot,         forKey: "plot")
        movie.setValue(movObj.poster,       forKey: "poster")
        movie.setValue(movObj.trailer,      forKey: "trailer")
        movie.setValue(movObj.runtime,      forKey: "runtime")
        movie.setValue(movObj.awards,       forKey: "awards")
        movie.setValue(movObj.country,      forKey: "country")
        movie.setValue(movObj.language,     forKey: "language")
        movie.setValue(movObj.boxOffice,    forKey: "boxOffice")
        movie.setValue(movObj.production,   forKey: "production")
        movie.setValue(movObj.website,      forKey: "website")
        do{
            try managedContex.save()
            print("[:> Saved <:], ID: \(movObj.id)")
        }catch let error {
            print(error.localizedDescription)
        }
    }
    func retrieveData() -> [Movie] {
        var tempMovies = [Movie]()
        let fetch = NSFetchRequest<NSManagedObject>(entityName: "MovieCD")
        do{
            movies.removeAll()
            movies = try managedContex.fetch(fetch)
            for item in movies {
                let tempMovie = Movie()
                tempMovie.id        = item.value(forKey: "id")          as! Int
                tempMovie.title     = item.value(forKey: "title")       as! String
                tempMovie.year      = item.value(forKey: "year")        as! Int
                tempMovie.genre.append(item.value(forKey: "genre")       as! String)
                tempMovie.rating    = item.value(forKey: "rating")      as! Double
                tempMovie.director  = item.value(forKey: "director")    as! String
                tempMovie.actors.append(item.value(forKey: "actors")      as! String)
                tempMovie.plot      = item.value(forKey: "plot")        as! String
                tempMovie.poster    = item.value(forKey: "poster")      as! String
                tempMovie.trailer   = item.value(forKey: "trailer")     as! String
                tempMovie.runtime   = item.value(forKey: "runtime")     as! Int
                tempMovie.awards    = item.value(forKey: "awards")      as! String
                tempMovie.country   = item.value(forKey: "country")     as! String
                tempMovie.language  = item.value(forKey: "language")    as! String
                tempMovie.boxOffice = item.value(forKey: "boxOffice")   as! String
                tempMovie.production = item.value(forKey: "production") as! String
                tempMovie.website   = item.value(forKey: "website")     as! String
                print("[:> fetched <:], ID: \(tempMovie.id)")
                tempMovies.append(tempMovie)
            }
        }catch let error {
            print(error.localizedDescription)
        }
        return tempMovies
    }
    func deleteAll(){
        _ = retrieveData()
        for movie in movies {
            managedContex.delete(movie)
        }
            do{
                try managedContex.save()
                print("Deleted!")
            }catch let error {
                print(error.localizedDescription)
            }
        
    }
    
}
