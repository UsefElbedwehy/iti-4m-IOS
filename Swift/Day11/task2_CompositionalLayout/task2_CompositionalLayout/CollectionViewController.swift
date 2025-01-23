//
//  CollectionViewController.swift
//  task2_CompositionalLayout
//
//  Created by Usef on 21/01/2025.
//

import UIKit

private let reuseIdentifier = "cell"

class CollectionViewController: UICollectionViewController {

    let foodCategoriesLB = [
        "Burgers","Pizza","Sea Food",
        "Italian","Chinese","Vegetable",
        "Fruits","Dessert" ,"Grocery"]
    let foodCategoriesImg = [
        "burger.png","pizza.png","lobster.png",
        "pasta.png","chinese.png","carrot.png",
        "watermelon.png","donut.png","grocery.png"]
    
    let adsImg = [
        "s1.png","s4.png","s5.png",
        "s6.png","s7.png"]
    
    let menuImg = [
        "a1.jpeg","q1.jpeg",
        "q2.jpeg","q3.jpeg",
        "q4.jpeg","q5.jpeg",
        "q6.jpeg","q7.jpeg",
        "q8.jpeg","q9.jpeg"
        ,"q10.jpeg"]
    
    let menuTitle = [
        "Fried Shrimps",
        "Grilled Chicken Breast",
        "Beef Steak with Veggies",
        "Spaghetti Carbonara",
        "Caesar Salad",
        "Fried Vegetables",
        "Chicken Fajitas",
        "Margherita Pizza",
        "Cheeseburger",
        "Tacos with Salsa",
        "Pan-Seared Salmon"
    ]

    let menuDescrip = [
        "Juicy fried shrimps seasoned with spices and cooked to perfection.",
        "Tender grilled chicken breast marinated in garlic and herbs.",
        "Beef steak served with sautéed vegetables and a rich brown sauce.",
        "Classic Italian pasta with creamy carbonara sauce and bacon bits.",
        "Fresh Caesar salad with romaine lettuce, Parmesan cheese, and croutons.",
        "Crispy fried vegetables served with a delicious dipping sauce.",
        "Spicy chicken fajitas with bell peppers and onions wrapped in tortillas.",
        "Classic Margherita pizza topped with fresh tomatoes, mozzarella, and basil.",
        "Juicy cheeseburger with melted cheddar, lettuce, tomato, and a special sauce.",
        "Soft-shell tacos filled with seasoned meat, salsa, and fresh cilantro.",
        "Pan-seared salmon fillet served with lemon butter sauce and asparagus."
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
       

        // Do any additional setup after loading the view.
        let layout = UICollectionViewCompositionalLayout { sectionIndex, enviroment in
                    switch sectionIndex {
                    case 0 :
                        return self.drawTopSection()
                    case 1 :
                        return self.drawMiddleSection()
                    default:
                        return self.drawBottomSection()
                    }
                }
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    func drawTopSection()-> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
          , heightDimension: .fractionalHeight(1))
          let item = NSCollectionLayoutItem(layoutSize: itemSize)
          
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(200)
          , heightDimension: .absolute(220))
          let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize
          , subitems: [item])
              group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0
              , bottom: 0, trailing: 0)
              
          let section = NSCollectionLayoutSection(group: group)
              section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0
              , bottom: 0, trailing: 0)
              section.orthogonalScrollingBehavior = .continuous
        section.visibleItemsInvalidationHandler = { (items, offset, environment) in
             items.forEach { item in
             let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
             let minScale: CGFloat = 0.8
             let maxScale: CGFloat = 1.0
             let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
             item.transform = CGAffineTransform(scaleX: scale, y: scale)
             }
        }
        return section
    }
    
    func drawMiddleSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalHeight(1), heightDimension: .fractionalWidth(1))
        let items = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(75), heightDimension: .absolute(90))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [items])
        group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10
                , bottom: 10, trailing: 10)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        section.orthogonalScrollingBehavior = .continuous
               
        return section
    }
    
    func drawBottomSection()-> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(180))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        let section = NSCollectionLayoutSection(group: group)
//        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        return section
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        switch section {
        case 0:
            return adsImg.count
        case 1:
            return foodCategoriesLB.count
        default:
            return menuImg.count
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TopCollectionViewCell
            // Configure the cell
            cell.imgView.image = UIImage(named: adsImg[indexPath.row])
            cell.imgView.contentMode = .scaleAspectFit
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "middleCell", for: indexPath) as! MiddleCollectionViewCell
            cell.imgView.image = UIImage(named: foodCategoriesImg[indexPath.row])
            cell.imgView.contentMode = .scaleAspectFit
            cell.foodTitleLB.text = foodCategoriesLB[indexPath.row]
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bottomCell", for: indexPath) as! BottomCollectionViewCell
            // Configure the cell
//            cell.backgroundColor = UIColor.green
            cell.imgView.image = UIImage(named: menuImg[indexPath.row])
            cell.imgView.layer.cornerRadius = 5
            cell.imgView.contentMode = .scaleAspectFill
            cell.imgView.backgroundColor = UIColor.red
            cell.titleLB.text = menuTitle[indexPath.row]
            cell.descriptionLB.text = menuDescrip[indexPath.row]
            return cell
        }
    
        
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
