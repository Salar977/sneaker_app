import 'package:flutter/material.dart';
import 'package:sneaker_app/models/shoes.dart';

class Cart extends ChangeNotifier {
  // list of shoes
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Zoom Freak',
      price: '136',
      description: 'The forward-thinking design of his latest signature shoe.',
      imagePath: 'lib/images/sneaker1.jpg'
    ),

    Shoe(
      name: 'Air Jordan',
      price: '150',
      description: 'A timeless classic with high-top support and premium leather.',
      imagePath: 'lib/images/sneaker2.jpg',
    ),

    Shoe(
      name: 'Nike Air Max 270',
      price: '120',
      description: 'Modern comfort with a large Air unit for all-day cushioning.',
      imagePath: 'lib/images/damen-sneaker.avif',
    ),
  ];

  // list of items in user cart
  List<Shoe> userCart = [];

  // get list of items for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }

  // get total price in the user cart
  double getTotalPrice() {
    double totalPrice = 0.0;

    for(var shoe in userCart) {
      double shoePrice = double.parse(shoe.price);
      totalPrice += shoePrice;
    }
    return totalPrice;
  }
}
