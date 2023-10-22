import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/Medcine.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/category.dart';
import 'package:warehouse_project/feature/home_page/domain/usecase/edit_medcine_usecase.dart';
import 'package:warehouse_project/feature/home_page/domain/usecase/get_category_usecase.dart';

import '../../../../../error/failure.dart';

class EditMedcineController extends GetxController {
  EditMedcineUseCase editMedcineUseCase;
  GetCategoryUseCase getCategoryUseCase;
  EditMedcineController(
      {required this.editMedcineUseCase, required this.getCategoryUseCase});
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
    'compostion',
    'category',
    'Rezteq'
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
    const Icon(Icons.medical_information),
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

  Future EditMedcine(
      {required String name,
      required String descrption,
      required String image,
      required String medcineComposition,
      required int price,
      required int categoryId,
      required int pharmcyprice,
      required int mg,
      required String exp,
      required int quantity,
      required int idMed}) async {
    Medcine medcine = Medcine(
        id: idMed,
        name: name,
        description: descrption,
        imageUrl: image,
        quantity: quantity,
        mg: mg,
        exp: exp,
        pharmcyPrice: pharmcyprice,
        price_customer: price,
        name_category: name,
        status: statusmed);

    print('controller');
    print(medcine);

    await editMedcineUseCase(medcine);
  }

  List<CategoryEntity> category = [];
  Future fillCategoryList() async {
    final Mywallet = await getCategoryUseCase();
    Mywallet.fold((l) => Failure, (r) => category.addAll(r));

    update();
  }

  @override
  onInit() {
    super.onInit();
    fillCategoryList();
    initailaStatusMedVAl();
  }

  Map<String, String?> parameters = Get.parameters;
  int statusmed = 1;

  initailaStatusMedVAl() {
    int stat = int.parse('${parameters['status']}');
    statusmed = stat;
    print(statusmed);
    update();
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
}
