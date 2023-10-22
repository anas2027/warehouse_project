import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/core/constant/constants.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/Medcine.dart';
import 'package:warehouse_project/feature/home_page/presention/page/widget/widget.dart';
import 'package:warehouse_project/injection_container.dart';

import '../../../../core/colors/colors.dart';
import '../get_x/home_page_getx/home_page_controller.dart';

class HomePageScreen extends StatelessWidget {
  late MyColors colors = MyColors();
  HomePageController controller = Get.find();
  TextEditingController addquantity = TextEditingController();
  TextEditingController minusQuantity = TextEditingController();
  TextEditingController nameCompostion = TextEditingController();
  String image =
      'https://akm-img-a-in.tosshub.com/businesstoday/images/story/202210/64e01bf1f7dbd9099e249e9c3247fdbb9a46b4b1-1280x720-sixteen_nine.jpg';

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromARGB(252, 242, 239, 239),
        drawer: Container(
          width: size.width * 0.5,
          height: double.infinity,
          decoration: BoxDecoration(color: Colors.white),
          child: SafeArea(
            child: SizedBox(
              height: double.infinity,
              width: size.width * 0.5,
              child: ListView.separated(
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(5),
                        child: ListTile(
                          onTap: () {
                            if (index == 1) {
                              Get.toNamed('/Reciveorder');
                            }
                            if (index == 2) {
                              Get.toNamed('/Dashboard');
                            }
                            if (index == 4) {
                              Get.toNamed('/Mywallet', arguments: '30');
                              print('wallet');
                            }
                            if (index == 5) {
                              Get.offAllNamed('/');
                            }
                          },
                          leading: CircleAvatar(
                              maxRadius: 25,
                              backgroundImage: AssetImage(
                                draweImageAvatar[index],
                              )),
                          title: Text(
                            '${drawer[index]}',
                            style: TextStyle(color: colors.textcolors),
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => Divider(
                        color: colors.textcolors,
                        thickness: 2,
                        height: 25,
                      ),
                  itemCount: drawer.length),
            ),
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.5),
          child: Stack(
            children: [
              AppBar(
                flexibleSpace: SizedBox(
                    height: size.height * 0.3,
                    child:
                        Image(image: NetworkImage(image), fit: BoxFit.cover)),
                elevation: 0,
                iconTheme: IconThemeData(color: colors.textcolors),
                backgroundColor: Color.fromARGB(252, 242, 239, 239),
                centerTitle: true,
                title: Text(
                  ' warehouse',
                  style: TextStyle(color: colors.textcolors),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        Get.offAllNamed('/alertPage');
                      },
                      icon: Icon(Icons.notifications)),
                  IconButton(
                      onPressed: () {
                        final result = showSearch(
                            context: context,
                            delegate: MedcineSearch(
                                med: controller.medcine,
                                homePageController: controller,
                                size: size,
                                addquantity: addquantity,
                                minusQuantity: minusQuantity));
                      },
                      icon: Icon(
                        Icons.search,
                        size: 30,
                        color: colors.textcolors,
                      )),
                  IconButton(
                      onPressed: () {
                        Get.offAndToNamed('/AddMedcinePage');
                      },
                      icon: Icon(
                        Icons.add,
                        color: colors.textcolors,
                        size: 30,
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120, left: 35),
                child: Container(
                  height: size.height * 0.3,
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: GetBuilder<HomePageController>(
                    builder: (controller) => Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                maxRadius: 25,
                                backgroundImage:
                                    AssetImage('assests/image/pharmacy.png'),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.green,
                                maxRadius: 10,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              TextDefault(
                                  maxLine: 1,
                                  colorText: colors.textcolors,
                                  fontWeight: FontWeight.bold,
                                  fontsize: 18,
                                  textOverflow: TextOverflow.ellipsis,
                                  contentText: '${controller.wareInfo![1]}'),
                              TextDefault(
                                  maxLine: 1,
                                  colorText: colors.textcolors,
                                  fontWeight: FontWeight.normal,
                                  fontsize: 16,
                                  textOverflow: TextOverflow.ellipsis,
                                  contentText: '12:00pm  - 12:00am'),
                            ],
                          ),
                          Container(
                            height: size.height * 0.01,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: size.width * 0.2,
                                child: TextDefault(
                                    maxLine: 3,
                                    colorText: colors.textcolors,
                                    fontWeight: FontWeight.normal,
                                    fontsize: 17,
                                    textOverflow: TextOverflow.ellipsis,
                                    contentText: '${controller.wareInfo![3]}'),
                              ),
                              SizedBox(
                                width: size.width * 0.2,
                                child: TextDefault(
                                    maxLine: 3,
                                    colorText: colors.textcolors,
                                    fontWeight: FontWeight.normal,
                                    fontsize: 17,
                                    textOverflow: TextOverflow.ellipsis,
                                    contentText: '${controller.wareInfo![4]}'),
                              ),
                              SizedBox(
                                width: size.width * 0.2,
                                child: TextDefault(
                                    maxLine: 3,
                                    colorText: colors.textcolors,
                                    fontWeight: FontWeight.normal,
                                    fontsize: 17,
                                    textOverflow: TextOverflow.ellipsis,
                                    contentText: '${controller.wareInfo![5]}'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: GetBuilder<HomePageController>(builder: (controller) {
          if (controller.medcine.isNotEmpty) {
            return RefreshIndicator(
              onRefresh: () async {
                //refrech my med list
                controller.refrechMedList();
              },
              child: ListView.separated(
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10,
                          child: Container(
                              padding: const EdgeInsets.all(25),
                              height: controller.showMore
                                  ? size.height * 0.46
                                  : size.height * 0.30,
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextDefault(
                                            maxLine: 1,
                                            colorText: colors.textcolors,
                                            fontWeight: FontWeight.bold,
                                            fontsize: 30,
                                            textOverflow: TextOverflow.ellipsis,
                                            contentText:
                                                controller.medcine[index].name),
                                        TextDefault(
                                            maxLine: 1,
                                            colorText: colors.textcolors,
                                            fontWeight: FontWeight.bold,
                                            fontsize: 20,
                                            textOverflow: TextOverflow.ellipsis,
                                            contentText:
                                                'qunatity: ${controller.medcine[index].quantity}'),
                                        TextDefault(
                                            maxLine: 1,
                                            colorText: colors.textcolors,
                                            fontWeight: FontWeight.bold,
                                            fontsize: 20,
                                            textOverflow: TextOverflow.ellipsis,
                                            contentText:
                                                'pp ${controller.medcine[index].pharmcyPrice}'),
                                        TextDefault(
                                            maxLine: 1,
                                            colorText: colors.textcolors,
                                            fontWeight: FontWeight.bold,
                                            fontsize: 20,
                                            textOverflow: TextOverflow.ellipsis,
                                            contentText:
                                                'pc: ${controller.medcine[index].price_customer}'),
                                        TextDefault(
                                            maxLine: 1,
                                            colorText: colors.textcolors,
                                            fontWeight: FontWeight.bold,
                                            fontsize: 20,
                                            textOverflow: TextOverflow.ellipsis,
                                            contentText:
                                                'mg: ${controller.medcine[index].mg}'),
                                        GestureDetector(
                                          onTap: () {
                                            controller.changeinfobool();
                                          },
                                          child: TextDefault(
                                              maxLine: 1,
                                              colorText: colors.textcolors,
                                              fontWeight: FontWeight.bold,
                                              fontsize: 20,
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                              contentText: controller.showMore
                                                  ? 'Hide ...'
                                                  : 'showMore....'),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: size.height * 0.005,
                                          width: size.width * 0.4,
                                          color: Colors.grey,
                                        ),
                                        controller.showMore
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Get.defaultDialog(
                                                          content:
                                                              TextFormField(
                                                            keyboardType:
                                                                TextInputType
                                                                    .multiline,
                                                            controller:
                                                                nameCompostion,
                                                          ),
                                                          title:
                                                              'Add New composition for your medcine ',
                                                          confirm: IconButton(
                                                              icon: Icon(
                                                                Icons.check,
                                                                color: colors
                                                                    .appbar,
                                                              ),
                                                              onPressed: () {
                                                                controller.Addcompostoion(
                                                                    name: nameCompostion
                                                                        .text
                                                                        .toString(),
                                                                    medId:
                                                                        '${controller.medcine[index].id}');
                                                                Get.back();
                                                              }),
                                                          cancel: IconButton(
                                                              onPressed: () {
                                                                Get.back();
                                                              },
                                                              icon: Icon(
                                                                Icons.cancel,
                                                                color: colors
                                                                    .appbar,
                                                              )),
                                                        );
                                                      },
                                                      child: TextDefault(
                                                        colorText:
                                                            colors.textcolors,
                                                        contentText:
                                                            'Add a Compotsion for this med',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontsize: 25,
                                                        maxLine: 4,
                                                        textOverflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                      )),
                                                  Container(
                                                    height: size.height * 0.005,
                                                    width: size.width * 0.4,
                                                    color: Colors.grey,
                                                  ),
                                                  Row(
                                                    children: [
                                                      IconButton(
                                                        onPressed: () {
                                                          Get.offAndToNamed(
                                                              '/EditMedcinePage',
                                                              parameters: {
                                                                'name': controller
                                                                    .medcine[
                                                                        index]
                                                                    .name,
                                                                'descrption':
                                                                    controller
                                                                        .medcine[
                                                                            index]
                                                                        .description,
                                                                'image': controller
                                                                    .medcine[
                                                                        index]
                                                                    .imageUrl,
                                                                'quantity':
                                                                    '${controller.medcine[index].quantity}',
                                                                'mg':
                                                                    '${controller.medcine[index].mg}',
                                                                'dateexpired':
                                                                    controller
                                                                        .medcine[
                                                                            index]
                                                                        .exp,
                                                                'pharmcy_price':
                                                                    '${controller.medcine[index].pharmcyPrice}',
                                                                'customer_price':
                                                                    '${controller.medcine[index].price_customer}',
                                                                'composition':
                                                                    controller
                                                                        .medcine[
                                                                            index]
                                                                        .description,
                                                                'category':
                                                                    "${controller.medcine[index].name_category}",
                                                                "status":
                                                                    "${controller.medcine[index].status}"
                                                              },
                                                              arguments:
                                                                  '${controller.medcine[index].id}');
                                                        },
                                                        icon: Icon(
                                                          Icons.edit,
                                                          color: Colors.grey,
                                                          size: 30,
                                                        ),
                                                      ),
                                                      IconButton(
                                                          onPressed: () {
                                                            controller
                                                                .deleteMedcine(
                                                                    controller
                                                                        .medcine[
                                                                            index]
                                                                        .id);
                                                            controller
                                                                .getMedcine();
                                                          },
                                                          icon: Icon(
                                                            Icons.delete,
                                                            color: Colors.red,
                                                            size: 30,
                                                          )),
                                                      IconButton(
                                                          onPressed: () {
                                                            Get.defaultDialog(
                                                              content:
                                                                  TextFormField(
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                controller:
                                                                    addquantity,
                                                              ),
                                                              title:
                                                                  'Add New Quantity for your medcine this amount will ADD to Total Quantity',
                                                              confirm:
                                                                  IconButton(
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .check,
                                                                        color: colors
                                                                            .appbar,
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        controller.AddNewQuantity(
                                                                            medId:
                                                                                '${controller.medcine[index].id}',
                                                                            newquantity:
                                                                                addquantity.text.toString());
                                                                        controller
                                                                            .getMedcine();
                                                                      }),
                                                              cancel:
                                                                  IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        Get.back();
                                                                      },
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .cancel,
                                                                        color: colors
                                                                            .appbar,
                                                                      )),
                                                            );
                                                          },
                                                          icon:
                                                              Icon(Icons.add)),
                                                      IconButton(
                                                          onPressed: () async {
                                                            Get.defaultDialog(
                                                              content:
                                                                  TextFormField(
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                controller:
                                                                    minusQuantity,
                                                              ),
                                                              title:
                                                                  'delete Quantity for your medcine this amount will remove from total quanityt',
                                                              confirm:
                                                                  IconButton(
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .check,
                                                                        color: colors
                                                                            .appbar,
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        controller.MinusQuantity(
                                                                            medId:
                                                                                '${controller.medcine[index].id}',
                                                                            newquantity:
                                                                                minusQuantity.text.toString());
                                                                        controller
                                                                            .getMedcine();
                                                                      }),
                                                              cancel:
                                                                  IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        Get.back();
                                                                      },
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .cancel,
                                                                        color: colors
                                                                            .appbar,
                                                                      )),
                                                            );
                                                          },
                                                          icon: Icon(
                                                              Icons.remove))
                                                    ],
                                                  ),
                                                ],
                                              )
                                            : Text('')
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.3,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom:
                                              controller.showMore ? 200 : 130,
                                          left: 10),
                                      child: Image(
                                        image: NetworkImage(
                                            controller.medcine[index].imageUrl),
                                        height: size.height * 0.26,
                                        width: size.width * 0.25,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: controller.medcine.length),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                controller.getMedcine();
              },
              child: ListView(
                children: [
                  Center(
                    child: controller.isloading
                        ? const CircularProgressIndicator()
                        : TextDefault(
                            maxLine: 1,
                            colorText: colors.textcolors,
                            fontWeight: FontWeight.bold,
                            fontsize: 30,
                            textOverflow: TextOverflow.ellipsis,
                            contentText: 'there is no medcine now :('),
                  ),
                ],
              ),
            );
          }
        }));
  }
}
