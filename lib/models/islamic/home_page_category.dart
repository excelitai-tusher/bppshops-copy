import 'dart:convert';
/// getcategory : [{"id":63,"ecom_id":"1","category_name":"Salah Accessories","category_slug_name":"salah-accessories","category_image":"upload/category/1734526493881657.webp","category_icon":"upload/category/1733252181367569.png"},{"id":64,"ecom_id":"1","category_name":"Modest Dress","category_slug_name":"modest-dress","category_image":"upload/category/1734526514764827.webp","category_icon":"upload/category/1733252373326041.png"},{"id":65,"ecom_id":"1","category_name":"Halal Cosmetics & Fragrance","category_slug_name":"halal-cosmetics-&-fragrance","category_image":"upload/category/1734526534950013.webp","category_icon":"upload/category/1733252472860929.png"},{"id":68,"ecom_id":"1","category_name":"Food","category_slug_name":"food","category_image":"upload/category/1734526553724772.webp","category_icon":"upload/category/1733253610119752.png"},{"id":71,"ecom_id":"2","category_name":"Fruites and Vegetables","category_slug_name":"fruites-and-vegetables","category_image":"upload/category/1733253860757038.png","category_icon":"upload/category/1733253860797828.png"},{"id":72,"ecom_id":"2","category_name":"Snacks","category_slug_name":"snacks","category_image":"upload/category/1734865103155671.webp","category_icon":"upload/category/1734857860949948.png"},{"id":73,"ecom_id":"1","category_name":"Decorative items","category_slug_name":"decorative-items","category_image":"upload/category/1734526573131726.webp","category_icon":"upload/category/1733254175800699.png"},{"id":76,"ecom_id":"2","category_name":"Candy & Chocolate","category_slug_name":"candy-&-chocolate","category_image":"upload/category/1733255280168231.png","category_icon":"upload/category/1733255280206146.png"},{"id":77,"ecom_id":"2","category_name":"Beverage","category_slug_name":"beverage","category_image":"upload/category/1734859731336221.png","category_icon":"upload/category/1734859731346304.png"},{"id":78,"ecom_id":"2","category_name":"Meat and fish","category_slug_name":"meat-and-fish","category_image":"upload/category/1733257278589280.png","category_icon":"upload/category/1733257278628572.png"},{"id":80,"ecom_id":"3","category_name":"WOMAN","category_slug_name":"woman","category_image":"upload/category/1733257446604223.jpg","category_icon":"upload/category/1733257446624155.png"},{"id":81,"ecom_id":"2","category_name":"Baking","category_slug_name":"baking","category_image":"upload/category/1733257595579217.png","category_icon":"upload/category/1733257595616118.png"},{"id":82,"ecom_id":"3","category_name":"Men","category_slug_name":"men","category_image":"upload/category/1733257639555440.jpg","category_icon":"upload/category/1733257639585961.jpg"},{"id":83,"ecom_id":"2","category_name":"Beauty and Health","category_slug_name":"beauty-and-health","category_image":"upload/category/1733257813961052.png","category_icon":"upload/category/1733257814008471.png"},{"id":84,"ecom_id":"2","category_name":"BREAD & BAKERY","category_slug_name":"bread-&-bakery","category_image":"upload/category/1733258021240830.png","category_icon":"upload/category/1733258021279173.png"},{"id":85,"ecom_id":"2","category_name":"Breackfast","category_slug_name":"breackfast","category_image":"upload/category/1733258216895226.png","category_icon":"upload/category/1733258216937678.png"},{"id":87,"ecom_id":"2","category_name":"Cooking","category_slug_name":"cooking","category_image":"upload/category/1734858112002157.png","category_icon":"upload/category/1734858112015553.png"},{"id":89,"ecom_id":"2","category_name":"Dairy","category_slug_name":"dairy","category_image":"upload/category/1733264233071390.png","category_icon":"upload/category/1733264233109854.png"},{"id":90,"ecom_id":"2","category_name":"Health Products","category_slug_name":"health-products","category_image":"upload/category/1733264806250350.png","category_icon":"upload/category/1733264806295856.png"},{"id":91,"ecom_id":"2","category_name":"Home and Cleaning","category_slug_name":"home-and-cleaning","category_image":"upload/category/1733265709018172.png","category_icon":"upload/category/1733265709052866.png"},{"id":93,"ecom_id":"3","category_name":"Test","category_slug_name":"test","category_image":"upload/category/1733413985340958.jpg","category_icon":"upload/category/1733413985359920.jfif"},{"id":94,"ecom_id":"5","category_name":"cosmetic cat","category_slug_name":"cosmetic-cat","category_image":"upload/category/1733417693869414.png","category_icon":"upload/category/1733417693883617.png"},{"id":97,"ecom_id":"7","category_name":"Sufa","category_slug_name":"sufa","category_image":"upload/category/1733504670654769.jpg","category_icon":"upload/category/1733504670689989.jpg"},{"id":98,"ecom_id":"7","category_name":"Sufa","category_slug_name":"sufa","category_image":"upload/category/1733504673945141.jpg","category_icon":"upload/category/1733504673981925.jpg"},{"id":101,"ecom_id":"4","category_name":"Smart Phone & Tablets","category_slug_name":"smart-phone-&-tablets","category_image":"upload/category/1733506575216602.jpg","category_icon":"upload/category/1733506575254190.png"},{"id":105,"ecom_id":"7","category_name":"Test Category","category_slug_name":"test-category","category_image":"upload/category/1733706019937253.jpg","category_icon":"upload/category/1733706019994300.png"},{"id":107,"ecom_id":"7","category_name":"Wooden Collection","category_slug_name":"wooden-collection","category_image":"upload/category/1733706560473295.jpg","category_icon":"upload/category/1733706560495685.jpg"},{"id":114,"ecom_id":"7","category_name":"Brand New Wooden collection 2022","category_slug_name":"brand-new-wooden-collection-2022","category_image":"upload/category/1733767729615762.jpg","category_icon":"upload/category/1733767729691674.jpg"},{"id":115,"ecom_id":"4","category_name":"Headphone","category_slug_name":"headphone","category_image":"upload/category/1733779857980124.jpg","category_icon":"upload/category/1733779858013419.png"},{"id":118,"ecom_id":"3","category_name":"Shirt","category_slug_name":"shirt","category_image":"upload/category/1733862919910150.jpg","category_icon":"upload/category/1733862919945829.jpg"},{"id":119,"ecom_id":"2","category_name":"Ice Cream & Frozen","category_slug_name":"ice-cream-&-frozen","category_image":"upload/category/1733975762039740.jpg","category_icon":"upload/category/1734865518669326.jpeg"},{"id":120,"ecom_id":"13","category_name":"AVITA_Laptop","category_slug_name":"avita_laptop","category_image":"upload/category/1734044801035789.jpg","category_icon":"upload/category/1734044801052019.jpg"},{"id":121,"ecom_id":"4","category_name":"AVITA_Laptop","category_slug_name":"avita_laptop","category_image":"upload/category/1734046337357524.jpg","category_icon":"upload/category/1734046337372981.jpg"},{"id":122,"ecom_id":"4","category_name":"Apple laptop","category_slug_name":"apple-laptop","category_image":"upload/category/1734049070389790.jpg","category_icon":"upload/category/1734049070450593.jpg"},{"id":123,"ecom_id":"4","category_name":"Iphone","category_slug_name":"iphone","category_image":"upload/category/1734056709969906.jpg","category_icon":"upload/category/1734056710685013.jpg"},{"id":124,"ecom_id":"4","category_name":"Camera_Collections","category_slug_name":"camera_collections","category_image":"upload/category/1734059748538425.jpg","category_icon":"upload/category/1734059748603563.jpg"},{"id":128,"ecom_id":"3","category_name":"Pillow","category_slug_name":"pillow","category_image":"upload/category/1734408565363777.webp","category_icon":"upload/category/1734408565436977.webp"},{"id":130,"ecom_id":"3","category_name":"Panjabi","category_slug_name":"panjabi","category_image":"upload/category/1734429232022363.webp","category_icon":"upload/category/1734429232039155.webp"},{"id":131,"ecom_id":"2","category_name":"Hair care","category_slug_name":"hair-care","category_image":"upload/category/1734495670878487.png","category_icon":"upload/category/1734495670900692.png"},{"id":133,"ecom_id":"2","category_name":"Baby Care New","category_slug_name":"baby-care-new","category_image":"upload/category/1734865158173574.webp","category_icon":"upload/category/1734607034195658.webp"},{"id":134,"ecom_id":"3","category_name":"Hasib","category_slug_name":"hasib","category_image":"upload/category/1734781718003515.png","category_icon":"upload/category/1734781718042514.png"}]

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));
String categoryToJson(Category data) => json.encode(data.toJson());
class Category {
  Category({
    List<Getcategory>? getcategory,}){
    _getcategory = getcategory;
  }
  Category.fromJson(dynamic json){
    if (json['getcategory'] != null) {
      _getcategory = [];
      json['getcategory'].forEach((v) {
        _getcategory?.add(Getcategory.fromJson(v));
      });
    }
  }
  List<Getcategory>? _getcategory;
  List<Getcategory>? get getcategory => _getcategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_getcategory != null) {
      map['getcategory'] = _getcategory?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 63
/// ecom_id : "1"
/// category_name : "Salah Accessories"
/// category_slug_name : "salah-accessories"
/// category_image : "upload/category/1734526493881657.webp"
/// category_icon : "upload/category/1733252181367569.png"

Getcategory getcategoryFromJson(String str) => Getcategory.fromJson(json.decode(str));
String getcategoryToJson(Getcategory data) => json.encode(data.toJson());
class Getcategory {
  Getcategory({
    int? id,
    String? ecomId,
    String? categoryName,
    String? categorySlugName,
    String? categoryImage,
    String? categoryIcon,}){
    _id = id;
    _ecomId = ecomId;
    _categoryName = categoryName;
    _categorySlugName = categorySlugName;
    _categoryImage = categoryImage;
    _categoryIcon = categoryIcon;
  }

  Getcategory.fromJson(dynamic json) {
    _id = json['id'];
    _ecomId = json['ecom_id'];
    _categoryName = json['category_name'];
    _categorySlugName = json['category_slug_name'];
    _categoryImage = json['category_image'];
    _categoryIcon = json['category_icon'];
  }
  int? _id;
  String? _ecomId;
  String? _categoryName;
  String? _categorySlugName;
  String? _categoryImage;
  String? _categoryIcon;

  int? get id => _id;
  String? get ecomId => _ecomId;
  String? get categoryName => _categoryName;
  String? get categorySlugName => _categorySlugName;
  String? get categoryImage => _categoryImage;
  String? get categoryIcon => _categoryIcon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['ecom_id'] = _ecomId;
    map['category_name'] = _categoryName;
    map['category_slug_name'] = _categorySlugName;
    map['category_image'] = _categoryImage;
    map['category_icon'] = _categoryIcon;
    return map;
  }

}