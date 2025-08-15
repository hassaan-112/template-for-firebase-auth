import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_link/res/colors/appColors.dart';
import 'package:quick_link/utils/Utils.dart';

import '../repository/authRepository.dart';

class AuthViewModel extends GetxController{
  final sFormKey = GlobalKey<FormState>();
  final lFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();
  RxBool isPasswordVisible = true.obs;
  RxBool isLoading = false.obs;

  final _repo = AuthRepository();

  void signup() async {
    if (sFormKey.currentState!.validate()) {
      isLoading.value = true;

      _repo.signup(emailController.text, passwordController.text, nameController.text).then((value) {
        Utils.toast("userCreated".tr,AppColors.positiveGreen);
        isLoading.value = false;
        clearController();
        Get.offAndToNamed('/homeScreen');

      }).catchError((error) {
        Utils.handleException(error);
        isLoading.value = false;
      });
    }
  }
  void login() async {
    if (lFormKey.currentState!.validate()) {
      isLoading.value = true;
      _repo.login(emailController.text, passwordController.text).then((value) {
        Utils.toast("loginSuccess".tr,AppColors.positiveGreen);
        isLoading.value = false;
        clearController();
        Get.offAndToNamed('/homeScreen');
      }).catchError((error) {
        Utils.handleException(error);
        isLoading.value = false;
      });
    }
  }
  void clearController() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }


}