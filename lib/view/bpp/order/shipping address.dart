import 'package:flutter/material.dart';

class CheckOutCard extends StatelessWidget {
  String? check;
 CheckOutCard(this.check);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFfff2df),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(leading: check=='check'? Icon(Icons.circle,size:13,color: Theme.of(context).colorScheme.primary,):Icon(Icons.circle,size:13,color: Colors.white,),
        title: check=='check'?Text('Your Location'):Text('Destination Address') ,
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
        ),
        trailing: Icon(Icons.edit,size:15,color: Theme.of(context).colorScheme.primary,),
      ),
    );

  }
}



