// import 'package:bpp_shop/view_model/islamic/http_request.dart';
// import 'package:flutter/material.dart';
//
//
// class TopRatedProduct extends StatefulWidget {
//   @override
//   State<TopRatedProduct> createState() => _TopRatedProductState();
// }
//
// class _TopRatedProductState extends State<TopRatedProduct> {
//   List<TopRated>?product;
//
//   HttpRequests _httpRequests =HttpRequests();
//   @override
//   void initState() {
//     // TODO: implement initState
//    getTopRated();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return product==null? Center(child: Text('No Product Found'),):FittedBox(
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         height:product!.length<3?MediaQuery.of(context).size.width/4:product!.length>=3?(MediaQuery.of(context).size.width/4)*2:0,
//
//         child: GridView.builder(
//             physics: NeverScrollableScrollPhysics(),
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 4/2,
//
//             ),
//             itemCount:product!.length==1?1:product!.length==2?2:product!.length==3?3:4,
//             itemBuilder: (context, index)  {
//               return  ListTile(
//                 isThreeLine: true,
//                 leading: Image.network("https://bppshops.com/${product![index].
//                 productThambnail}",fit: BoxFit.cover,),
//                 title: Padding(
//                   padding: const EdgeInsets.only(top: 15),
//                   child: Flexible(
//                     child: Text(
//                       "${product![index].productName}",
//                       style: TextStyle(color: Theme.of(context).errorColor),overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                 ),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Icon(
//                             Icons.star,
//                             color: Colors.amber,
//                             size: 12,
//                           ),
//                         ),
//                         Icon(
//                           Icons.star,
//                           color: Colors.amber,
//                           size: 12,
//                         ),
//                         Icon(
//                           Icons.star,
//                           color: Colors.amber,
//                           size: 12,
//                         ),
//                         Icon(
//                           Icons.star,
//                           color: Colors.amber,
//                           size: 12,
//                         ),
//                         Icon(
//                           Icons.star,
//                           color: Colors.grey,
//                           size: 12,
//                         ),
//                         Text(
//                           "(14)",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 12,
//                           ),
//                         )
//                       ],
//                     ),
//                     Text(
//                       "${product![index].categoryId}",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 12,
//                       ),
//                     )
//                   ],
//                 ),
//               );
//             }
//
//         ),
//       ),
//     );
//   }
//   getTopRated() async {
//     final value = await _httpRequests.httpGetRequest(suffixUrl: _httpRequests.islamicHomepage, returnValue: _httpRequests.returntopRated);
//     setState(() {
//       product=value;
//     });
//   }
//
// }
