//
//  Restaurant.swift
//  task2_CompositionalLayout
//
//  Created by Usef on 25/01/2025.
//

import UIKit

//class Restaurant: NSObject {
//    
//}
class Product {
    var title:String    = ""
    var price:String    = ""
    var img:String      = ""
    var category:String = ""
    var counter         = 0
}
class Ads {
    let adsImg = [
        "pizzaStation","heartAttack","babElhara",
        "elgamal","tbs.png"]
    let adsUrl = [
        "https://pizzastationeg.com",
        "https://www.heartattack.me",
        "https://babelharaegypt.com/ar",
        "https://algamal.shop/?fbclid=IwZXh0bgNhZW0BMQABHSRO4pINq75Nx6UAQUv0pL5SJAnaff0hL6jpltUHFjXa0Ii8ajjNeb3SJw_aem_MKXmN18ZFY28i4sl2m3Jqg",
        "https://cilantro.cafe/?"]
}

class Categ {
    let foodCategoriesLB = [
        "Burgers","Pizza","Sea Food",
        "Italian","Chinese","Vegetable",
        "Fruits","Dessert" ,"Grocery"]
    
    let foodCategoriesImgForCollectionCells = [
        "burger.png","pizza.png","lobster.png",
        "pasta.png","chinese.png","carrot.png",
        "watermelon.png","donut.png","grocery.png"]
    
    let foodPrices = [
        // Burgers
        ["5.99", "6.49", "4.99"],
        // Pizzas
        ["7.99", "8.99", "9.49"],
        // Lobsters
        ["14.99", "24.99", "12.99"],
        // Pasta
        ["10.49", "9.99", "8.49"],
        // Chinese
        ["11.49", "12.99", "5.49"],
        // Carrots
        ["4.99", "6.99", "5.99"],
        // Watermelon
        ["6.49", "4.99", "3.99"],
        // Donuts
        ["1.99", "2.49", "2.99"],
        // Grocery
        ["1.49", "2.99", "2.49", "3.99"]
    ];

    
    let foodCategories = [
        ["Cheeseburger", "Chicken Burger", "Veggie Burger"],  // Burger
        ["Margherita", "Pepperoni", "BBQ Chicken"],           // Pizza
        ["Lobster Roll", "Grilled Lobster", "Lobster Bisque"],// Lobster
        ["Spaghetti", "Penne", "Mac and Cheese"],             // Pasta
        ["Sweet and Sour Chicken", "Kung Pao Chicken", "Spring Rolls"], // Chinese
        ["Roasted Carrots", "Carrot Salad", "Carrot Soup"],    // Carrot
        ["Watermelon Salad", "Watermelon Juice", "Watermelon Slices"], // Watermelon
        ["Glazed Donut", "Chocolate Donut", "Jelly Donut"],    // Donut
        ["Milk", "Eggs", "Bread", "Cheese"]                   // Grocery
    ];
    
    let foodCategoriesImgsForTable = [
        ["CheeseBurger.jpeg", "ChickenBurger.jpeg", "VeggieBurger.jpeg"],  // Burger
        ["margh.avif", "Pepperoni.jpeg", "BBQ.jpeg"],           // Pizza
        ["lobRoll.jpeg", "GrilledLobster.jpeg", "LobsterBisque.jpeg"],// Lobster
        ["Spaghetti.jpeg", "Penne.jpeg", "MacAndCheese.jpeg"],             // Pasta
        ["SweetandSourChicken.jpeg", "KungPaoChicken.jpeg", "SpringRolls.jpeg"], // Chinese
        ["RoastedCarrots", "CarrotSalad", "CarrotSoup"],    // Carrot
        ["WatermelonSalad", "WatermelonJuice", "WatermelonSlices"], // Watermelon
        ["GlazedDonut", "ChocolateDonut", "JellyDonut"],    // Donut
        ["Milk", "Eggs", "Bread", "Cheese"]                   // Grocery
    ];
    
    let foodDescriptions = [
        // Burgers
        ["Juicy beef patty with melted cheese", "Grilled chicken with lettuce and mayo", "Plant-based patty with fresh veggies"],
        // Pizzas
        ["Classic tomato, mozzarella, and basil", "Loaded with pepperoni slices", "Topped with BBQ sauce and chicken"],
        // Lobsters
        ["Soft roll filled with fresh lobster meat", "Lobster grilled to perfection", "Creamy lobster soup with rich flavors"],
        // Pasta
        ["Traditional Italian spaghetti with marinara sauce", "Short tube-shaped pasta with creamy sauce", "Comforting cheesy pasta"],
        // Chinese
        ["Crispy chicken in sweet and sour sauce", "Spicy stir-fried chicken with peanuts", "Crispy and savory vegetable rolls"],
        // Carrots
        ["Oven-roasted carrots with herbs", "Fresh carrot salad with vinaigrette dressing", "Warm and creamy carrot soup"],
        // Watermelon
        ["Refreshing watermelon with feta and mint", "Chilled watermelon juice", "Freshly sliced watermelon pieces"],
        // Donuts
        ["Classic glazed donut", "Rich chocolate-covered donut", "Donut filled with sweet jelly"],
        // Grocery
        ["Fresh whole milk", "Organic farm-fresh eggs", "Soft and freshly baked bread", "Aged cheddar cheese"]
    ];


}

class BestSellers {
    let bestSellerImg = [
        "a1.jpeg","q1.jpeg",
        "q2.jpeg","q3.jpeg",
        "q4.jpeg","q5.jpeg",
        "q6.jpeg","q7.jpeg",
        "q8.jpeg","q9.jpeg"
        ,"q10.jpeg"]
    
    let bestSellerTitle = [
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

    let bestSellerDescrip = [
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
    
    let bestSellerPrices = [
        "12.99", "14.49", "19.99", "13.99", "8.99",
        "9.99", "12.49", "10.99", "8.49", "11.99", "17.99"
    ]
}
