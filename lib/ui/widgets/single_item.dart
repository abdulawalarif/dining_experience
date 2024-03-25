import 'package:flutter/material.dart';

import '../../core/models/mystery_search_model.dart';

class SingleItemOnSearch extends StatelessWidget {
  final Businesses oneBusiness;
  const SingleItemOnSearch({super.key, required this.oneBusiness});

  @override
  Widget build(BuildContext context) {
    double productImageSize = MediaQuery.of(context).size.width * 0.9;

    return SizedBox(
      height: productImageSize + 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            oneBusiness.imageUrl ?? '',
            height: productImageSize - 15,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              oneBusiness.name ?? '',
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}
