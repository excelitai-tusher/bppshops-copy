
import 'package:bpp_shop/view_model/bpp/order_proceed_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widget_add_address_button.dart';
import 'widget_address_list_view.dart';
import 'widget_selected_address.dart';

class ManageDeliveryAddress extends StatelessWidget {
  ManageDeliveryAddress({Key? key}) : super(key: key);

  Widget buildConditionalAddressWidget(OrderProceedViewModel orderProceedViewModel/*BuildContext context*/) {
    // final orderProceedViewModel = Provider.of<OrderProceedViewModel>(context,listen: false);
    //orderProceedViewModel.getSelectAddress();
    if (orderProceedViewModel.selectedAddress == true && orderProceedViewModel.selectedAddress == false && orderProceedViewModel.selectedAddress == false) {
      return SelectedAddressWidget();
    }
    if (orderProceedViewModel.selectedAddress == true && orderProceedViewModel.selectedAddress == true && orderProceedViewModel.selectedAddress == false) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddAddressButton(),
          SizedBox(
            height: 20,
          ),
          AddressListView(),
        ],
      );
    }
    if (orderProceedViewModel.selectedAddress == true && orderProceedViewModel.selectedAddress == false && orderProceedViewModel.selectedAddress == true) {
      return SelectedAddressWidget();
    }
    if (orderProceedViewModel.selectedAddress == false && orderProceedViewModel.selectedAddress == false && orderProceedViewModel.selectedAddress == true) {
      return SelectedAddressWidget();
    } else {
      return AddAddressButton();
    }
  }

  @override
  Widget build(BuildContext context) {
    //final orderProceedViewModel = Provider.of<OrderProceedViewModel>(context,listen: false);
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        //color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      //height: addressList.isEmpty ? 145 : 145 + addressList.length * 60,
      width: size.width * .9,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.black,
                  size: 25,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Select a deliver Address",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Divider(
              height: 40,
              color: Colors.black,
            ),
          ),

          AddAddressButton(),
          SizedBox(
            height: 20,
          ),
          AddressListView(),

        ],
      ),
    );
  }
}
