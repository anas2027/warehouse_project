import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/core/colors/colors.dart';
import 'package:warehouse_project/core/constant/constants.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/Medcine.dart';
import 'package:warehouse_project/feature/home_page/presention/get_x/home_page_getx/home_page_controller.dart';

class MedcineSearch extends SearchDelegate<String> {
  List<Medcine> med;
  Size size;
  HomePageController homePageController;
  TextEditingController nameCompostion = TextEditingController();
  TextEditingController addquantity = TextEditingController();
  TextEditingController minusQuantity = TextEditingController();

  MedcineSearch(
      {required this.addquantity,
      required this.minusQuantity,
      required this.homePageController,
      required this.size,
      required this.med});
  late MyColors colors = MyColors();
  String image =
      'https://akm-img-a-in.tosshub.com/businesstoday/images/story/202210/64e01bf1f7dbd9099e249e9c3247fdbb9a46b4b1-1280x720-sixteen_nine.jpg';

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, '');
            } else {
              query = '';
            }
          },
          icon: Icon(
            Icons.clear,
            color: colors.textcolors,
            size: 30,
          ),
        )
      ];

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query != null) {
      final result = med
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      return GetBuilder<HomePageController>(builder: (controller) {
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
                                          contentText: result[index].name),
                                      TextDefault(
                                          maxLine: 1,
                                          colorText: colors.textcolors,
                                          fontWeight: FontWeight.bold,
                                          fontsize: 20,
                                          textOverflow: TextOverflow.ellipsis,
                                          contentText:
                                              'qunatity: ${result[index].quantity}'),
                                      TextDefault(
                                          maxLine: 1,
                                          colorText: colors.textcolors,
                                          fontWeight: FontWeight.bold,
                                          fontsize: 20,
                                          textOverflow: TextOverflow.ellipsis,
                                          contentText:
                                              'pp ${result[index].pharmcyPrice}'),
                                      TextDefault(
                                          maxLine: 1,
                                          colorText: colors.textcolors,
                                          fontWeight: FontWeight.bold,
                                          fontsize: 20,
                                          textOverflow: TextOverflow.ellipsis,
                                          contentText:
                                              'pc: ${result[index].price_customer}'),
                                      TextDefault(
                                          maxLine: 1,
                                          colorText: colors.textcolors,
                                          fontWeight: FontWeight.bold,
                                          fontsize: 20,
                                          textOverflow: TextOverflow.ellipsis,
                                          contentText:
                                              'mg: ${result[index].mg}'),
                                      GestureDetector(
                                        onTap: () {
                                          controller.changeinfobool();
                                        },
                                        child: TextDefault(
                                            maxLine: 1,
                                            colorText: colors.textcolors,
                                            fontWeight: FontWeight.bold,
                                            fontsize: 20,
                                            textOverflow: TextOverflow.ellipsis,
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
                                                        content: TextFormField(
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
                                                              color:
                                                                  colors.appbar,
                                                            ),
                                                            onPressed: () {
                                                              controller.Addcompostoion(
                                                                  name: nameCompostion
                                                                      .text
                                                                      .toString(),
                                                                  medId:
                                                                      '${result[index].id}');
                                                              Get.back();
                                                            }),
                                                        cancel: IconButton(
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            icon: Icon(
                                                              Icons.cancel,
                                                              color:
                                                                  colors.appbar,
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
                                                          TextOverflow.ellipsis,
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
                                                              'name':
                                                                  result[index]
                                                                      .name,
                                                              'descrption':
                                                                  result[index]
                                                                      .description,
                                                              'image':
                                                                  result[index]
                                                                      .imageUrl,
                                                              'quantity':
                                                                  '${result[index].quantity}',
                                                              'mg':
                                                                  '${result[index].mg}',
                                                              'dateexpired':
                                                                  result[index]
                                                                      .exp,
                                                              'pharmcy_price':
                                                                  '${result[index].pharmcyPrice}',
                                                              'customer_price':
                                                                  '${result[index].price_customer}',
                                                              'composition':
                                                                  controller
                                                                      .medcine[
                                                                          index]
                                                                      .description,
                                                              'category':
                                                                  "${result[index].name_category}",
                                                              "status":
                                                                  "${result[index].status}"
                                                            },
                                                            arguments:
                                                                '${result[index].id}');
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
                                                                  result[index]
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
                                                            confirm: IconButton(
                                                                icon: Icon(
                                                                  Icons.check,
                                                                  color: colors
                                                                      .appbar,
                                                                ),
                                                                onPressed: () {
                                                                  controller.AddNewQuantity(
                                                                      medId:
                                                                          '${result[index].id}',
                                                                      newquantity: addquantity
                                                                          .text
                                                                          .toString());
                                                                  controller
                                                                      .getMedcine();
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
                                                        icon: Icon(Icons.add)),
                                                    IconButton(
                                                        onPressed: () async {
                                                          var minusQuantity;
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
                                                            confirm: IconButton(
                                                                icon: Icon(
                                                                  Icons.check,
                                                                  color: colors
                                                                      .appbar,
                                                                ),
                                                                onPressed: () {
                                                                  controller.MinusQuantity(
                                                                      medId:
                                                                          '${result[index].id}',
                                                                      newquantity: minusQuantity
                                                                          .text
                                                                          .toString());
                                                                  controller
                                                                      .getMedcine();
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
                                                        icon:
                                                            Icon(Icons.remove))
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
                                        bottom: controller.showMore ? 200 : 130,
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
                itemCount: result.length),
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
      });
    } else {
      return Text('No Matched serach Result');
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query != null) {
      final result = med
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    return GetBuilder<HomePageController>(builder: (controller) {
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
                                          contentText: result[index].name),
                                      TextDefault(
                                          maxLine: 1,
                                          colorText: colors.textcolors,
                                          fontWeight: FontWeight.bold,
                                          fontsize: 20,
                                          textOverflow: TextOverflow.ellipsis,
                                          contentText:
                                              'qunatity: ${result[index].quantity}'),
                                      TextDefault(
                                          maxLine: 1,
                                          colorText: colors.textcolors,
                                          fontWeight: FontWeight.bold,
                                          fontsize: 20,
                                          textOverflow: TextOverflow.ellipsis,
                                          contentText:
                                              'pp ${result[index].pharmcyPrice}'),
                                      TextDefault(
                                          maxLine: 1,
                                          colorText: colors.textcolors,
                                          fontWeight: FontWeight.bold,
                                          fontsize: 20,
                                          textOverflow: TextOverflow.ellipsis,
                                          contentText:
                                              'pc: ${result[index].price_customer}'),
                                      TextDefault(
                                          maxLine: 1,
                                          colorText: colors.textcolors,
                                          fontWeight: FontWeight.bold,
                                          fontsize: 20,
                                          textOverflow: TextOverflow.ellipsis,
                                          contentText:
                                              'mg: ${result[index].mg}'),
                                      GestureDetector(
                                        onTap: () {
                                          controller.changeinfobool();
                                        },
                                        child: TextDefault(
                                            maxLine: 1,
                                            colorText: colors.textcolors,
                                            fontWeight: FontWeight.bold,
                                            fontsize: 20,
                                            textOverflow: TextOverflow.ellipsis,
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
                                                        content: TextFormField(
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
                                                              color:
                                                                  colors.appbar,
                                                            ),
                                                            onPressed: () {
                                                              controller.Addcompostoion(
                                                                  name: nameCompostion
                                                                      .text
                                                                      .toString(),
                                                                  medId:
                                                                      '${result[index].id}');
                                                              Get.back();
                                                            }),
                                                        cancel: IconButton(
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            icon: Icon(
                                                              Icons.cancel,
                                                              color:
                                                                  colors.appbar,
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
                                                          TextOverflow.ellipsis,
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
                                                              'name':
                                                                  result[index]
                                                                      .name,
                                                              'descrption':
                                                                  result[index]
                                                                      .description,
                                                              'image':
                                                                  result[index]
                                                                      .imageUrl,
                                                              'quantity':
                                                                  '${result[index].quantity}',
                                                              'mg':
                                                                  '${result[index].mg}',
                                                              'dateexpired':
                                                                  result[index]
                                                                      .exp,
                                                              'pharmcy_price':
                                                                  '${result[index].pharmcyPrice}',
                                                              'customer_price':
                                                                  '${result[index].price_customer}',
                                                              'composition':
                                                                  controller
                                                                      .medcine[
                                                                          index]
                                                                      .description,
                                                              'category':
                                                                  "${result[index].name_category}",
                                                              "status":
                                                                  "${result[index].status}"
                                                            },
                                                            arguments:
                                                                '${result[index].id}');
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
                                                                  result[index]
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
                                                            confirm: IconButton(
                                                                icon: Icon(
                                                                  Icons.check,
                                                                  color: colors
                                                                      .appbar,
                                                                ),
                                                                onPressed: () {
                                                                  controller.AddNewQuantity(
                                                                      medId:
                                                                          '${result[index].id}',
                                                                      newquantity: addquantity
                                                                          .text
                                                                          .toString());
                                                                  controller
                                                                      .getMedcine();
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
                                                        icon: Icon(Icons.add)),
                                                    IconButton(
                                                        onPressed: () async {
                                                          var minusQuantity;
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
                                                            confirm: IconButton(
                                                                icon: Icon(
                                                                  Icons.check,
                                                                  color: colors
                                                                      .appbar,
                                                                ),
                                                                onPressed: () {
                                                                  controller.MinusQuantity(
                                                                      medId:
                                                                          '${result[index].id}',
                                                                      newquantity: minusQuantity
                                                                          .text
                                                                          .toString());
                                                                  controller
                                                                      .getMedcine();
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
                                                        icon:
                                                            Icon(Icons.remove))
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
                                        bottom: controller.showMore ? 200 : 130,
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
                itemCount: result.length),
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
      });
   } else {
      return const Text('no medcine');
    }
  }
}
