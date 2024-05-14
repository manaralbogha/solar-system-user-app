import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../../../../models/model_product_for_company.dart';
import '../../../../shared/components/row_text_text_widget.dart';
import '../../../../shared/const/const.dart';

class SuggestedGeneralProductWidget extends StatelessWidget {
  const SuggestedGeneralProductWidget({
    super.key,
    required this.generalProduct,
    required this.indexPanel,
    required this.indexBatter,
    required this.indexInverter,
    required this.indexGenerator,
    required this.productsSelected,
  });
  final List<Products> generalProduct;
  final int indexPanel;
  final int indexBatter;
  final int indexInverter;
  final int indexGenerator;
  final List<Products> productsSelected;

  @override
  Widget build(BuildContext context) {
    int? indexGeneral = 0;
    // final arg =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // String? valueWattage = '';
    // String? valueSize = '';
    // String? name1 = '';
    // String? name2 = '';

    // if (generalProduct[indexGeneral].categore!.id == 2) {
    //   name1 = 'Watts : ';
    //   name2 = 'Size : ';
    //   indexGeneral = indexPanel;
    // } else if (generalProduct[indexGeneral].categore!.id == 3) {
    //   name1 = 'Volts : ';
    //   name2 = 'Amber : ';
    //   indexGeneral = indexBatter;
    // } else if (generalProduct[indexGeneral].categore!.id == 4) {
    //   name1 = 'Watts : ';
    //   name2 = 'Volts : ';
    //   indexGeneral = indexInverter;
    // } else {
    //   name1 = 'Volts : ';
    //   name2 = 'Weight : ';
    //   indexGeneral = indexGenerator;
    //}
    if (generalProduct[indexGeneral].categore!.id == 2) {
      indexGeneral = indexPanel;
    } else if (generalProduct[indexGeneral].categore!.id == 3) {
      indexGeneral = indexBatter;
    } else if (generalProduct[indexGeneral].categore!.id == 4) {
      indexGeneral = indexInverter;
    } else {
      indexGeneral = indexGenerator;
    }
    productsSelected.add(generalProduct[indexGeneral]);
    // productsSelected.forEach((element) {
    //   print(element.name);
    // });

    return ConditionalBuilder(
      condition: generalProduct.length != (0),
      builder: ((context) {
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1,
                color: Colors.green,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  endPointImage + generalProduct[indexGeneral!].image,
                  fit: BoxFit.cover,
                  height: 150,
                  width: 150,
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 180,
                      child: Text(
                        generalProduct[indexGeneral].name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        generalProduct[indexGeneral].features!.length,
                        (index) {
                          return RowTextText(
                            sized1: 60,
                            name:
                                "${generalProduct[indexGeneral!].features![index].name.toString()} : ",
                            number: generalProduct[indexGeneral]
                                .features![index]
                                .value
                                .toString(),
                          );
                        },
                      ),
                    ),
                    RowTextText(
                        sized1: 60,
                        name: 'Quantity : ',
                        number:
                            generalProduct[indexGeneral].quantity.toString()),
                    // RowTextText(
                    //     name: name1.toString(), number: valueWattage.toString()),
                    // RowTextText(
                    //     name: name2.toString(), number: valueSize.toString()),
                    RowTextText(
                        sized1: 60,
                        name: 'Price : ',
                        number: generalProduct[indexGeneral].price),
                    RowTextText(
                        sized1: 90,
                        name: 'total Price : ',
                        number: (int.parse(generalProduct[indexGeneral].price) *
                                generalProduct[indexGenerator].quantity)
                            .toString()),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, '/EditSuggestedProductScreen',
                            arguments: {
                              'generalProduct': generalProduct,
                            });
                      },
                      child: const Text('Edit Product'),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      }),
      fallback: ((context) => const Center(
              child: SizedBox(
            height: 0,
          ))),
    );
  }
}
