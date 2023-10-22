import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/core/colors/colors.dart';
import 'package:warehouse_project/core/constant/constants.dart';
import 'package:warehouse_project/feature/home_page/presention/get_x/recive_order_getx/recive_order_controller.dart';

class Reciveorder extends StatelessWidget {
  MyColors colors = MyColors();
  ReciveOrderController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 216, 213, 213),
        appBar: AppBar(
          backgroundColor: colors.appbar,
          centerTitle: true,
          title: Text('ReciveOrder'),
        ),
        body: GetBuilder<ReciveOrderController>(builder: (controller) {
          if (controller.myOrder.isEmpty) {
            return RefreshIndicator(
              color: colors.textcolors,
              onRefresh: () => controller.getOrder(),
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
                                '\n\n\n\n\n\n\n\n\n\n there is no medcine now swip down to refrech :('),
                  ),
                ],
              ),
            );
          } else {
            return ListView.separated(
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(18),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed('/orderDetail', parameters: {
                            'orderId': '${controller.myOrder[index].id}'
                          });
                        },
                        child: Card(
                          elevation: 30,
                          child: Container(
                            height: size.height * 0.25,
                            width: size.width * 0.9,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assests/image/pharmacy.png'),
                                        backgroundColor: Colors.teal,
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.23,
                                        child: TextDefault(
                                            maxLine: 2,
                                            colorText: colors.textcolors,
                                            fontWeight: FontWeight.bold,
                                            fontsize: 30,
                                            textOverflow: TextOverflow.ellipsis,
                                            contentText:
                                                controller.myOrder[0].city),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(7),
                                        child: TextDefault(
                                            maxLine: 2,
                                            colorText: colors.textcolors,
                                            fontWeight: FontWeight.bold,
                                            fontsize: 12,
                                            textOverflow: TextOverflow.ellipsis,
                                            contentText:
                                                controller.myOrder[0].name_ph),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color:
                                      const Color.fromARGB(255, 216, 213, 213),
                                  height: size.height * 0.001,
                                  width: double.infinity,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: TextDefault(
                                    maxLine: 1,
                                    colorText: colors.textcolors,
                                    fontWeight: FontWeight.bold,
                                    fontsize: 20,
                                    textOverflow: TextOverflow.ellipsis,
                                    contentText: '4 item',
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: TextDefault(
                                          maxLine: 1,
                                          colorText: colors.textcolors,
                                          fontWeight: FontWeight.bold,
                                          fontsize: 25,
                                          textOverflow: TextOverflow.ellipsis,
                                          contentText:
                                              '${controller.myOrder[index].total_price} \$',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Container(
                                        height: size.height * 0.04,
                                        width: size.width * 0.3,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 0.9,
                                            color: const Color.fromARGB(
                                                255, 216, 213, 213),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: colors.textcolors,
                                        ),
                                        child: Center(
                                          child: TextDefault(
                                              maxLine: 1,
                                              colorText: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontsize: 20,
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                              contentText: controller
                                                          .myOrder[index]
                                                          .status ==
                                                      1
                                                  ? 'confirmed'
                                                  : 'waiting'),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => const SizedBox(),
                itemCount: controller.myOrder.length);
          }
        }));
  }
}
