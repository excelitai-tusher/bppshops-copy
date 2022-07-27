import 'package:flutter/material.dart';

import '../view/bpp/address/manage_delivery_address.dart';

class TestWidgetProvider extends StatelessWidget {
  const TestWidgetProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ManageDeliveryAddress(),
          ),
        ],
      ),
    );
  }
}
