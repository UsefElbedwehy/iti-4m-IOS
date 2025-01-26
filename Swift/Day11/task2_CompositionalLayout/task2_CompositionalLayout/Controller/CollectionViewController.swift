//
//  CollectionViewController.swift
//  task2_CompositionalLayout
//
//  Created by Usef on 21/01/2025.
//

import UIKit

var cartContainer = [Product]()
private let reuseIdentifier = "cell"
class CollectionViewController: UICollectionViewController {
    let ads   = Ads()
    let categ = Categ()
    let best  = BestSellers()
    override func viewDidLoad() {
        super.viewDidLoad()
        let bgView = UIView(frame: self.view.bounds)
        let gradLayer = CAGradientLayer()
        gradLayer.frame = view.frame
        gradLayer.colors = [UIColor(red: 1.0, green: 0.96, blue: 0.91, alpha: 1.0).cgColor,
                                           UIColor.white.cgColor]
        gradLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        bgView.layer.insertSublayer(gradLayer, at: 0)
        collectionView.backgroundView = bgView
        settingNavBar()
        initCollectionSectionsHeaders()
        compositionalLayoutInit()
    }
    
    func compositionalLayoutInit(){
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
    func settingNavBar() {
        self.navigationItem.title = "Restaurant" // Set title
        let img = UIImage(named: "restaurant")!
        navigationController?.navigationBar.setBackgroundImage(img.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0 ,right: 0), resizingMode: .stretch), for: .default)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "🛒", style: .plain, target: self, action: #selector(showCart))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.init(red: 19/256, green: 122/256, blue: 99/256, alpha: 1.0)
    }
    @objc func showCart(){
        let cartTVC = self.storyboard?.instantiateViewController(identifier: "cartTVC") as! CartTableViewController
        cartTVC.productsInCart = cartContainer
        self.navigationController?.pushViewController(cartTVC, animated: true)
    }
    func addToCart(_ product: Product){
        var isUnique = true
        if cartContainer.count == 0 {
            cartContainer.append(product)
        }else{
            for item in cartContainer {
                if product.title == item.title {
                    item.counter += 1
                    isUnique = false
                }
            }
            if isUnique == true {
                cartContainer.append(product)
            }
        }
    }
    func removeFromCart(_ product: Product){
        if cartContainer.count != 0 {
            for i in 0..<cartContainer.count {
                if product.title == cartContainer[i].title {
                    if cartContainer[i].counter == 1 {
                        cartContainer.remove(at: i)
                    }else{
                        cartContainer[i].counter -= 1
                    }
                }
            }
        }
    }
    func initCollectionSectionsHeaders(){
        collectionView.register(
            UICollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "header"
        )
    }
    
    
    func drawTopSection()-> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
          , heightDimension: .fractionalHeight(1))
          let item = NSCollectionLayoutItem(layoutSize: itemSize)
          
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(330)
          , heightDimension: .absolute(211))
          let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize
          , subitems: [item])
              group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0
              , bottom: 0, trailing: 0)
              
          let section = NSCollectionLayoutSection(group: group)
              section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0
              , bottom: 0, trailing: 0)
              section.orthogonalScrollingBehavior = .continuous
        let headerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.95),
                heightDimension: .absolute(30)
            )
            let header = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
            section.boundarySupplementaryItems = [header]
        section.visibleItemsInvalidationHandler = { (items, offset, environment) in
             items.forEach { item in
             let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
                 let minScale: CGFloat = 0.85
             let maxScale: CGFloat = 1.0
             let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
             item.transform = CGAffineTransform(scaleX: scale, y: scale)
             }
        }
        return section
    }
    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "header",
                for: indexPath
            )
            let title = UILabel(frame: header.bounds)
            title.text = ["Top Ads ⌵", "Categories ⌵", "Best Selling ⌵"][indexPath.section] // Section titles
            title.textAlignment = .left
            title.font = UIFont.boldSystemFont(ofSize: 18)
            header.addSubview(title)
            return header
        }
        return UICollectionReusableView()
    }

    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }

    
    func drawMiddleSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalHeight(1), heightDimension: .fractionalWidth(1))
        let items = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .absolute(90))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [items])
        group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10
                , bottom: 10, trailing: 10)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        section.orthogonalScrollingBehavior = .continuous
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.95),
                heightDimension: .absolute(30)
            )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        section.boundarySupplementaryItems = [header]
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
        let headerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.95),
                heightDimension: .absolute(30)
            )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        section.boundarySupplementaryItems = [header]
        return section
    }
    

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let displayVC = self.storyboard?.instantiateViewController(withIdentifier: "adsVC") as! AdsViewController
            displayVC.urlStr = ads.adsUrl[indexPath.row]
