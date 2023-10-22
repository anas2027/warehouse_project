import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warehouse_project/error/failure.dart';
import 'package:warehouse_project/feature/home_page/domain/entity/Medcine.dart';
import 'package:warehouse_project/feature/home_page/domain/usecase/add_composition_usecase.dart';
import 'package:warehouse_project/feature/home_page/domain/usecase/addnew-quantity_usecase.dart';
import 'package:warehouse_project/feature/home_page/domain/usecase/delete_medcine_usecase.dart';
import 'package:warehouse_project/feature/home_page/domain/usecase/get_my_medcine.dart';
import 'package:warehouse_project/feature/home_page/domain/usecase/min_quantity_medcine_usecase.dart';

class HomePageController extends GetxController {
  DeleteMecineUseCase deleteMecineUseCase;
  GetMyMedcineUseCase getMyMedcineUseCase;
  AddNewQuantityMedcineUsecase addNewQuantityMedcineUsecase;
  MinusQuantityMedcineUseCase minusQuantityMedcineUseCase;
  AddCompositionUseCase addCompositionUseCase;
  HomePageController(
      {required this.addCompositionUseCase,
      required this.deleteMecineUseCase,
      required this.getMyMedcineUseCase,
      required this.addNewQuantityMedcineUsecase,
      required this.minusQuantityMedcineUseCase});
  Future deleteMedcine(medId) async {
    await deleteMecineUseCase(medId: "$medId");
  }

  @override
  onInit() async {
    super.onInit();
    getMedcine();
    await getwarehouseInfo();
  }

  List<Medcine> medcine = [];
  bool isloading = true;
  Future getMedcine() async {
    List<Medcine> refrech = [];
    medcine = refrech;
    final failureOrPosts = await getMyMedcineUseCase();

    failureOrPosts.fold((l) => Failure, (r) => medcine.addAll(r));
    isloading = false;
    update();
  }

  Future refrechMedList() async {
    List<Medcine> newList = [];
    medcine = newList;
    final failureOrPosts = await getMyMedcineUseCase();

    failureOrPosts.fold((l) => Failure, (r) => medcine.addAll(r));
    isloading = false;
    update();
  }

  MinusQuantity({required String medId, required String newquantity}) async {
    return await minusQuantityMedcineUseCase(
        medId: medId, newQuannntity: newquantity);
  }

  AddNewQuantity({required String medId, required String newquantity}) async {
    return await addNewQuantityMedcineUsecase(
        medId: medId, newQuannntity: newquantity);
  }

  Addcompostoion({required String name, required String medId}) async {
    print(name);
    print(medId);
    await addCompositionUseCase(medId: medId, name: name);
  }

  bool showMore = false;
  changeinfobool() {
    showMore = !showMore;
    update();
  }

  List<String>? wareInfo = [];
  getwarehouseInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    wareInfo = await sharedPreferences.getStringList('warehouse');
    update();
    print('${wareInfo![0]}');
  }
}
