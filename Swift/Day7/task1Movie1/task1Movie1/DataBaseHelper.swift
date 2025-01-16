//
//  DataBaseHelper.swift
//  task1Movie1
//
//  Created by Usef on 16/01/2025.
//

import UIKit
import CoreData
class DataBaseHelper: NSObject {
    public static var dBSharedInstance = DataBaseHelper()
    private       var managedContex: NSManagedObjectContext!
    private       var movies       : [NSManagedObject] = []
    private override init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContex = appDelegate.persistentContainer.viewContext
    }
    func saveData(_ movObj: Movie1) {
        let entity = NSEntityDescription.entity(forEntityName: "Movie", in: managedContex)
        let movie  = NSManagedObject(entity: entity!, insertInto: managedContex)
        movie.setValue(movObj.title,       forKey: "title")
        movie.setValue(movObj.rating,      forKey: "rating")
        movie.setValue(movObj.releaseYear, forKey: "releaseYear")
        movie.setValue(movObj.image,       forKey: "img")
        movie.setValue(movObj.genre,       forKey: "genre")
        do{
            try managedContex.save()
            print("[:> Saved <:]")
        }catch let error{
            print(error)
        }
    }
    func fetchData() -> [Movie1] {
        var tempArr = [Movie1]()
        let fetch = NSFetchRequest<NSManagedObject>(entityName: "Movie")
        do{
            movies = try managedContex.fetch(fetch)
            for item in movies{
                let tempMovie1Obj = retrieveSingleObjData(item)
                tempArr.append(tempMovie1Obj)
                printData(tempMovie1Obj)
            }
        }catch let error
        {
            print(error.localizedDescription)
        }
        return tempArr
    }
    private func retrieveSingleObjData(_ item: NSManagedObject) -> Movie1 {
        let movieObj = Movie1()
        movieObj.title       = item.value(forKey: "title")       as! String
        movieObj.rating      = item.value(forKey: "rating")      as! Double
        movieObj.releaseYear = item.value(forKey: "releaseYear") as! Int
        movieObj.genre       = item.value(forKey: "genre")       as! String
        movieObj.image       = item.value(forKey: "img")         as! String
        return movieObj
    }
    private func printData(_ movieObj: Movie1) {
        print("--------------------")
        print(movieObj.title)
        print(movieObj.rating)
        print(movieObj.releaseYear)
        print(movieObj.genre)
        print(movieObj.image)
    }
}
