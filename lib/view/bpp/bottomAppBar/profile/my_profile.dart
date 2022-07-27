import 'dart:convert';
import 'package:bpp_shop/service/bpp/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);
  @override
  _MyProfileState createState() => _MyProfileState();
}
class _MyProfileState extends State<MyProfile>{
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  var userName = "";
  var userEmail = "";
  var userMobile = "";
  var imageUrl= "";
  var gender= '';
  List<String> _genders = ['Male', 'Female', 'Others']; // Option 2
  String? _selectedGender;
  Map? jsonData;

  @override
  void initState() {
    // TODO: implement initState
    getData();
  }

   getData() async {
    final token=await LocalStorageStore().getUserToken();
    var response = await http.get(
        Uri.parse('https://bppshops.com/api/user/profile/update'),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${token}',//5|zIut97rF1CJkSQU050Q8eGtRqmBXG8JoKv03A0CN',
        });
    print(response.statusCode.toString()+"<<<<<<<<<<<<");
    print(response.body.toString()+"<<<<<<<<<<<<");
    var json = jsonDecode(response.body);
    setState(() {
      jsonData=json;
      _nameController.text=json["user"]["name"].toString();
      _emailController.text=json["user"]["email"].toString();
      _phoneController.text=json["user"]["mobile"].toString();
      gender=json['user']["gender"].toString();
      print(gender);
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Profile"),
        centerTitle: true,
        actions: [
          Icon(Icons.edit),
          SizedBox(
            width: 20,
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  child:
                  jsonData!=null?CircleAvatar(
                    radius: MediaQuery
                        .of(context)
                        .size
                        .height * .06,
                    //maxRadius: 30,
                    backgroundColor: const Color(0xffe4e8e9),
                    backgroundImage: NetworkImage(
                        "https://ui-avatars.com/api/?name=${jsonData!["user"]["name"]}&color=7F9CF5&background=EBF4FF"
                    ), //imageUrl)
                  ):CircleAvatar(
                    radius: MediaQuery
                        .of(context)
                        .size
                        .height * .06,
                    //maxRadius: 30,
                    backgroundColor: const Color(0xffe4e8e9),
                    backgroundImage: NetworkImage("https://demofree.sirv.com/nope-not-here.jpg"), //imageUrl)
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //CircularProgressIndicator(),
              TextFormField(
                style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: .4),
                controller: _nameController,
                decoration: InputDecoration(
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    floatingLabelBehavior: FloatingLabelBehavior
                        .always,
                    labelText: "Name",
                    labelStyle: TextStyle(fontSize: 18, color: Colors
                        .black87, fontWeight: FontWeight.normal),
                    hintText: "",
                    hintStyle: TextStyle(fontSize: 14, color: Colors
                        .black54)),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    floatingLabelBehavior: FloatingLabelBehavior
                        .always,
                    labelText: "Email Address",
                    labelStyle: TextStyle(fontSize: 20, color: Colors
                        .black87),
                    hintText: "",
                    hintStyle: TextStyle(fontSize: 14, color: Colors
                        .black54),
                    suffix: SizedBox(
                      height: 30,
                      width: 80,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(
                                  Colors.orange)),
                          onPressed: () {},
                          child: Text("Verify")),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    floatingLabelBehavior: FloatingLabelBehavior
                        .always,
                    labelText: "Mobile",
                    labelStyle: TextStyle(fontSize: 20, color: Colors
                        .black87),
                    //hintText: "01723063565",
                    hintStyle: TextStyle(fontSize: 14, color: Colors
                        .black54)),
              ),
              SizedBox(
                height: 10,
              ),
              DropdownButton(
                dropdownColor: Colors.white,
                hint: Text(gender != '' ? gender : "Select Gender"),
                // Not necessary for Option 1
                value: _selectedGender,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedGender = newValue!;
                  });
                },
                items: _genders.map((location) {
                  return DropdownMenuItem(
                    child: Text(location),
                    value: location,
                  );
                }).toList(),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 90,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
                child: Column(
                  children: [
                    Container(
                      height: 30,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      decoration: BoxDecoration(
                        color: Color(0xfff8f8f8),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10)),
                        //border: Border.symmetric(vertical: BorderSide(color: Colors.grey))
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 20),
                          Icon(Icons.location_pin),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Select A Delivery Address")
                        ],
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                        },
                        child: Container(
                          margin:
                          EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .center,
                              children: [Text("+  New Address")],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 35,
                width: 100,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.orange)),
                  onPressed: () async {
                    //SharedPreferences pref = await SharedPreferences.getInstance() ;
                    final token=await LocalStorageStore().getUserToken();
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            backgroundColor:Colors.white,
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Profile Updating",style: TextStyle(color: Colors.black),),
                                SizedBox(height: 10,),
                                CircularProgressIndicator(color: Colors.orange,)
                              ],
                            )));

                    var response = await http.post(Uri.parse(
                        "https://bppshops.com/api/user/profile/store"),
                        headers: {
                          'Authorization': "Bearer ${token}",//5|zIut97rF1CJkSQU050Q8eGtRqmBXG8JoKv03A0CN"//"Bearer 2|DxhvHAAXvkxUXyV5KzKtKug9LQwBXObdLFZ7zAes"
                        },
                        body: {
                          "name": _nameController.text,
                          "email": _emailController.text,
                          "phone": _phoneController.text,
                          "gender": _selectedGender != null
                              ? _selectedGender
                              : gender,


                        }
                    );

                    if (response.statusCode == 200) {
                      setState(() {
                        getData();
                      });



                    }
                  },
                  child: Text("Submit"),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
