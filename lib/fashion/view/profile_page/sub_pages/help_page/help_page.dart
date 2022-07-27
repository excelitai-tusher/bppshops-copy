
import 'package:bpp_shop/fashion/controller/app_bar_controler.dart';
import 'package:bpp_shop/fashion/controller/peimary_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: (){
            final status =
            Provider.of<PrimaryScreenState>(context, listen: false);
            status.setPrimaryState(true);
            final primaryPageState = Provider.of<PrimaryPageController>(context,listen: false);
            primaryPageState.setPrimaryPage(3);
          },
          child: Icon(Icons.arrow_back_ios,
            size: 18,
            color: Colors.black,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: Text("Help",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            children: [
              Image(
                image: AssetImage("images/image 44.png"),
              ),
              SizedBox(height: 50,),
              Text("How can we help you?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30,),
              Text("Lorem ipsum is placeholder text commonly \n used in the graphic print and publishing \n industries for previewing layouts \n and visual mockups.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 30,
                                    offset: Offset(0, 8), // Shadow position
                                  ),

                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 25),
                                child: Column(
                                  children: [
                                    Image(image: AssetImage("images/image 47.png"),
                                    ),
                                    SizedBox(height: 20,),
                                    Text("Chat to us",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 30,
                              offset: Offset(0, 8), // Shadow position
                            ),

                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: Column(
                            children: [
                              Image(image: AssetImage("images/image 46.png"),
                              ),
                              SizedBox(height: 20,),
                              Text("Email us",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
