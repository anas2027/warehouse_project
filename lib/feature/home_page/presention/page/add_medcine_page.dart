import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:warehouse_project/core/constant/constants.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/category.dart';
import 'package:warehouse_project/feature/home_page/presention/get_x/add_medcine_getx/add_medcine_controller.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/widget/wiedget_constant.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class AddMedcinePage extends StatelessWidget {
  AddMedcinecontoller controller = Get.find();
  late MyColors colors = MyColors();
  TextEditingController name = TextEditingController();
  TextEditingController descrption = TextEditingController();
  TextEditingController exp = TextEditingController();
  TextEditingController mg = TextEditingController();
  TextEditingController customerprice = TextEditingController();
  TextEditingController pharmcyPrice = TextEditingController();
  TextEditingController image = TextEditingController();
  TextEditingController medcineComposition = TextEditingController();
  TextEditingController category = TextEditingController();
  String? cateID;

  String phId = '';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Confirm',
            style: TextStyle(
                color: colors.textcolors,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          FloatingActionButton(
            onPressed: () {
                 
                  
              controller.addmedcinemethod(
                name: name.text.toString(),
                descrption: descrption.text.toString(),
                image: image.text.toString(),
                mg: mg.text.toString(),
                exp: '${controller.newdate}',
                pharmcyprice: pharmcyPrice.text.toString(),
                customerprice: customerprice.text.toString(),
                categoryid: '$cateID',
                medcineComposition: medcineComposition.text.toString(),
                quantity: controller.counter.toString(),
              );
            },
            backgroundColor: colors.appbar,
            child: const Icon(Icons.check),
          ),
        ],
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.toNamed('/homePage');
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
              onPressed: () {
                controller.selectedDate;
              },
              icon: Icon(Icons.abc))
        ],
        backgroundColor: colors.appbar,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Add your Medcine',
              style: TextStyle(color: colors.textcolors),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
            itemBuilder: (context, index) {
              if (index == 3) {
                return GetBuilder<AddMedcinecontoller>(
                  builder: (controller) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            'Count',
                            style: TextStyle(
                                fontSize: 30, color: colors.textcolors),
                          )),
                      circularButtom(
                        textcolor: colors.textcolors,
                        icon: const Icon(Icons.add),
                        onLongPress: () => controller.onLongPressSUm(),
                        onLongPressEnd: (_) =>
                            controller.onLongPressSumCanscle(),
                        onTap: () => controller.countersum(),
                      ),
                      Text(
                        '${controller.counter}',
                        style:
                            TextStyle(fontSize: 30, color: colors.textcolors),
                      ),
                      circularButtom(
                        textcolor: colors.textcolors,
                        icon: const Icon(Icons.minimize),
                        onLongPress: () => controller.onLongPressMin(),
                        onLongPressEnd: (p0) =>
                            controller.onLongPressMinCanscle(),
                        onTap: () => controller.counterMin(),
                      )
                    ],
                  ),
                );
              } else if (index == 9) {
                return GetBuilder<AddMedcinecontoller>(
                  builder: (controller) {
                    if (controller.category.isNotEmpty) {
                      return DropdownButton(
                          hint: Text('Select a category'),
                          items: controller.category.map((e) {
                            return DropdownMenuItem(
                              value: e.id.toString(),
                              child: Text(e.nameCategory.toString()),
                            );
                          }).toList(),
                          onChanged: (value) {
                            print(value);
                            cateID = value;
                          });
                    }
                    return Text('category');
                  },
                );
              } else if (index == 8) {
                return GetBuilder<AddMedcinecontoller>(
                    builder: (controller) => Row(
                          children: [
                            TextDefault(
                                maxLine: 1,
                                colorText: colors.textcolors,
                                fontWeight: FontWeight.bold,
                                fontsize: 20,
                                textOverflow: TextOverflow.ellipsis,
                                contentText: 'need a Rezept ?'),
                            TextButton(
                                onPressed: () {
                                  controller.changestatusvalueTotrue();
                                  controller.statusmed = 1;
                                },
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                      color: controller.status
                                          ? colors.appbar
                                          : Colors.red),
                                )),
                            TextButton(
                                onPressed: () {
                                  controller.changestatusvalueTofalse();
                                  controller.statusmed = 0;
                                },
                                child: Text(
                                  'No',
                                  style: TextStyle(
                                      color: controller.status
                                          ? Colors.red
                                          : colors.appbar),
                                ))
                          ],
                        ));
              } else if (index == 5) {
                return GetBuilder<AddMedcinecontoller>(
                  builder: (controller) => Column(
                    children: [
                      Text(controller.newdate == ''
                          ? '${DateTime.now()}'
                          : '${controller.newdate}'),
                      MaterialButton(
                        onPressed: () async {
                          controller.updateDate();
                        },
                        child: TextDefault(
                            maxLine: 1,
                            colorText: colors.textcolors,
                            fontWeight: FontWeight.bold,
                            fontsize: 30,
                            textOverflow: TextOverflow.ellipsis,
                            contentText: 'pick a date expirde'),
                      ),
                    ],
                  ),
                );
              } else {
                return TextFormField(
                  keyboardType: (index == 0)
                      ? TextInputType.name
                      : (index == 1)
                          ? TextInputType.multiline
                          : (index == 2)
                              ? TextInputType.text
                              : (index == 4)
                                  ? TextInputType.number
                                  : (index == 5)
                                      ? TextInputType.number
                                      : (index == 7)
                                          ? TextInputType.number
                                        :TextInputType.datetime,
                  controller: (index == 0)
                      ? name
                      : (index == 1)
                          ? descrption
                          : (index == 2)
                              ? image
                              : (index == 4)
                                  ? mg
                                  : (index == 6)
                                      ? pharmcyPrice
                                      : (index == 7)
                                          ? customerprice
                                          
                                              : category,
                  decoration: InputDecoration(
                    prefixIcon: controller.prefixIcon[index],
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: colors.appbar,
                            width: 5,
                            style: BorderStyle.solid)),
                    hintText: controller.hintText[index],
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: colors.appbar,
                            width: 5,
                            style: BorderStyle.solid)),
                  ),
                );
              }
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: controller.hintText.length),
      ),
    );
  }
}
