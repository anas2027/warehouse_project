import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/Medcine.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/addmedcine.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/category.dart';
import 'package:warehouse_project/feature/home_page/domain/usecase/get_category_usecase.dart';

import '../../../../../error/failure.dart';
import '../../../domain/usecase/add_medcine_usecase.dart';

class AddMedcinecontoller extends GetxController {
  AddmedcineUseCase addmedcineUseCase;
  GetCategoryUseCase getCategoryUseCase;
  AddMedcinecontoller(
      {required this.addmedcineUseCase, required this.getCategoryUseCase});

  Timer? timer;
  List<String> hintText = [
    'name',
    'descrption',
    'image',
    'quantity',
    'mg',
    'date expierd',
    'pharmcy_price',
    'customer_price',
    'category',
    'status',
  ];
  List<Widget> prefixIcon = [
    const Icon(Icons.person),
    const Icon(Icons.description),
    const Icon(Icons.image),
    const Icon(Icons.list_alt_rounded),
    const Icon(Icons.medication_rounded),
    const Icon(Icons.date_range),
    const Icon(Icons.price_change_outlined),
    const Icon(Icons.price_change_outlined),
    const Icon(Icons.category_outlined),
  ];

  int counter = 1;
  // sum counter

  void onLongPressSUm() {
    timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      update();

      counter++;
      update();
    });
  }

  void onLongPressSumCanscle() {
    update();
    timer?.cancel();
    update();
  }

  void countersum() {
    counter++;
    update();
  }
  // min counter

  void counterMin() {
    counter--;
    update();
  }

  void onLongPressMin() {
    timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      update();

      counter--;
      update();
    });
  }

  void onLongPressMinCanscle() {
    timer?.cancel();
  }

// status value
  int statusmed = 1;

  Future addmedcinemethod({
    required String name,
    required String descrption,
    required String image,
    required String mg,
    required String exp,
    required String pharmcyprice,
    required String customerprice,
    required String medcineComposition,
    required String quantity,
    required String categoryid,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var warehousId = sharedPreferences.getString('id');
    print(statusmed);
    AddMedcine addMedcine = AddMedcine(
        name: name,
        descrption: descrption,
        image: image,
        mg: mg,
        exp: exp,
        pricePharmcy: pharmcyprice,
        priceCustomer: customerprice,
        composition: medcineComposition,
        quantity: quantity,
        warehouseid: '$warehousId',
        categoryid: categoryid,
        status: '$statusmed');
    
    var response = await addmedcineUseCase(addMedcine);
    response.fold((l) => GetSnackBar(title: 'You Sould Input All column'), (r) => unit);
  }

// here the drop down item

  List<CategoryEntity> category = [];
  Future fillCategoryList() async {
    final Mywallet = await getCategoryUseCase();
    Mywallet.fold((l) => Failure, (r) => category.addAll(r));
    print('dad');
    update();
  }

  @override
  onInit() {
    super.onInit();
    fillCategoryList();
  }

  bool status = true;

  changestatusvalueTotrue() {
    print(statusmed);
    status = true;
    update();
  }

  changestatusvalueTofalse() {
    print(statusmed);

    status = false;
    update();
  }

  String convertdatetimedisplay(String date) {
    final DateFormat displayformater = DateFormat('yyyy-mm-dd hh:mm:ss.sss');
    final DateFormat serverformater = DateFormat('dd-mm-yyyy');
    final DateTime displaydate = serverformater.parse(date);
    final String formatted = serverformater.format(displaydate);
    return formatted;
  }

  var selectedDate = DateTime.now();
  var newdate = '';
  updateDate() async {
    DateTime? pickdate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(3000));
    if (pickdate != null && pickdate != selectedDate) {
      newdate = convertdatetimedisplay('$pickdate');
      selectedDate = pickdate;

      print(newdate);
    }
    update();
  }
}
