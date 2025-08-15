import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_link/res/components/buttonComponent.dart';
import 'package:quick_link/res/components/imageLoader.dart';
import 'package:quick_link/res/components/textFormFieldComponent.dart';
import 'package:quick_link/utils/Utils.dart';

import '../res/colors/appColors.dart';
import '../res/components/ImageBox.dart';
import '../view_model/homeVM.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // _homeVM.getUserData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

