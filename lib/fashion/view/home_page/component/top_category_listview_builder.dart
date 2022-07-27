
import 'package:bpp_shop/fashion/model/top_categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopCategoryListviewBuilder extends StatelessWidget {
  const TopCategoryListviewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(left: 10.w, top: 10.h, bottom: 10.h),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 8.w,
            );
          },
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: TopCategoriModel.list.length,
          itemBuilder: (BuildContext context, i) {
            TopCategoriModel categoriData = TopCategoriModel.list[i];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 55.w,
                  width: 55.w,
                  //color: Colors.deepOrangeAccent,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage(categoriData.imagePath.toString()),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                categoriData.categoriName.toString(),
                style: TextStyle(
                  fontSize: 12.sp,
                ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
