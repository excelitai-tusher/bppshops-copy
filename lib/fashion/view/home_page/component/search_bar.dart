
import 'package:bpp_shop/fashion/controller/product_detail_controller.dart';
import 'package:bpp_shop/fashion/model/best_selling_product.dart';
import 'package:bpp_shop/fashion/view/product_details/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Search extends SearchDelegate{



  final product=BestSellingProductModel();

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    assert(theme != null);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        brightness: colorScheme.brightness,
        backgroundColor: colorScheme.brightness == Brightness.dark ? Colors.grey[900] : Colors.amber,
        iconTheme: theme.primaryIconTheme.copyWith(color: Colors.black),
        textTheme: theme.textTheme,
      ),
      inputDecorationTheme: searchFieldDecorationTheme ??
          InputDecorationTheme(
            hintStyle: searchFieldStyle ?? theme.inputDecorationTheme.hintStyle,
            border: InputBorder.none,
          ),
    );
  }


  @override
  List<Widget>? buildActions(BuildContext context)=> [
    IconButton(
      icon: Icon(Icons.clear),
      onPressed: () {
        if (query.isEmpty) {
          close(context, '');
        }
        else {
          query = '';
          showSuggestions(context);
        }
      },
    )
  ];



  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, ''),
    );
  }



  @override
  Widget buildResults(BuildContext context) {
    return ProductDetail();
  }



  @override
  Widget buildSuggestions(BuildContext context) {
    final list=product.getList;
    final suggestions = query.isEmpty
        ? product.getList
        : list.where((product) {
      final prodLower = product.productName!.toString().toLowerCase();
      final queryLower = query.toLowerCase();

      return prodLower.startsWith(queryLower);
    }).toList();

    return buildSuggestionsSuccess(suggestions);
  }





  Widget buildSuggestionsSuccess(List<BestSellingProductModel> suggestions) => ListView.builder(
    itemCount: suggestions.length,
    itemBuilder: (context, index) {
      final suggestion = suggestions[index].productName.toString();
      final queryText = suggestion.substring(0, query.length);
      final remainingText = suggestion.substring(query.length);

      return ListTile(
        onTap: () {
          query = suggestion;
          final view = Provider.of<ProductDetailController>(context, listen: false);
          view.setProductData(
            suggestions[index].imageUrl.toString(),
            suggestions[index].productName.toString(),
            suggestions[index].productPrice.toString(),
          );
          showResults(context);


        },
        leading: Icon(Icons.location_city),
        // title: Text(suggestion),
        title: RichText(
          text: TextSpan(
            text: queryText,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            children: [
              TextSpan(
                text: remainingText,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );

}