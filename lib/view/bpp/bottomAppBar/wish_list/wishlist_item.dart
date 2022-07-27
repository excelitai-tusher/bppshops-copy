import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../view_model/bpp/wishlist_provider.dart';

class WishItems extends StatefulWidget {
  //const CartItems({Key? key}) : super(key: key);
  final int? id;
 final String? productId;
  final String? name;
  final int? quantity;
  final double? price;
  final double? shipping;
  final String? imageUrl;
  WishItems(
      {this.id,
     this.productId,
        this.price,
        this.shipping,
        this.quantity,

        this.name,
        this.imageUrl});

  @override
  State<WishItems> createState() => _WishItemsState();
}

class _WishItemsState extends State<WishItems> {
  @override
  Widget build(BuildContext context) {

    return Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child:ListTile(
          isThreeLine: true,
          subtitle: FittedBox(
            child: Container(
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Icon(Icons.star,color: Theme.of(context).primaryColor,size: 12,),
                    Icon(Icons.star,color: Theme.of(context).primaryColor,size: 12,),
                    Icon(Icons.star,color: Theme.of(context).primaryColor,size: 12,),
                    Icon(Icons.star,color: Theme.of(context).primaryColor,size: 12,),
                    Icon(Icons.star,color: Theme.of(context).primaryColor,size: 12,),
                    Text('(10 Reviews)'),
                  ],),
                  Text('Tk ${widget.price}'),
                ],
              ),
            ),
          ),
          leading: Container(
              width: 80,
              child: Image.network('${widget.imageUrl}',fit: BoxFit.cover,)),
          title: Text('${widget.name}',style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
          trailing: Container(
            width: 100,
            child: Row(children: [
              IconButton(onPressed: (){
                // Provider.of<Cart>(context, listen:
                // false).addItem(widget.id.toString(),
                //     widget.productId.toString(),widget.price!,widget.shipping!, widget.name.toString(), widget.imageUrl.toString());

              }, icon: Icon(Icons.shopping_cart_outlined,color: Theme.of(context).primaryColor,)),
              IconButton(onPressed: (){

                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text('Are you sure?'),
                      content: Text('Do you want to remove the item?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: Text('NO'),
                        ),
                        TextButton(
                            onPressed: () {
                              Provider.of<Wish>(context, listen: false).removeItem(widget.productId);
                              Navigator.of(ctx).pop(true);
                            },
                            child: Text('Yes'))
                      ],
                    ));


              }, icon: Icon(Icons.close,color: Theme.of(context).errorColor,)),
            ],),
          ),
        )
    );

  }
}
