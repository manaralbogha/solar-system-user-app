import 'package:flutter/material.dart';

import '../../../models/model_suggested_solar_system.dart';

class SuggestedSolarSystemsForOneCompany extends StatelessWidget {
  const SuggestedSolarSystemsForOneCompany({super.key});

  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    SuggestedSolarSystemModel suggestedSolarSystemModel;
    suggestedSolarSystemModel = arg!['suggestedSolarSystemModel'];
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: List.generate(suggestedSolarSystemModel.inverters!.length,
                (index) {
          return SizedBox(
            width: double.infinity,
            height: 60,
            child: Card(
              elevation: 4,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    print(index);
                    Navigator.pushNamed(
                        context, '/SuggestedDetailsSolarSystemScreen',
                        arguments: {
                          'suggestedSolarSystemModel':
                              suggestedSolarSystemModel,
                          'index': index,
                        });
                  },
                  child: SizedBox(
                    height: 100,
                    child: Row(
                      children: [
                        Text(
                          'Solar System ${index + 1}',
                          style: const TextStyle(fontSize: 25),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios_rounded)
                      ],
                    ),
                  ),
                ),
              )),
            ),
          );
          //Text('Solar System ${index + 1}');
        })),
      ),
    );
  }
}
