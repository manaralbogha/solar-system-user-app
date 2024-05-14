import 'package:flutter/material.dart';

import '../../../../../models/model_appointment_orders_screen.dart';
import '../../../../../shared/components/row_text_text_widget.dart';
import '../../../../../shared/const/const.dart';

class CardProductWidget extends StatelessWidget {
  const CardProductWidget({super.key, required this.product});
  final Products product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return SingleChildScrollView(
              child: Container(
                // width: 200,
                // height: 600,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  border: Border.all(color: Colors.green, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.5),
                      spreadRadius: 0.5,
                      blurRadius: 7,
                      // offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                margin: EdgeInsets.all(30),
                padding: EdgeInsets.all(20),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      // width: 150,
                      child: Text(
                        product.product!.name.toString(),
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff964B00),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Image.network(
                      endPointImage + product.product!.image.toString(),
                      fit: BoxFit.cover,
                      height: 300,
                      width: double.infinity,
                    ),
                    const Divider(
                      thickness: 2,
                      height: 30,
                      endIndent: 30,
                      indent: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        product.product!.features!.length,
                        (index) {
                          return RowTextText(
                            size: 20,
                            name:
                                "${product.product!.features![index].name} : ",
                            number: product.product!.features![index].value
                                .toString(),
                          );
                        },
                      ),
                    ),
                    RowTextText(
                      size: 20,
                      name: 'Amount : ',
                      number: product.productAmmount.toString(),
                    ),
                    RowTextText(
                      size: 20,
                      name: 'Price : ',
                      number: product.product!.price.toString(),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Colors.green,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              product.product!.name.toString(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff964B00),
              ),
            ),
            Image.network(
              endPointImage + product.product!.image.toString(),
              fit: BoxFit.cover,
              height: 150,
              width: 150,
            ),
          ],
        ),
      ),
    );
  }
}
