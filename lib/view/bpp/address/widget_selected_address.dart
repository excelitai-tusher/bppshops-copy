import 'package:bpp_shop/view_model/bpp/order_proceed_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectedAddressWidget extends StatelessWidget {
  SelectedAddressWidget({Key? key}) : super(key: key);

  // OrderProceedViewModel orderProceedViewModel;
  @override
  Widget build(BuildContext context){
    final orderProceedViewModel=Provider.of<OrderProceedViewModel>(context,listen: false);
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
          Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(orderProceedViewModel.selectedAddress!.streetAddress
                  .toString()),
              Row(
                children: [
                  Text(
                    orderProceedViewModel.selectedAddress!.thanaId
                        .toString() +
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
                      orderProceedViewModel.selectedAddress!.district
                          .toString(),
                      style: TextStyle(
                          fontWeight:
                          FontWeight.bold,
                          fontSize: 12)),
                ],
              )
            ],
          ),
          GestureDetector(
            onTap: (){
              print("Change>>>>>>>>>>>>>>>>>>>>>>>>>");
              final provider=Provider.of<OrderProceedViewModel>(context,listen: false);
              // provider.setChangeButton(true);
              // provider.setSelected(true);
              // provider.setSelectButton(false);
              // WidgetsBinding.instance.addPostFrameCallback((_){
              //   // Add Your Code here.
              //   print("Change");
              //   orderProceedViewModel.setChangeButton(true);
              //   orderProceedViewModel.setSelected(true);
              //   orderProceedViewModel.setSelectButton(false);
              // });
            },
            child: Container(
              color: Colors.blueAccent,
              margin: EdgeInsets.only(right: 20),
              child: Center(
                child: Text(
                  'Change',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 12
                  ),
                ),

              ),
            ),
          )
        ],
      ),
    );
  }
}