//            self.navigationController?.pushViewController(displayVC, animated: true)
            present(displayVC, animated: true, completion: nil)
        case 1:
            let displayVC = self.storyboard?.instantiateViewController(withIdentifier: "tableVC") as! CategTableViewController
            displayVC.categStr = categ.foodCategoriesLB[indexPath.item]
            displayVC.titleArray = categ.foodCategories[indexPath.item]
            displayVC.imgArray = categ.foodCategoriesImgsForTable[indexPath.item]
            displayVC.priceArray = categ.foodPrices[indexPath.item]
            displayVC.descArray = categ.foodDescriptions[indexPath.item]
            
            self.navigationController?.pushViewController(displayVC, animated: true)
        default:
            let displayVC = self.storyboard?.instantiateViewController(withIdentifier: "displayVC") as! DisplayViewController
            displayVC.imageToShow = best.bestSellerImg[indexPath.row]
            displayVC.titleToShow = best.bestSellerTitle[indexPath.row]
            displayVC.priceToShow = best.bestSellerPrices[indexPath.row]
            displayVC.descToShow = best.bestSellerDescrip[indexPath.row]
            self.navigationController?.pushViewController(displayVC, animated: true)
        }
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
            return ads.adsImg.count
        case 1:
            return categ.foodCategoriesLB.count
        default:
            return best.bestSellerImg.count
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TopCollectionViewCell
            // Configure the cell
            cell.imgView.image = UIImage(named: ads.adsImg[indexPath.row])
            cell.imgView.contentMode = .scaleAspectFill
            cell.imgView.backgroundColor = .white
            cell.imgView.layer.shadowColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.25).cgColor
            cell.imgView.layer.shadowOffset = CGSizeMake(0.0, 10.0)
            cell.imgView.layer.shadowOpacity = 0.65
            cell.imgView.layer.shadowRadius = 2.0
            cell.imgView.layer.masksToBounds = false
            cell.imgView.layer.cornerRadius = 6.0
            
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "middleCell", for: indexPath) as! MiddleCollectionViewCell
            cell.imgView.image = UIImage(named: categ.foodCategoriesImgForCollectionCells[indexPath.row])
            cell.imgView.contentMode = .scaleAspectFit
            cell.foodTitleLB.text = categ.foodCategoriesLB[indexPath.row]
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bottomCell", for: indexPath) as! BottomCollectionViewCell
            // Configure the cell
//            cell.backgroundColor = UIColor.green
            cell.imgView.image = UIImage(named: best.bestSellerImg[indexPath.row])
            cell.imgView.layer.cornerRadius = 5
            cell.imgView.contentMode = .scaleAspectFill
            cell.imgView.backgroundColor = UIColor.red
            cell.titleLB.text = best.bestSellerTitle[indexPath.row]
            cell.descriptionLB.text = best.bestSellerDescrip[indexPath.row]
            cell.priceLB.text = best.bestSellerPrices[indexPath.row] + "$"
            cell.addAction.tag = indexPath.row
            cell.addAction.addTarget(self, action: #selector(binButtonTapped(_:)), for: .touchUpInside)
            addGradientColorToCells(cell)
            return cell
        }
    
        
    }
    func addGradientColorToCells(_ cell: BottomCollectionViewCell){
        let bgView = UIView(frame: self.view.bounds)
        let gradLayer = CAGradientLayer()
        gradLayer.frame = view.frame
        gradLayer.startPoint = CGPoint(x: 0, y: 0)
        gradLayer.colors = [UIColor(red: 1.0, green: 0.96, blue: 0.87, alpha: 1.0).cgColor,
                                          UIColor(red: 0.95, green: 0.92, blue: 0.87, alpha: 1.0).cgColor]
        gradLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        bgView.layer.insertSublayer(gradLayer, at: 0)
        cell.layer.cornerRadius = 10
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.1
        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.layer.shadowRadius = 4
        cell.backgroundView = bgView
    }
    
    @objc func binButtonTapped(_ sender: UIButton){
        let prod = Product()
        prod.title = best.bestSellerTitle[sender.tag]
        prod.category    = best.bestSellerDescrip[sender.tag]
        prod.img      = best.bestSellerImg[sender.tag]
        prod.price    = best.bestSellerPrices[sender.tag]
        prod.counter  = 1
        cartContainer.append(prod)
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
