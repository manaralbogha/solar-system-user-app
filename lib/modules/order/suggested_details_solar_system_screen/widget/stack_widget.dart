import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../models/model_suggested_solar_system.dart';
import '../../../../shared/components/row_text_text_widget.dart';
import '../../../../shared/const/const.dart';

class StackWidget extends StatelessWidget {
  const StackWidget(
      {super.key,
      required this.indexInverter,
      this.batteries,
      this.inverters,
      this.panels});
  final int indexInverter;
  final List<Batteries>? batteries;
  final List<Panels>? panels;
  final List<Inverters>? inverters;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 15),
          //  height: 250,
          width: double.infinity,
          child: Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Colors.blue),
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 150,
                        width: 130,
                        child: Center(
                          child: Image.network(
                            panels != null
                                ? endPointImage +
                                    panels![indexInverter].image.toString()
                                : batteries != null
                                    ? endPointImage +
                                        batteries![indexInverter]
                                            .image
                                            .toString()
                                    : endPointImage +
                                        inverters![indexInverter]
                                            .image
                                            .toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 100,
                            child: AutoSizeText(
                              panels != null
                                  ? panels![indexInverter].name.toString()
                                  : batteries != null
                                      ? batteries![indexInverter]
                                          .name
                                          .toString()
                                      : inverters![indexInverter]
                                          .name
                                          .toString(),
                              style: const TextStyle(
                                fontSize: 25,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                                //color: Colors.indigo.shade300,
                              ),
                              minFontSize: 8,
                              maxLines: 2,
                              //overflow: TextOverflow.ellipsis,
                              // textAlign: TextAlign.center,
                            ),
                          ),
                          // const Divider(
                          //   endIndent: 40,
                          //   indent: 40,
                          //   thickness: 2,
                          //   height: 30,
                          //   color: Colors.amber,
                          // ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 80,
                            child: Column(
                              children: List.generate(
                                panels != null
                                    ? panels![indexInverter].features!.length
                                    : batteries != null
                                        ? batteries![indexInverter]
                                            .features!
                                            .length
                                        : inverters![indexInverter]
                                            .features!
                                            .length,
                                (index) {
                                  return Row(
                                    children: [
                                      RowTextText(
                                        sized1: 85,
                                        sized: 50,
                                        size: 15,
                                        name: panels != null
                                            ? '${panels![indexInverter].features![index].name} : '
                                            : batteries != null
                                                ? '${batteries![indexInverter].features![index].name} : '
                                                : '${inverters![indexInverter].features![index].name} : ',
                                        number: panels != null
                                            ? '${panels![indexInverter].features![index].value}'
                                            : batteries != null
                                                ? '${batteries![indexInverter].features![index].value}'
                                                : '${inverters![indexInverter].features![index].value}',
                                      ),
                                      SizedBox(
                                        width: 50,
                                        child: AutoSizeText(
                                          panels != null
                                              ? '${panels![indexInverter].features![index].suffix}'
                                              : batteries != null
                                                  ? '${batteries![indexInverter].features![index].suffix}'
                                                  : '${inverters![indexInverter].features![index].suffix}',

                                          style: const TextStyle(
                                            fontSize: 20,
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.bold,
                                            // color: Colors.indigo.shade300,
                                          ),
                                          minFontSize: 8,
                                          maxLines: 2,
                                          //overflow: TextOverflow.ellipsis,
                                          // textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: AutoSizeText(
                              panels != null
                                  ? ' ${panels![indexInverter].price} S.P  (1)'
                                  : batteries != null
                                      ? ' ${batteries![indexInverter].price} S.P  (1)'
                                      : ' ${inverters![indexInverter].price} S.P  (1)'
                                          .toString(),

                              style: TextStyle(
                                backgroundColor: Colors.blue.shade100,
                                fontSize: 30,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              minFontSize: 8,
                              maxLines: 1,
                              //overflow: TextOverflow.ellipsis,
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 70,
                      ),
                      const SizedBox(
                        width: 60,
                        child: AutoSizeText(
                          'Total : ',
                          style: TextStyle(
                            // backgroundColor: Colors.blue.shade100,
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          minFontSize: 8,
                          maxLines: 2,
                          //overflow: TextOverflow.ellipsis,
                          // textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: AutoSizeText(
                          //'1000000 S.P',
                          panels != null
                              ? ' ${(int.parse(panels![indexInverter].price.toString()) * panels![indexInverter].panelAmount!.toInt())} S.P (${panels![indexInverter].panelAmount}) '
                              : batteries != null
                                  ? ' ${(int.parse(batteries![indexInverter].price.toString()) * batteries![indexInverter].batteryAmount!.toInt())} S.P (${batteries![indexInverter].batteryAmount}) '
                                  : ' ${inverters![indexInverter].price.toString()}  S.P (1) '
                                      .toString(),

                          style: TextStyle(
                            backgroundColor: Colors.blue.shade100,
                            fontSize: 30,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          minFontSize: 8,
                          maxLines: 1,
                          //overflow: TextOverflow.ellipsis,
                          // textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          // height: 40,
          //width: 40,
          padding: const EdgeInsets.all(6),
          margin: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color: Colors.blue.shade200,
            border: Border.all(color: Colors.blue, width: 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Text(
            panels != null
                ? panels![indexInverter].panelAmount.toString()
                : batteries != null
                    ? batteries![indexInverter].batteryAmount.toString()
                    : "1",
            style: const TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
