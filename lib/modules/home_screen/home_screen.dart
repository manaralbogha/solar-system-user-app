import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/modules/order/devices_screen/cubit/cubit.dart';
import 'package:solar_system/modules/order/devices_screen/cubit/states.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:at_gauges/at_gauges.dart';
import 'package:solar_system/shared/const/const.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // Widget _getGauge({bool isRadialGauge = true}) {
  //   if (isRadialGauge) {
  //     return _getRadialGauge();
  //   } else {
  //     return _getLinearGauge();
  //   }
  // }

  // Widget _getRadialGauge() {
  //   return SfRadialGauge(
  //       title: GaugeTitle(
  //           text: 'Speedometer',
  //           textStyle:
  //               const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
  //       axes: <RadialAxis>[
  //         RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
  //           GaugeRange(
  //               startValue: 0,
  //               endValue: 50,
  //               color: Colors.green,
  //               startWidth: 10,
  //               endWidth: 10),
  //           GaugeRange(
  //               startValue: 50,
  //               endValue: 100,
  //               color: Colors.orange,
  //               startWidth: 10,
  //               endWidth: 10),
  //           GaugeRange(
  //               startValue: 100,
  //               endValue: 150,
  //               color: Colors.red,
  //               startWidth: 10,
  //               endWidth: 10)
  //         ], pointers: <GaugePointer>[
  //           NeedlePointer(value: 90)
  //         ], annotations: <GaugeAnnotation>[
  //           GaugeAnnotation(
  //               widget: Container(
  //                   child: const Text('90.0',
  //                       style: TextStyle(
  //                           fontSize: 25, fontWeight: FontWeight.bold))),
  //               angle: 90,
  //               positionFactor: 0.5)
  //         ])
  //       ]);
  // }

  // Widget _getLinearGauge() {
  //   return Container(
  //     child: SfLinearGauge(
  //         minimum: 0.0,
  //         maximum: 100.0,
  //         orientation: LinearGaugeOrientation.horizontal,
  //         majorTickStyle: LinearTickStyle(length: 20),
  //         axisLabelStyle: TextStyle(fontSize: 12.0, color: Colors.black),
  //         axisTrackStyle: LinearAxisTrackStyle(
  //             color: Colors.cyan,
  //             edgeStyle: LinearEdgeStyle.bothFlat,
  //             thickness: 15.0,
  //             borderColor: Colors.grey)),
  //     margin: EdgeInsets.all(10),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    var cubit = DevicesCubit.get(context);
    cubit.surveys(token: token.toString());
    return BlocConsumer<DevicesCubit, DevicesStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final urlImages = [
          'assets/images/bg2-solar.jpg',
          'assets/images/bg3-solar.jpg',
          'assets/images/bg6-solar.jpg',
          'assets/images/bg-solar.jpg',
        ];

        return SingleChildScrollView(
          child: Column(
            children: [
              //  _getGauge(),

              // Center(
              //   child: Image.asset(
              //     'assets/images/bg-solar.jpg',

              //     fit: BoxFit.cover,
              //     //height: 150,
              //   ),
              // ),
              // Center(
              //   child: ElevatedButton(
              //     onPressed: () {
              //       cubit.totalWatt = 0;
              //       cubit.totalWattOnPower = 0;
              //       cubit.totalInverterWatt = 0;
              //       cubit.deviceCheck = [];

              //       Navigator.pushNamed(context, '/DevicesScreen');
              //     },
              //     child: const Text('Create Order'),
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CarouselSlider.builder(
                  disableGesture: true,
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    // enableInfiniteScroll: false,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                  ),
                  itemCount: urlImages.length,
                  itemBuilder: (context, index, realIndex) {
                    //  final urlImage = urlImages[index];
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        urlImages[index],
                        // fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ConditionalBuilder(
                condition: state is! SurveysLoadingState,
                builder: (context) {
                  if (state is SurveysSuccessState ||
                      cubit.surveyModel != null) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Card(
                                  elevation: 5,
                                  child: SimpleRadialGaugeWidget(
                                    number: cubit.surveyModel!.ourCompanies!
                                        .toDouble(),
                                    color: Colors.blue,
                                    icon: Icons.corporate_fare_outlined,
                                    text: 'Companies in the system',
                                    colorIcon: Colors.blue,
                                  )),
                              Card(
                                  elevation: 5,
                                  child: SimpleRadialGaugeWidget(
                                    number: cubit.surveyModel!.ourProduct!
                                        .toDouble(),
                                    color: Colors.red,
                                    icon: Icons.precision_manufacturing,
                                    text: 'Products in the system',
                                    colorIcon: Colors.red,
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Card(
                                  elevation: 5,
                                  child: SimpleRadialGaugeWidget(
                                    number:
                                        cubit.surveyModel!.ourTeams!.toDouble(),
                                    color: Colors.yellow,
                                    icon: Icons.supervised_user_circle_outlined,
                                    text: 'Teams in the system',
                                    colorIcon: Colors.yellow,
                                  )),
                              Card(
                                  elevation: 5,
                                  child: SimpleRadialGaugeWidget(
                                    number:
                                        cubit.surveyModel!.ourUsers!.toDouble(),
                                    color: Colors.green,
                                    icon: Icons.person_2_sharp,
                                    text: 'Users in the system',
                                    colorIcon: Colors.green,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                  return const Center(child: Text('No Internet'));
                },
                fallback: (context) {
                  return const Center(child: CircularProgressIndicator());
                },
              )
            ],
          ),
        );
      },
    );
  }
}

class SimpleRadialGaugeWidget extends StatelessWidget {
  const SimpleRadialGaugeWidget({
    super.key,
    required this.number,
    required this.text,
    required this.icon,
    required this.color,
    required this.colorIcon,
  });
  final double number;
  final String text;
  final IconData icon;
  final Color color;
  final Color colorIcon;

  @override
  Widget build(BuildContext context) {
    return SimpleRadialGauge(
      //decimalPlaces: 6,
      actualValue: number,
      maxValue: 100,
      // Optional Parameters
      //  minValue: 0,
      title: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      titlePosition: TitlePosition.top,
      //  unit: 'L',
      icon: Icon(
        icon,
        size: 50,
        color: colorIcon,
      ),
      pointerColor: color,
      // decimalPlaces: 0,
      isAnimate: true,
      animationDuration: 2000,
      size: MediaQuery.of(context).size.longestSide * 0.2090,
    );
  }
}

// Widget buildImage(String urlImage, int index) => Container(
//       margin: const EdgeInsets.symmetric(horizontal: 12),
//       color: Colors.grey,
//       child: Image.asset(
//         'assets/images/bg-solar.jpg',
//         fit: BoxFit.cover,
//       ),
//     );
