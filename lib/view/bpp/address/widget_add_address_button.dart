import 'package:bpp_shop/view/bpp/address/Add_new_Address.dart';
import 'package:flutter/material.dart';
class AddAddressButton extends StatelessWidget {
  const AddAddressButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewAddress()));
      },
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width * .8,
        decoration: BoxDecoration(
          //color: Colors.red,
          border: Border.all(width: 1, color: Colors.grey),
          // Border(
          //   left: BorderSide(width: 8.0, color: Colors.green),
          // ),
        ),
        child: Center(child: Text("+ Add Address")),
      ),
    );
  }
}
