import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';

class AccountService {
  // JWT jwt;
  var _nickNameSecurityStamp = ''.obs;
  var _profileImageSecurityStamp = ''.obs;
  var _email = ''.obs;

  final box = GetStorage();
  late Dio dio;

  AccountService() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://api.i-park.ir/',
        // headers: {
        //   "Authorization": "Bearer $_token",
        // },
      ),
    );
  }

  // updateDio() {
  //   // print(_lang);
  //   // print(_token);
  //   dio = Dio(
  //     BaseOptions(
  //       baseUrl: 'https://api.seventask.com/$_lang',
  //     ),
  //   );
  // }

  // isExpire() {
  //   var expireDate = DateTime.parse();
  //   var now = DateTime.now().toUtc();
  //   if (expireDate.year < now.year) {
  //     return true;
  //   } else if (expireDate.year > now.year) {
  //     return false;
  //   }
  //   if (expireDate.month < now.month) {
  //     return true;
  //   } else if (expireDate.month > now.month) {
  //     return false;
  //   }
  //   print(expireDate.day);
  //   print(now.day);
  //   if (expireDate.day < now.day) {
  //     return true;
  //   } else if (expireDate.day > now.day) {
  //     return false;
  //   }
  //   if (expireDate.hour < now.hour) {
  //     return true;
  //   } else if (expireDate.hour > now.hour) {
  //     return false;
  //   }
  //   return true;
  // }

}
