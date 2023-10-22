import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/core/colors/colors.dart';
import 'package:warehouse_project/core/constant/constants.dart';
import 'package:warehouse_project/feature/home_page/presention/get_x/alert_getx/alert_conntroller.dart';

class Alertpage extends StatelessWidget {
  AlertConrtoller conrtoller = Get.find();
  MyColors colors = MyColors();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GetBuilder<AlertConrtoller>(
        builder: (controller) => Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                  currentIndex: controller.currentIndex,
                  onTap: (value) {
                    controller.bodyChange(value: value);
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.abc), label: 'quantity Expierd'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.abc_outlined), label: 'Experied Med')
                  ]),
              backgroundColor: const Color.fromARGB(255, 216, 213, 213),
              appBar: AppBar(
                backgroundColor: colors.appbar,
                leading: IconButton(
                    onPressed: () {
                      Get.offAllNamed('/homePage');
                    },
                    icon: Icon(Icons.arrow_back)),
                centerTitle: true,
                title: Text('Medcine About to Expierd'),
              ),
              body: GetBuilder<AlertConrtoller>(
                builder: (controller) {
                  if (controller.medabouttoExpiredList.isNotEmpty) {
                    return controller.currentIndex == 0
                        ? ListView.separated(
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(25),
                              child: Container(
                                height: size.height * 0.3,
                                width: double.infinity,
                                color: Colors.white,
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextDefault(
                                            maxLine: 1,
                                            colorText: colors.textcolors,
                                            fontWeight: FontWeight.bold,
                                            fontsize: 25,
                                            textOverflow: TextOverflow.ellipsis,
                                            contentText: controller
                                                .medabouttoExpiredList[index]
                                                .name_med),
                                        TextDefault(
                                            maxLine: 1,
                                            colorText: colors.textcolors,
                                            fontWeight: FontWeight.bold,
                                            fontsize: 25,
                                            textOverflow: TextOverflow.ellipsis,
                                            contentText: controller
                                                .medabouttoExpiredList[index]
                                                .descrption),
                                        TextDefault(
                                            maxLine: 1,
                                            colorText: colors.textcolors,
                                            fontWeight: FontWeight.bold,
                                            fontsize: 25,
                                            textOverflow: TextOverflow.ellipsis,
                                            contentText:
                                                'mg: ${controller.medabouttoExpiredList[index].mg}'),
                                        TextDefault(
                                            maxLine: 1,
                                            colorText: colors.textcolors,
                                            fontWeight: FontWeight.bold,
                                            fontsize: 25,
                                            textOverflow: TextOverflow.ellipsis,
                                            contentText: 'count: ${controller
                                                .medabouttoExpiredList[index]
                                                .quantity}'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * 0.3,
                                      width: size.width * 0.40,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, bottom: 90),
                                        child: Image(
                                            image: NetworkImage(
                                                'https://cdn11.bigcommerce.com/s-vhzbg5/images/stencil/1280x1280/products/1837/5025/93d42372-1cb6-4a73-a37d-0f4c94e9c94f__89800.1473856740.jpg?c=2')),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            separatorBuilder: (context, index) => SizedBox(),
                            itemCount: controller.medabouttoExpiredList.length,
                          )
                        : ListView.separated(
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(25),
                              child: Container(
                                height: size.height * 0.3,
                                width: double.infinity,
                                color: Colors.white,
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextDefault(
                                            maxLine: 1,
                                            colorText: colors.textcolors,
                                            fontWeight: FontWeight.bold,
                                            fontsize: 25,
                                            textOverflow: TextOverflow.ellipsis,
                                            contentText: controller
                                                .medabouttoQuantityExpiredList[
                                                    index]
                                                .name_med),
                                        TextDefault(
                                            maxLine: 1,
                                            colorText: colors.textcolors,
                                            fontWeight: FontWeight.bold,
                                            fontsize: 25,
                                            textOverflow: TextOverflow.ellipsis,
                                            contentText: controller
                                                .medabouttoQuantityExpiredList[
                                                    index]
                                                .descrption),
                                        TextDefault(
                                            maxLine: 1,
                                            colorText: colors.textcolors,
                                            fontWeight: FontWeight.bold,
                                            fontsize: 25,
                                            textOverflow: TextOverflow.ellipsis,
                                            contentText:
                                                'mg: ${controller.medabouttoQuantityExpiredList[index].mg}'),
                                        TextDefault(
                                            maxLine: 1,
                                            colorText: colors.textcolors,
                                            fontWeight: FontWeight.bold,
                                            fontsize: 25,
                                            textOverflow: TextOverflow.ellipsis,
                                            contentText: controller
                                                .medabouttoQuantityExpiredList[
                                                    index]
                                                .exp),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * 0.3,
                                      width: size.width * 0.30,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 30, bottom: 90),
                                        child: Image(
                                            image: NetworkImage(
                                                '${controller.medabouttoQuantityExpiredList[index].image}')),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            separatorBuilder: (context, index) => SizedBox(),
                            itemCount:
                                controller.medabouttoQuantityExpiredList.length,
                          );
                  } else {
                    return RefreshIndicator(
                      color: colors.textcolors,
                      onRefresh: () => controller.getMedpharamcyExpired(),
                      child: ListView(
                        children: [
                          Center(
                            child: controller.isloading
                                ? Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 350),
                                      child: CircularProgressIndicator(
                                        color: colors.textcolors,
                                      ),
                                    ),
                                  )
                                : TextDefault(
                                    maxLine: 30,
                                    colorText: colors.textcolors,
                                    fontWeight: FontWeight.bold,
                                    fontsize: 30,
                                    textOverflow: TextOverflow.ellipsis,
                                    contentText:
                                        '\n\n\n\n\n\n\n\n\n\n there is no warehouse in this city :('),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ));
  }
}
