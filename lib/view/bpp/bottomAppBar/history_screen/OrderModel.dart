import 'dart:convert';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));
String orderModelToJson(OrderModel data) => json.encode(data.toJson());
class OrderModel {
  OrderModel({
      int? id, 
      String? userId, 
      dynamic divisionId, 
      dynamic totalitem, 
      dynamic totalAmount, 
      dynamic totalDiscount, 
      dynamic spesialDiscount, 
      dynamic vat, 
      dynamic cashGrandTot, 
      dynamic cashPaidShow, 
      dynamic changeAmount, 
      String? streetAddress, 
      String? districtId, 
      String? stateId, 
      String? floorNo, 
      String? appartmentNo, 
      String? name, 
      dynamic email, 
      String? phone, 
      dynamic postCode, 
      dynamic notes, 
      dynamic paymentType, 
      String? paymentMethod, 
      dynamic transactionId, 
      dynamic currency, 
      String? amount, 
      dynamic orderNumber, 
      String? invoiceNo, 
      String? orderDate, 
      String? orderMonth, 
      String? orderYear, 
      dynamic confirmedDate, 
      dynamic processingDate, 
      dynamic pickedDate, 
      dynamic shippedDate, 
      dynamic deliveredDate, 
      dynamic cancelDate, 
      dynamic returnDate, 
      String? returnOrder, 
      dynamic returnReason, 
      String? deliveryDate, 
      String? deliveryTime, 
      String? deliveryCharge, 
      String? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _divisionId = divisionId;
    _totalitem = totalitem;
    _totalAmount = totalAmount;
    _totalDiscount = totalDiscount;
    _spesialDiscount = spesialDiscount;
    _vat = vat;
    _cashGrandTot = cashGrandTot;
    _cashPaidShow = cashPaidShow;
    _changeAmount = changeAmount;
    _streetAddress = streetAddress;
    _districtId = districtId;
    _stateId = stateId;
    _floorNo = floorNo;
    _appartmentNo = appartmentNo;
    _name = name;
    _email = email;
    _phone = phone;
    _postCode = postCode;
    _notes = notes;
    _paymentType = paymentType;
    _paymentMethod = paymentMethod;
    _transactionId = transactionId;
    _currency = currency;
    _amount = amount;
    _orderNumber = orderNumber;
    _invoiceNo = invoiceNo;
    _orderDate = orderDate;
    _orderMonth = orderMonth;
    _orderYear = orderYear;
    _confirmedDate = confirmedDate;
    _processingDate = processingDate;
    _pickedDate = pickedDate;
    _shippedDate = shippedDate;
    _deliveredDate = deliveredDate;
    _cancelDate = cancelDate;
    _returnDate = returnDate;
    _returnOrder = returnOrder;
    _returnReason = returnReason;
    _deliveryDate = deliveryDate;
    _deliveryTime = deliveryTime;
    _deliveryCharge = deliveryCharge;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  OrderModel.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _divisionId = json['division_id'];
    _totalitem = json['totalitem'];
    _totalAmount = json['totalAmount'];
    _totalDiscount = json['totalDiscount'];
    _spesialDiscount = json['spesial_discount'];
    _vat = json['vat'];
    _cashGrandTot = json['cash_grand_tot'];
    _cashPaidShow = json['cashPaid_show'];
    _changeAmount = json['changeAmount'];
    _streetAddress = json['street_address'];
    _districtId = json['district_id'];
    _stateId = json['state_id'];
    _floorNo = json['floor_no'];
    _appartmentNo = json['appartment_no'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _postCode = json['post_code'];
    _notes = json['notes'];
    _paymentType = json['payment_type'];
    _paymentMethod = json['payment_method'];
    _transactionId = json['transaction_id'];
    _currency = json['currency'];
    _amount = json['amount'];
    _orderNumber = json['order_number'];
    _invoiceNo = json['invoice_no'];
    _orderDate = json['order_date'];
    _orderMonth = json['order_month'];
    _orderYear = json['order_year'];
    _confirmedDate = json['confirmed_date'];
    _processingDate = json['processing_date'];
    _pickedDate = json['picked_date'];
    _shippedDate = json['shipped_date'];
    _deliveredDate = json['delivered_date'];
    _cancelDate = json['cancel_date'];
    _returnDate = json['return_date'];
    _returnOrder = json['return_order'];
    _returnReason = json['return_reason'];
    _deliveryDate = json['delivery_date'];
    _deliveryTime = json['delivery_time'];
    _deliveryCharge = json['delivery_charge'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _userId;
  dynamic _divisionId;
  dynamic _totalitem;
  dynamic _totalAmount;
  dynamic _totalDiscount;
  dynamic _spesialDiscount;
  dynamic _vat;
  dynamic _cashGrandTot;
  dynamic _cashPaidShow;
  dynamic _changeAmount;
  String? _streetAddress;
  String? _districtId;
  String? _stateId;
  String? _floorNo;
  String? _appartmentNo;
  String? _name;
  dynamic _email;
  String? _phone;
  dynamic _postCode;
  dynamic _notes;
  dynamic _paymentType;
  String? _paymentMethod;
  dynamic _transactionId;
  dynamic _currency;
  String? _amount;
  dynamic _orderNumber;
  String? _invoiceNo;
  String? _orderDate;
  String? _orderMonth;
  String? _orderYear;
  dynamic _confirmedDate;
  dynamic _processingDate;
  dynamic _pickedDate;
  dynamic _shippedDate;
  dynamic _deliveredDate;
  dynamic _cancelDate;
  dynamic _returnDate;
  String? _returnOrder;
  dynamic _returnReason;
  String? _deliveryDate;
  String? _deliveryTime;
  String? _deliveryCharge;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
OrderModel copyWith({  int? id,
  String? userId,
  dynamic divisionId,
  dynamic totalitem,
  dynamic totalAmount,
  dynamic totalDiscount,
  dynamic spesialDiscount,
  dynamic vat,
  dynamic cashGrandTot,
  dynamic cashPaidShow,
  dynamic changeAmount,
  String? streetAddress,
  String? districtId,
  String? stateId,
  String? floorNo,
  String? appartmentNo,
  String? name,
  dynamic email,
  String? phone,
  dynamic postCode,
  dynamic notes,
  dynamic paymentType,
  String? paymentMethod,
  dynamic transactionId,
  dynamic currency,
  String? amount,
  dynamic orderNumber,
  String? invoiceNo,
  String? orderDate,
  String? orderMonth,
  String? orderYear,
  dynamic confirmedDate,
  dynamic processingDate,
  dynamic pickedDate,
  dynamic shippedDate,
  dynamic deliveredDate,
  dynamic cancelDate,
  dynamic returnDate,
  String? returnOrder,
  dynamic returnReason,
  String? deliveryDate,
  String? deliveryTime,
  String? deliveryCharge,
  String? status,
  String? createdAt,
  String? updatedAt,
}) => OrderModel(  id: id ?? _id,
  userId: userId ?? _userId,
  divisionId: divisionId ?? _divisionId,
  totalitem: totalitem ?? _totalitem,
  totalAmount: totalAmount ?? _totalAmount,
  totalDiscount: totalDiscount ?? _totalDiscount,
  spesialDiscount: spesialDiscount ?? _spesialDiscount,
  vat: vat ?? _vat,
  cashGrandTot: cashGrandTot ?? _cashGrandTot,
  cashPaidShow: cashPaidShow ?? _cashPaidShow,
  changeAmount: changeAmount ?? _changeAmount,
  streetAddress: streetAddress ?? _streetAddress,
  districtId: districtId ?? _districtId,
  stateId: stateId ?? _stateId,
  floorNo: floorNo ?? _floorNo,
  appartmentNo: appartmentNo ?? _appartmentNo,
  name: name ?? _name,
  email: email ?? _email,
  phone: phone ?? _phone,
  postCode: postCode ?? _postCode,
  notes: notes ?? _notes,
  paymentType: paymentType ?? _paymentType,
  paymentMethod: paymentMethod ?? _paymentMethod,
  transactionId: transactionId ?? _transactionId,
  currency: currency ?? _currency,
  amount: amount ?? _amount,
  orderNumber: orderNumber ?? _orderNumber,
  invoiceNo: invoiceNo ?? _invoiceNo,
  orderDate: orderDate ?? _orderDate,
  orderMonth: orderMonth ?? _orderMonth,
  orderYear: orderYear ?? _orderYear,
  confirmedDate: confirmedDate ?? _confirmedDate,
  processingDate: processingDate ?? _processingDate,
  pickedDate: pickedDate ?? _pickedDate,
  shippedDate: shippedDate ?? _shippedDate,
  deliveredDate: deliveredDate ?? _deliveredDate,
  cancelDate: cancelDate ?? _cancelDate,
  returnDate: returnDate ?? _returnDate,
  returnOrder: returnOrder ?? _returnOrder,
  returnReason: returnReason ?? _returnReason,
  deliveryDate: deliveryDate ?? _deliveryDate,
  deliveryTime: deliveryTime ?? _deliveryTime,
  deliveryCharge: deliveryCharge ?? _deliveryCharge,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  String? get userId => _userId;
  dynamic get divisionId => _divisionId;
  dynamic get totalitem => _totalitem;
  dynamic get totalAmount => _totalAmount;
  dynamic get totalDiscount => _totalDiscount;
  dynamic get spesialDiscount => _spesialDiscount;
  dynamic get vat => _vat;
  dynamic get cashGrandTot => _cashGrandTot;
  dynamic get cashPaidShow => _cashPaidShow;
  dynamic get changeAmount => _changeAmount;
  String? get streetAddress => _streetAddress;
  String? get districtId => _districtId;
  String? get stateId => _stateId;
  String? get floorNo => _floorNo;
  String? get appartmentNo => _appartmentNo;
  String? get name => _name;
  dynamic get email => _email;
  String? get phone => _phone;
  dynamic get postCode => _postCode;
  dynamic get notes => _notes;
  dynamic get paymentType => _paymentType;
  String? get paymentMethod => _paymentMethod;
  dynamic get transactionId => _transactionId;
  dynamic get currency => _currency;
  String? get amount => _amount;
  dynamic get orderNumber => _orderNumber;
  String? get invoiceNo => _invoiceNo;
  String? get orderDate => _orderDate;
  String? get orderMonth => _orderMonth;
  String? get orderYear => _orderYear;
  dynamic get confirmedDate => _confirmedDate;
  dynamic get processingDate => _processingDate;
  dynamic get pickedDate => _pickedDate;
  dynamic get shippedDate => _shippedDate;
  dynamic get deliveredDate => _deliveredDate;
  dynamic get cancelDate => _cancelDate;
  dynamic get returnDate => _returnDate;
  String? get returnOrder => _returnOrder;
  dynamic get returnReason => _returnReason;
  String? get deliveryDate => _deliveryDate;
  String? get deliveryTime => _deliveryTime;
  String? get deliveryCharge => _deliveryCharge;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['division_id'] = _divisionId;
    map['totalitem'] = _totalitem;
    map['totalAmount'] = _totalAmount;
    map['totalDiscount'] = _totalDiscount;
    map['spesial_discount'] = _spesialDiscount;
    map['vat'] = _vat;
    map['cash_grand_tot'] = _cashGrandTot;
    map['cashPaid_show'] = _cashPaidShow;
    map['changeAmount'] = _changeAmount;
    map['street_address'] = _streetAddress;
    map['district_id'] = _districtId;
    map['state_id'] = _stateId;
    map['floor_no'] = _floorNo;
    map['appartment_no'] = _appartmentNo;
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    map['post_code'] = _postCode;
    map['notes'] = _notes;
    map['payment_type'] = _paymentType;
    map['payment_method'] = _paymentMethod;
    map['transaction_id'] = _transactionId;
    map['currency'] = _currency;
    map['amount'] = _amount;
    map['order_number'] = _orderNumber;
    map['invoice_no'] = _invoiceNo;
    map['order_date'] = _orderDate;
    map['order_month'] = _orderMonth;
    map['order_year'] = _orderYear;
    map['confirmed_date'] = _confirmedDate;
    map['processing_date'] = _processingDate;
    map['picked_date'] = _pickedDate;
    map['shipped_date'] = _shippedDate;
    map['delivered_date'] = _deliveredDate;
    map['cancel_date'] = _cancelDate;
    map['return_date'] = _returnDate;
    map['return_order'] = _returnOrder;
    map['return_reason'] = _returnReason;
    map['delivery_date'] = _deliveryDate;
    map['delivery_time'] = _deliveryTime;
    map['delivery_charge'] = _deliveryCharge;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}