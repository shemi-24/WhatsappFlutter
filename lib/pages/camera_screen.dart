import 'dart:ffi';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';



List<CameraDescription> cameras;

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {


  CameraController controller;
  Future<Void> cameraValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
