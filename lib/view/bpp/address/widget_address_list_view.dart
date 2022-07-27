import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_model/bpp/order_proceed_view_model.dart';

class AddressListView extends StatelessWidget {
   AddressListView({Key? key}) : super(key: key);
  //OrderProceedViewModel orderProceedViewModel;

  @override
  Widget build(BuildContext context) {
    final orderProceedViewModel=Provider.of<OrderProceedViewModel>(context);
    return orderProceedViewModel.addressList.isNotEmpty
        ? ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: orderProceedViewModel.addressList.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
          padding: EdgeInsets.only(
            top: 5,
            left: 15,
          ),
          height: 50,
          width:
          MediaQuery.of(context).size.width * .8,
          decoration: BoxDecoration(
              // color: index == selectedIndex &&
              //     isSelectAddress
              //     ?
              color:Color(0xffECF9EB),
              //    : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: Colors.black12, width: .5)
          ),
          child: Row(
            crossAxisAlignment:
            CrossAxisAlignment.center,
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                  //orderProceedViewModel.selectAAddress(orderProceedViewModel.addressList[index].id!.toString());
                },
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(orderProceedViewModel.addressList[index]
                        .streetAddress
                        .toString()),
                    Row(
                      children: [
                        Text(
                          orderProceedViewModel.addressList[index]
                            .postCodes!.postOffice.toString() +
                              ",",
                          style: TextStyle(
                              fontWeight:
                              FontWeight.bold,
                              fontSize: 12
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                            orderProceedViewModel.addressList[index].district!.name.toString()
                                ,
                            style: TextStyle(
                                fontWeight:
                                FontWeight.bold,
                                fontSize: 12)),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      //orderProceedViewModel.deleteAddress(orderProceedViewModel.addressList[index].id!.toString());
                    },
                    child: Text(
                      'Delete',
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 12),

                    ),
                  ),

                ),
              )
            ],
          ),
        );
      },
    )
        : Container();
  }
}
