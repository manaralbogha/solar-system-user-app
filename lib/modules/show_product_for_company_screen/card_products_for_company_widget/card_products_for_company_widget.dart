import 'package:flutter/material.dart';

import '../../../models/model_product_for_company.dart';
import '../../../shared/components/row_text_text_widget.dart';
import '../../../shared/const/const.dart';

class CardProductsForCompanyWidget extends StatelessWidget {
  const CardProductsForCompanyWidget({super.key, required this.product});
  final Products product;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          width: 1,
          color: Colors.green,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
                child: Center(
                  child: Image.network(
                    endPointImage + product.image,
                    fit: BoxFit.cover,
                    height: 150,
                  ),
                ),
              ),
              const Divider(
                thickness: 2,
                // height: 30,
                endIndent: 30,
                indent: 30,
              ),
              const SizedBox(
                height: 10,
              ),
              RowTextText(
                sized1: 50,
                name: 'Name : ',
                number: product.name,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  product.features!.length,
                  (index) {
                    return RowTextText(
                      sized1: 60,
                      sized: 60,
                      name: "${product.features![index].name.toString()} : ",
                      number: product.features![index].value.toString(),
                    );
                  },
                ),
              ),
              RowTextText(
                sized1: 50,
                name: 'Price : ',
                number: product.price,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
