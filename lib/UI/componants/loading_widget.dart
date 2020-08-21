import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loadingWedget = _buildLoadingWedget();

_buildLoadingWedget() {
  return Container(
    color: Colors.white,
    child: Center(child: SpinKitWave(color: Colors.blue, size: 50.0)),
  );
}
