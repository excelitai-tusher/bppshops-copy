import 'package:bpp_shop/view_model/bpp/cart_provider.dart';
import 'package:bpp_shop/view/islamic/productDetails/bottom_sheet.dart';
import 'package:bpp_shop/view/islamic/tap_bar/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  static const routeName = '/detail';

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  // int count = 1;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    final args = ModalRoute.of(context)!.settings.arguments as MyBottomSheet;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Center(
            child: Text(
              "Product Details",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_outlined,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            //height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5),
                    color: Colors.grey.shade200,
                    image: DecorationImage(
                      image: NetworkImage("${args.productImage}"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height * .1,
                          width: MediaQuery.of(context).size.width * .28,
                          decoration: new BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.5),
                            color: Colors.grey.shade200,
                            image: new DecorationImage(
                              image: NetworkImage("${args.productImage}"),
                              fit: BoxFit.fill,
                            ),
                          )),
                      Container(
                          height: MediaQuery.of(context).size.height * .1,
                          width: MediaQuery.of(context).size.width * .28,
                          decoration: new BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.5),
                            color: Colors.grey.shade200,
                            image: new DecorationImage(
                              image: NetworkImage("${args.productImage}"),
                              fit: BoxFit.fill,
                            ),
                          )),
                      Container(
                          height: MediaQuery.of(context).size.height * .1,
                          width: MediaQuery.of(context).size.width * .28,
                          decoration: new BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.5),
                            color: Colors.grey.shade200,
                            image: new DecorationImage(
                              image: NetworkImage("${args.productImage}"),
                              fit: BoxFit.fill,
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "${args.productName}",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: '৳ ${args.productPrice}  ',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.green),
                        children: <TextSpan>[
                          args.productPrePrice != "0.00"
                              ? TextSpan(
                                  text: '৳ ${args.productPrePrice}',
                                  style: TextStyle(
                                      color: Theme.of(context).errorColor,
                                      fontSize: 15,
                                      decoration: TextDecoration.lineThrough),
                                )
                              : TextSpan(text: ""),
                        ],
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        text: 'Availability: ',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'In stock',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                args.size == "null" || args.size == null
                    ? Container()
                    : Row(
                        children: [
                          const Text(
                            'Size:  ',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                "${args.size}",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                const SizedBox(
                  height: 10,
                ),
                args.color == "null" || args.color == null
                    ? Container()
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Color:  ',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      width: 1, color: Colors.amber)),
                              child: Text("${args.color}"),
                            ),
                          ),
                        ],
                      ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Quantity    ',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .4,
                      height: 40,
                      //  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
// padding: EdgeInsets.symmetric(vertical: 0,horizontal: 6),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(6)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (args.qty > 1) args.qty--;
                              });
                            },
                            icon: Icon(Icons.remove),
                          ),
                          Text(
                            '${args.qty}',
                            style: TextStyle(fontSize: 18),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                args.qty++;
                              });
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: SizedBox(
                    width: 250,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        cart.addItem(
                          args.productId!,
                          args.productPrice!,
                          args.productName.toString(),
                          args.productImage.toString(),
                          args.qty,
                        );
                        print("product details added");
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 18,
                      ),
                      label: Text(
                        'Add to Bag',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    FittedBox(
                        child: Text(
                      "Share",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    )),
                    SizedBox(
                      width: 15,
                    ),
                    Image(
                      image: AssetImage("assets/icons/facebook.webp"),
                      fit: BoxFit.cover,
                      height: 25,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Image(
                      image: AssetImage("assets/icons/youtube.webp"),
                      fit: BoxFit.cover,
                      height: 25,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Image(
                      image: AssetImage("assets/icons/twitter.webp"),
                      fit: BoxFit.cover,
                      height: 25,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Image(
                      image: AssetImage("assets/icons/linkedin.webp"),
                      fit: BoxFit.cover,
                      height: 25,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: 350,
                    child: TabBarScreen(
                      details: args.productDetail!,
                      video: args.video,
                    )),
                SizedBox(
                  height: 10,
                ),
                const Text(
                  "Related Products",
                  style: TextStyle(color: Colors.black),
                ),
                const Divider(
                  color: Colors.amber,
                  thickness: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
