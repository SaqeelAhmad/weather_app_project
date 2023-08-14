import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String PlaceName = "";
  String location = '';
  String dateTime = DateFormat("yMMMd").format(DateTime.now());
  final GlobalController globalController = Get.put(
    GlobalController(),
    permanent: true,
  );
  @override
  void initState() {
    getAddress(
      globalController.getLatitude().value,
       globalController.getLongitude().value,

      //  33.62808360813666, 71.25946152424214
    );
    super.initState();
    print(globalController.getLongitude().value);
  }

  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);

    print(placemark);
    Placemark place = placemark[0];
    setState(() {
      PlaceName =
          (place.name! //+" "+place.locality ! +" "+ place.country!
          );
      location = place.name! +
          " , " +
          place.locality! +
          " , " +
          place.country!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topLeft,
          child: Text(
            PlaceName,
            style: const TextStyle(
              height: 1.5,
              fontSize: 35,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          alignment: Alignment.topLeft,
          child: Text(
            location,
            style: TextStyle(
              fontSize: 14,
              height: 1,
              color: Colors.grey[700],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          alignment: Alignment.topLeft,
          child: Text(
            dateTime as String,
            style: TextStyle(
              fontSize: 14,
              height: 1,
              color: Colors.grey[700],
            ),
          ),
        ),
      ],
    );
  }
}
