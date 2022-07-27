import 'dart:convert';

OrderDetailsModel demoFromJson(String str) => OrderDetailsModel.fromJson(json.decode(str));
String demoToJson(OrderDetailsModel data) => json.encode(data.toJson());

class OrderDetailsModel {
  OrderDetailsModel({
    int? id,
    String? amount,
    dynamic orderNumber,
    String? invoiceNo,
    List<OrderItems>? orderItems,
  }) {
    _id = id;
    _amount = amount;
    _orderNumber = orderNumber;
    _invoiceNo = invoiceNo;
    _orderItems = orderItems;
  }

  OrderDetailsModel.fromJson(dynamic json) {
    _id = json['id'];
    _amount = json['amount'];
    _orderNumber = json['order_number'];
    _invoiceNo = json['invoice_no'];
    if (json['order_items'] != null) {
      _orderItems = [];
      json['order_items'].forEach((v) {
        _orderItems?.add(OrderItems.fromJson(v));
      });
    }
  }
  int? _id;
  String? _amount;
  dynamic _orderNumber;
  String? _invoiceNo;
  List<OrderItems>? _orderItems;
  OrderDetailsModel copyWith({
    int? id,
    String? amount,
    dynamic orderNumber,
    String? invoiceNo,
    List<OrderItems>? orderItems,
  }) =>
      OrderDetailsModel(
        id: id ?? _id,
        amount: amount ?? _amount,
        orderNumber: orderNumber ?? _orderNumber,
        invoiceNo: invoiceNo ?? _invoiceNo,
        orderItems: orderItems ?? _orderItems,
      );
  int? get id => _id;
  String? get amount => _amount;
  dynamic get orderNumber => _orderNumber;
  String? get invoiceNo => _invoiceNo;
  List<OrderItems>? get orderItems => _orderItems;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['amount'] = _amount;
    map['order_number'] = _orderNumber;
    map['invoice_no'] = _invoiceNo;
    if (_orderItems != null) {
      map['order_items'] = _orderItems?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

OrderItems orderItemsFromJson(String str) =>
    OrderItems.fromJson(json.decode(str));
String orderItemsToJson(OrderItems data) => json.encode(data.toJson());

class OrderItems {
  OrderItems({

    String? qty,
    String? price,
    Product? product,
  }) {

    _qty = qty;
    _price = price;
    _product = product;
  }

  OrderItems.fromJson(dynamic json) {

    _qty = json['qty'];
    _price = json['price'];
    _product =
    json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  String? _qty;
  String? _price;
  Product? _product;
  OrderItems copyWith({
    String? qty,
    String? price,
    Product? product,
  }) =>
      OrderItems(
        qty: qty ?? _qty,
        price: price ?? _price,
        product: product ?? _product,
      );
  Product? get product => _product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    return map;
  }
}


Product productFromJson(String str) => Product.fromJson(json.decode(str));
String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({

    String? productThambnail,
    String? productName,
    String? unit,
    String? productQty,
    String? unitPrice,

  }) {

    _productThambnail = productThambnail;
    _productName = productName;
    _unit = unit;
    _productQty = productQty;
    _unitPrice = unitPrice;

  }

  Product.fromJson(dynamic json) {

    _productThambnail = json['product_thambnail'];
    _productName = json['product_name'];
    _unit = json['unit'];
    _productQty = json['product_qty'];
    _unitPrice = json['unit_price'];

  }

  String? _productThambnail;
  String? _productName;
  String? _unit;
  String? _productQty;
  String? _unitPrice;

  Product copyWith({

    String? productThambnail,
    String? productName,
    String? unit,
    String? productQty,
    String? unitPrice,


  }) =>
      Product(
        productThambnail: productThambnail ?? _productThambnail,
        productName: productName ?? _productName,
        unit: unit ?? _unit,
        productQty: productQty ?? _productQty,
        unitPrice: unitPrice ?? _unitPrice,

      );

  String? get productThambnail => _productThambnail;
  String? get productName => _productName;
  String? get unit => _unit;
  String? get productQty => _productQty;
  String? get unitPrice => _unitPrice;



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_thambnail'] = _productThambnail;
    map['product_name'] = _productName;
    map['unit'] = _unit;
    map['product_qty'] = _productQty;
    map['unit_price'] = _unitPrice;

    return map;
  }
}
