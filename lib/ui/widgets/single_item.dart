import 'package:flutter/material.dart';

import '../../core/models/mystery_search_model.dart';

class SingleItemOnSearch extends StatelessWidget {
  final Businesses oneBusiness;
  const SingleItemOnSearch({super.key, required this.oneBusiness});

  @override
  Widget build(BuildContext context) {
    double productImageSize = MediaQuery.of(context).size.width * 0.9;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: productImageSize + 20,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                oneBusiness.imageUrl ?? '',
                height: productImageSize - 45,
                width: double.infinity,
                fit: BoxFit.fill,

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
               'Name: ${ oneBusiness.name ?? ''}',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ), Padding(
              padding: const EdgeInsets.only(top: .5),
              child: Text(
               'Category: ${ oneBusiness.categories?.first.title ?? ''}',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
