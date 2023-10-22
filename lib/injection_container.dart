import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:warehouse_project/feature/home_page/data/datasource/remote_data_source.dart';
import 'package:warehouse_project/feature/home_page/data/repositry/home_implment_repositry.dart';
import 'package:warehouse_project/feature/home_page/domain/repositry/home_repositry.dart';
import 'package:warehouse_project/feature/home_page/domain/usecase/add_composition_usecase.dart';
import 'package:warehouse_project/feature/home_page/domain/usecase/add_medcine_usecase.dart';
import 'package:warehouse_project/feature/home_page/domain/usecase/addnew-quantity_usecase.dart';
import 'package:warehouse_project/feature/home_page/domain/usecase/delete_medcine_usecase.dart';
import 'package:warehouse_project/feature/home_page/domain/usecase/edit_medcine_usecase.dart';
import 'package:warehouse_project/feature/home_page/domain/usecase/get_category_usecase.dart';
import 'package:warehouse_project/feature/home_page/domain/usecase/get_main_order_usecase.dart';
import 'package:warehouse_project/feature/home_page/domain/usecase/get_med_exp_usecase.dart';
import 'package:warehouse_project/feature/home_page/domain/usecase/get_med_quantity_exp_qunatity.dart';
import 'package:warehouse_project/feature/home_page/domain/usecase/get_most_pharamacy_pursched_usecase.dart';
import 'package:warehouse_project/feature/home_page/domain/usecase/get_my_medcine.dart';
import 'package:warehouse_project/feature/home_page/domain/usecase/get_order_detail.dart';
import 'package:warehouse_project/feature/home_page/domain/usecase/get_wallet_usecase.dart';
import 'package:warehouse_project/feature/home_page/domain/usecase/min_quantity_medcine_usecase.dart';

import 'error/network/network_info.dart';
import 'feature/auth/data/datasource/remote_data_source.dart';
import 'feature/auth/data/repositry/auth_implment_repositry.dart';
import 'feature/auth/domain/repositry/authrepositry.dart';
import 'feature/auth/domain/usecase/login_use_case.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // usecase
  sl.registerLazySingleton(() => GetMyMedcineUseCase(homeRepositry: sl()));
  sl.registerLazySingleton(() => DeleteMecineUseCase(homeRepositry: sl()));
  sl.registerLazySingleton(() => AddmedcineUseCase(homeRepositry: sl()));
  sl.registerLazySingleton(() => LoginUseCase(authRepositry: sl()));
  sl.registerLazySingleton(() => EditMedcineUseCase(homeRepositry: sl()));
  sl.registerLazySingleton(() => GetWalletUseCase(homeRepositry: sl()));
  sl.registerLazySingleton(() => GetCategoryUseCase(homeRepositry: sl()));
  sl.registerLazySingleton(() => AddCompositionUseCase(homeRepositry: sl()));
  sl.registerLazySingleton(() => GetMyOrderUseCase(homeRepositry: sl()));
  sl.registerLazySingleton(() => GetOrderDetailUseCase(homeRepositry: sl()));
  sl.registerLazySingleton(() => MedExpUseCase(homeRepositry: sl()));
  sl.registerLazySingleton(() => MedQuantityExpUseCase(homeRepositry: sl()));
  sl.registerLazySingleton(
      () => MostPharamacyPurshecdUseCase(homeRepositry: sl()));

  sl.registerLazySingleton(
      () => AddNewQuantityMedcineUsecase(homeRepositry: sl()));
  sl.registerLazySingleton(
      () => MinusQuantityMedcineUseCase(homeRepositry: sl()));

  //Repositores
  sl.registerLazySingleton<HomeRepositry>(
      () => HomeRepositryImp(homeRemoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<AuthRepositry>(
      () => AuthRepositryImp(authRemoteDataSorce: sl(), networkInfo: sl()));
  // Datasource
  sl.registerLazySingleton<HomeRemoteDataSorce>(
      () => HomeRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<AuthRemoteDataSorce>(
      () => AuthRemoteDataSourceImpl(client: sl()));

//! core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
//External

//sharedPrefrence
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

//http

  sl.registerLazySingleton(() => http.Client());
  //internetconnectionchecker
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
