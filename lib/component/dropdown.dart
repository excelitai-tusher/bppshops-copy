import 'package:flutter/material.dart';

class MyDropDown extends StatefulWidget {
  const MyDropDown({Key? key}) : super(key: key);

  @override
  _MyDropDownState createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  String dropdownValue = 'sort';
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(canvasColor: Colors.white),
      child: DropdownButton<String>(

        value: dropdownValue,
        icon: const Icon(Icons.arrow_drop_down),

        elevation: 16,
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>[
          'sort',
          'price:Low to High',
          'Price:high to low',
          'Oldest First',
          'Newest First',
          'Release Date',
          'Average Ratting'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
