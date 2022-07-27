
import 'package:bpp_shop/models/bpp/address_model.dart';
import 'package:bpp_shop/service/bpp/http_delete_address.dart';
import 'package:bpp_shop/service/bpp/http_get_all_address.dart';

import 'package:flutter/cupertino.dart';

import '../../service/bpp/http_select_address.dart';

class OrderProceedViewModel with ChangeNotifier{

  List<AddressModel> addressList = [];
  bool isSelectAddressLoading=false;
  bool isDeletedAddressLoading=false;
  AddressModel? selectedAddress;

  void loadAddressList() async {
    addressList = await getAllAddressData();
    bool changeButton = false;
    bool selectButton = false;
    bool selected = false;

    void setChangeButton(bool value) {
      changeButton = value;
      notifyListeners();
    }
    void setSelectButton(bool value) {
      selectButton = value;
      notifyListeners();
    }
    void setSelected(bool value) {
      selected = value;
      notifyListeners();
    }

    void loadAddressList() async {
      addressList = await getAllAddressData();
      print("load Address <<<<<<<<<<<<<ok>>>>>>>>>>>>");
      print("load Address <<<<<<<<<<<<<${addressList.length}>>>>>>>>>>>>");
      notifyListeners();
    }

    ///list filter from addressList where status code ==1
    ///And then selected address stor in selectedAddress variable
    void getSelectAddress() {
      List<AddressModel> statusList = addressList.where((element) =>
      element.status == "1").toList();
      print(statusList.length);
      print("<<<<<<<<<<<<<<<<<<<ok>>>>statusList>>>>>>>>>>>>");
      selectedAddress = statusList[0];
      if (selectedAddress != null) {
        setSelectButton(false);
        setChangeButton(false);
        setSelected(true);
      } else {
        setSelectButton(false);
        setChangeButton(false);
        setSelected(false);
      }
      notifyListeners();
    }

    void selectAAddress(String id) async {
      isSelectAddressLoading = true;
      notifyListeners();
      int statusCode = await selectAddress(id);
      if (statusCode == 200) {
        isSelectAddressLoading = false;
        notifyListeners();
      }
    }

    void deleteAddress(String id) async {
      isDeletedAddressLoading = true;
      int statusCode = await deleteAddressData(id);

      if (statusCode == 200) {
        loadAddressList();
        isDeletedAddressLoading = false;
        notifyListeners();
      }
    }
  }
}