import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/core/widget/wiedget_constant.dart';
import 'package:warehouse_project/feature/home_page/presention/get_x/edit_medcine_getx/edit_medcine_controller.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/constant/constants.dart';

class EditMedcinePage extends StatelessWidget {
  EditMedcinePage({super.key});
  late MyColors colors = MyColors();
  var id = Get.arguments;
  Map<String, String?> parameters = Get.parameters;
  EditMedcineController controller = Get.find();

  TextEditingController name = TextEditingController();
  TextEditingController descrption = TextEditingController();
  TextEditingController customerprice = TextEditingController();
  TextEditingController mg = TextEditingController();
  TextEditingController exp = TextEditingController();
  TextEditingController pharmcyPrice = TextEditingController();
  TextEditingController image = TextEditingController();
  TextEditingController medcineComposition = TextEditingController();
  TextEditingController category = TextEditingController();
  String? cateID;
  @override
  Widget build(BuildContext context) {
    name.text = '${parameters['name']}';
    descrption.text = '${parameters['descrption']}';
    image.text = '${parameters['image']}';
    controller.counter = int.parse('${parameters['quantity']}');
    mg.text = '${parameters['mg']}';
    exp.text = '${parameters['dateexpired']}';
    pharmcyPrice.text = '${parameters['pharmcy_price']}';
    customerprice.text = '${parameters['customer_price']}';
    medcineComposition.text = '${parameters['composition']}';
    category.text = '${parameters['category']}';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colors.appbar,
        leading: IconButton(
          onPressed: () {
            Get.offAndToNamed(
              '/homePage',
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'EditMedcine',
          style: TextStyle(color: colors.textcolors),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.EditMedcine(
              name: name.text.toString(),
              descrption: descrption.text.toString(),
              image: image.text.toString(),
              medcineComposition: medcineComposition.text,
              price: int.parse(customerprice.text.toString()),
              pharmcyprice: int.parse(pharmcyPrice.text.toString()),
              mg: int.parse(mg.text.toString()),
              exp: exp.text.toString(),
              quantity: controller.counter,
              idMed: int.parse(id),
              categoryId: int.parse("$cateID"));
        },
        backgroundColor: colors.appbar,
        child: Icon(Icons.check),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
            itemBuilder: (context, index) {
              if (index == 3) {
                return GetBuilder<EditMedcineController>(
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
                        icon: Icon(Icons.add),
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
                        icon: Icon(Icons.minimize),
                        onLongPress: () => controller.onLongPressMin(),
                        onLongPressEnd: (p0) =>
                            controller.onLongPressMinCanscle(),
                        onTap: () => controller.counterMin(),
                      )
                    ],
                  ),
                );
              } else if (index == 9) {
                return GetBuilder<EditMedcineController>(
                  builder: (controller) {
                    if (controller.category.isNotEmpty) {
                      return DropdownButton(
                          hint: Text(
                            'Select a category',
                            style: TextStyle(color: colors.textcolors),
                          ),
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
              } else if (index == 10) {
                return GetBuilder<EditMedcineController>(
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
                                      color: controller.statusmed == 1
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
                                      color: controller.statusmed == 1
                                          ? Colors.red
                                          : colors.appbar),
                                ))
                          ],
                        ));
              } else {
                return TextFormField(
                  keyboardType: (index == 0)
                      ? TextInputType.name
                      : (index == 1)
                          ? TextInputType.multiline
                          : (index == 2)
                              ? TextInputType.multiline
                              : (index == 4)
                                  ? TextInputType.number
                                  : (index == 5)
                                      ? TextInputType.datetime
                                      : (index == 6)
                                          ? TextInputType.number
                                          : (index == 7)
                                              ? TextInputType.number
                                              : (index == 8)
                                                  ? TextInputType.text
                                                  : TextInputType.number,
                  controller: (index == 0)
                      ? name
                      : (index == 1)
                          ? descrption
                          : (index == 2)
                              ? image
                              : (index == 4)
                                  ? mg
                                  : (index == 5)
                                      ? exp
                                      : (index == 6)
                                          ? pharmcyPrice
                                          : (index == 7)
                                              ? customerprice
                                              : (index == 8)
                                                  ? medcineComposition
                                                  : category,
                  decoration: InputDecoration(
                    prefixIcon: controller.prefixIcon[index],
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: colors.appbar,
                            width: 5,
                            style: BorderStyle.solid)),
                    hintText: '${controller.hintText[index]}',
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
            separatorBuilder: (context, index) => SizedBox(
                  height: 20,
                ),
            itemCount: controller.hintText.length),
      ),
    );
  }
}
