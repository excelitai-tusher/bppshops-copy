import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  double start = 30.0;
  double end = 50.0;
  bool? men = false;
  bool? women = false;
  bool? kids = false;
  bool? fashion = false;
  bool? salah = false;
  bool? fragrance = false;
  bool? anjan = false;
  bool? kay = false;
  bool? gentle = false;
  bool? arong = false;
  bool? taga = false;
  bool? dorjibari = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                FittedBox(
                  child: Text(
                    "By Catagories",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .05,
                  width: MediaQuery.of(context).size.width * .4,
                  child: CheckboxListTile(
                    title: Text(
                      "Men",
                      style: TextStyle(fontSize: 14, color: Colors.black45),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: men,
                    onChanged: (bool? value) {
                      setState(() {
                        men = value;
                      });
                    },
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .05,
                  width: MediaQuery.of(context).size.width * .4,
                  child: CheckboxListTile(
                    title: Text(
                      "Women",
                      style: TextStyle(fontSize: 14, color: Colors.black45),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: women,
                    onChanged: (bool? value) {
                      setState(() {
                        women = value;
                      });
                    },
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .05,
                  width: MediaQuery.of(context).size.width * .4,
                  child: CheckboxListTile(
                    title: Text(
                      "Kids",
                      style: TextStyle(fontSize: 14, color: Colors.black45),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: kids,
                    onChanged: (bool? value) {
                      setState(() {
                        kids = value;
                      });
                    },
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .05,
                  width: MediaQuery.of(context).size.width * .4,
                  child: CheckboxListTile(
                    title: FittedBox(
                        child: Text(
                      "Modest Fashion",
                      style: TextStyle(fontSize: 14, color: Colors.black45),
                    )),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: fashion,
                    onChanged: (bool? value) {
                      setState(() {
                        fashion = value;
                      });
                    },
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .05,
                  width: MediaQuery.of(context).size.width * .4,
                  child: CheckboxListTile(
                    title: FittedBox(
                        child: Text(
                      "Salah Accessories",
                      style: TextStyle(fontSize: 14, color: Colors.black45),
                    )),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: salah,
                    onChanged: (bool? value) {
                      setState(() {
                        salah = value;
                      });
                    },
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .05,
                  width: MediaQuery.of(context).size.width * .4,
                  child: CheckboxListTile(
                    title: FittedBox(
                        child: Text(
                      "Fragrance",
                      style: TextStyle(fontSize: 14, color: Colors.black45),
                    )),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: fragrance,
                    onChanged: (bool? value) {
                      setState(() {
                        fragrance = value;
                      });
                    },
                  ),
                ),
              ]),
              Column(children: [
                FittedBox(
                  child: Text(
                    "By Brands",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .05,
                  width: MediaQuery.of(context).size.width * .4,
                  child: CheckboxListTile(
                    title: Text(
                      "Ajan's",
                      style: TextStyle(fontSize: 14, color: Colors.black45),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: anjan,
                    onChanged: (bool? value) {
                      setState(() {
                        anjan = value;
                      });
                    },
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .05,
                  width: MediaQuery.of(context).size.width * .4,
                  child: CheckboxListTile(
                    title: Text(
                      "Kay kraft",
                      style: TextStyle(fontSize: 14, color: Colors.black45),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: kay,
                    onChanged: (bool? value) {
                      setState(() {
                        kay = value;
                      });
                    },
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .05,
                  width: MediaQuery.of(context).size.width * .4,
                  child: CheckboxListTile(
                    title: FittedBox(
                        child: Text(
                      "Gentle Park",
                      style: TextStyle(fontSize: 14, color: Colors.black45),
                    )),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: gentle,
                    onChanged: (bool? value) {
                      setState(() {
                        gentle = value;
                      });
                    },
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .05,
                  width: MediaQuery.of(context).size.width * .4,
                  child: CheckboxListTile(
                    title: Text(
                      "Aarong",
                      style: TextStyle(fontSize: 14, color: Colors.black45),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: arong,
                    onChanged: (bool? value) {
                      setState(() {
                        arong = value;
                      });
                    },
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .05,
                  width: MediaQuery.of(context).size.width * .4,
                  child: CheckboxListTile(
                    title: Text(
                      "Taga",
                      style: TextStyle(fontSize: 14, color: Colors.black45),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: taga,
                    onChanged: (bool? value) {
                      setState(() {
                        taga = value;
                      });
                    },
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .05,
                  width: MediaQuery.of(context).size.width * .4,
                  child: CheckboxListTile(
                    title: FittedBox(
                        child: Text(
                      "Dorjibari",
                      style: TextStyle(fontSize: 14, color: Colors.black45),
                    )),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: dorjibari,
                    onChanged: (bool? value) {
                      setState(() {
                        dorjibari = value;
                      });
                    },
                  ),
                ),
              ])
            ]),
            SizedBox(height: 20,),
            Text(
              "By Price",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RangeSlider(
                  values: RangeValues(start, end),
                  labels: RangeLabels(start.toString(), end.toString()),
                  onChanged: (value) {
                    setState(() {
                      start = value.start;
                      end = value.end;
                    });
                  },
                  min: 10.0,
                  max: 80.0,
                ),
                Text(
                  "Range: ${start.toStringAsFixed(2)}-${end.toStringAsFixed(2)} ",
                  style: const TextStyle(
                    fontSize: 32.0,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.filter_alt_outlined,color: Colors.white,),
                        Text('Filter',style: TextStyle(fontSize: 16, color: Colors.white),),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Container(
                    padding:EdgeInsets.symmetric(horizontal: 20,vertical:0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Theme.of(context).primaryColor)),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Clear All Filter',
                          style: TextStyle(color: Theme.of(context).primaryColor),
                        )),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
