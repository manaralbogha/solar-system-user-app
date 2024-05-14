import 'package:flutter/material.dart';

import 'package:numberpicker/numberpicker.dart';

import '../../../../models/model_devices_screen.dart';
import '../../../../shared/components/row_text_text_widget.dart';

class NumberPickerWidget extends StatefulWidget {
  final Data1 number;
  final String name;
  //int index;
  const NumberPickerWidget({
    super.key,
    required this.number,
    required this.name,
    //required this.index,
  });
  @override
  State<NumberPickerWidget> createState() => _NumberPickerWidgetState();
}

class _NumberPickerWidgetState extends State<NumberPickerWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RowTextText(
            name: widget.name,
            number: x(),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 5.0,
                  vertical: 20.0,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey.shade200,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                ),
                alignment: Alignment.center,
                height: 35,
              ),
              Positioned(
                  child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 15.0,
                      spreadRadius: 1.0,
                      offset: const Offset(
                        0.0,
                        0.0,
                      ),
                    ),
                  ],
                ),
              )),
              Container(
                alignment: Alignment.center,
                child: NumberPicker(
                  axis: Axis.horizontal,
                  itemHeight: 45,
                  itemWidth: 45.0,
                  step: 10,
                  selectedTextStyle: const TextStyle(
                    fontSize: 15.0,
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                  ),
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 10.0,
                  ),
                  itemCount: 7,
                  value: int.parse(x()),
                  minValue: 0,
                  maxValue: 100000,
                  onChanged: (v) {
                    //  print(v);
                    setState(
                      () {
                        if (widget.name == 'Voltage : ') {
                          widget.number.voltage = v.toString();
                        }
                        if (widget.name == 'Voltage Power : ') {
                          widget.number.voltagePower = v.toString();
                        }
                        // if (widget.name == 'fazes Number : ') {
                        //   widget.number.fazesNumber = v;
                        // }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          // Container(
          //   margin: const EdgeInsets.only(top: 50),
          //   child: Text(
          //     "Selected Value:- $_currentValue",
          //     style: const TextStyle(
          //       fontSize: 20,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  String x() {
    if (widget.name == 'Voltage : ') {
      return widget.number.voltage.toString();
    } else //if (widget.name == 'Voltage Power : ')
    {
      return widget.number.voltagePower.toString();
    }
    // return widget.number.fazesNumber.toString();
  }
}
