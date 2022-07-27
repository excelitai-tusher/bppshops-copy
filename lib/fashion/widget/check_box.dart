import 'package:bpp_shop/FASHION/Widget/demofilter.dart';
import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
  @override
  CheckboxWidgetState createState() => new CheckboxWidgetState();
}

class CheckboxWidgetState extends State {
  Map<String, bool> values = {
    'Apple': false,
    'Banana': false,
    'Cherry': false,
    'Mango': false,
    'Orange': false,
  };

  var tmpArray = [];

  getCheckboxItems() {
    values.forEach((key, value) {
      if (value == true) {
        tmpArray.add(key);
      }
    });

    // Printing all selected items on Terminal screen.
    print(tmpArray);
    // Here you will get all your selected Checkbox items.

    // Clear array after use.
    tmpArray.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
   
      Row(
        children: [
          Expanded(
            child: ListView(shrinkWrap: true,
              children: values.keys.map((String key) {
                return new CheckboxListTile(
                  title: new Text(key),
                  value: values[key],
                  activeColor: Colors.pink,
                  checkColor: Colors.white,
                  onChanged: (bool? value) {
                    setState(() {
                      values[key] = value!;
                    });
                    print(values[key]);
                    // print(teml)
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
      ElevatedButton(
          onPressed: () {
            getCheckboxItems();
            Future.delayed(Duration(seconds: 4), () {
               Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => Filtter(),
                      settings: RouteSettings(
                        arguments: values,
                      )),
                );

            });
          },
          child: Text('Submit')),
      SizedBox(
        height: 100,
      )
    ]);
  }
}
