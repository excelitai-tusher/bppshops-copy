import 'package:flutter/foundation.dart';

class WishListItem {
  final int quantity;
  final String? id;
  final String name;
  final String imageUrl;
  final double price;
  final double shippingFee;

  WishListItem (
      {required this.id,
        required this.name,
        required this.price,
        required this.quantity,
        required this.imageUrl,
        required this.shippingFee
      });
}

class Wish with ChangeNotifier {
  Map<String,WishListItem > _items = {};

  Map<String,WishListItem > get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String productId, double price, String name, String imageUrl) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
              (exittingItem) =>
                  WishListItem (
                  id: exittingItem.id,
                  name: exittingItem.name,
                  price: exittingItem.price,
                  quantity: exittingItem.quantity + 1,
                  imageUrl: exittingItem.imageUrl,
                  shippingFee: exittingItem.shippingFee
              ));
    } else {
      _items.putIfAbsent(
          productId,
              () =>
                  WishListItem (
                  id: DateTime.now().toString(),
                  name: name,
                  price: price,
                  quantity: 1,
                  imageUrl: imageUrl,
                  shippingFee: 50
              ));
    }
    notifyListeners();
  }
  //
  // double get totalAmount {
  //   var total = 0.0;
  //
  //   _items.forEach((key, cartItem) {
  //     total += cartItem.price+cartItem.shippingFee;
  //   });
  //   return total;
  // }
  //
  // double get subAmount {
  //   var subtotal = 0.0;
  //
  //   _items.forEach((key, cartItem) {
  //     subtotal += cartItem.price*cartItem.quantity;
  //   });
  //   return subtotal;
  // }
  //
  //
  // double get shippingAmount {
  //   var shipping = 0.0;
  //
  //   _items.forEach((key, cartItem) {
  //     shipping+=
  //         cartItem.shippingFee*cartItem.quantity;
  //   });
  //   return shipping;
  // }


  void removeItem(String? productId) {
    _items.remove(productId);
    notifyListeners();
  }
}