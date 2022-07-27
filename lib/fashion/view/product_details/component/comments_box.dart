import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CommentsBox extends StatelessWidget {
  CommentsBox({
    Key? key,
    this.userImageUrl,
    this.userName,
    this.comments,
  }) : super(key: key);

  String? userImageUrl;
  String? userName;
  String? comments;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(userImageUrl!),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          userName!,
                          style: TextStyle(fontSize: 20),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color(0xffFF6000),
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xffFF6000),
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xffFF6000),
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xffFF6000),
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.grey,
                                  size: 15,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Text(
                      comments!,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
