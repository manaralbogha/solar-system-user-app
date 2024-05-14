import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/modules/order/devices_screen/cubit/cubit.dart';
import 'package:solar_system/modules/order/devices_screen/cubit/states.dart';
import 'package:solar_system/shared/components/rowTextButtonTextButtonWidget.dart';

import '../../../models/model_product_for_company.dart';
import '../../../shared/components/row_text_text_widget.dart';
import '../../../shared/const/const.dart';

class EditSuggestedProductScreen extends StatelessWidget {
  const EditSuggestedProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // String? name1 = '';
    // String? name2 = '';
    // String? valueWattage = '';
    // String? valueSize = '';
    final arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final List<Products> generalProduct = arg['generalProduct'];

    return BlocConsumer<DevicesCubit, DevicesStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = DevicesCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: ListView.builder(
            itemCount: generalProduct.length,
            itemBuilder: ((context, indexList) {
              return InkWell(
                onTap: () {
                  if (generalProduct[indexList].categore!.id == 2) {
                    cubit.indexPanel = indexList;
                  } else if (generalProduct[indexList].categore!.id == 4) {
                    cubit.indexBatter = indexList;
                  } else if (generalProduct[indexList].categore!.id == 3) {
                    cubit.indexInverter = indexList;
                  } else {
                    cubit.indexGenerator = indexList;
                  }

                  cubit.selectNewProduct();
                  Navigator.pop(context);
                },
                child: Padding(
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
                        SizedBox(
                          width: 150,
                          height: 150,
                          child: Image.network(
                            endPointImage + generalProduct[indexList].image,
                            fit: BoxFit.cover,
                          ),
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
                                generalProduct[indexList].name,
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
                                generalProduct[indexList].features!.length,
                                (index) {
                                  return RowTextText(
                                    sized1: 60,
                                    name:
                                        "${generalProduct[indexList].features![index].name.toString()} : ",
                                    number: generalProduct[indexList]
                                        .features![index]
                                        .value
                                        .toString(),
                                  );
                                },
                              ),
                            ),

                            //RowTextText(name: 'Quantity : ', number: '1'),
                            // RowTextText(
                            //     name: name1.toString(),
                            //     number: valueWattage.toString()),
                            // RowTextText(
                            //     name: name2.toString(),
                            //     number: valueSize.toString()),
                            RowTextText(
                                sized1: 60,
                                name: 'Price : ',
                                number: generalProduct[indexList].price),
                            RowTextButtonTextButton(
                                name: 'Quantity : ',
                                onPressedRemove: () {
                                  cubit.removeQuantity(
                                      generalProduct[indexList]);
                                },
                                onPressedAdd: () {
                                  cubit.addQuantity(generalProduct[indexList]);
                                },

                                // onPressedRemove: () {
                                //   cubit.removeQuantity(generalProduct[indexList]);
                                // },
                                // onPressedAdd: () {
                                //   cubit.addQuantity(generalProduct[indexList]);
                                // },
                                countNum: generalProduct[indexList]
                                    .quantity
                                    .toString()),
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
