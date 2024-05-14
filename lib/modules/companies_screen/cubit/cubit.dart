import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/models/model_get_all_company.dart';
import 'package:solar_system/models/model_product_for_company.dart';
import 'package:solar_system/modules/companies_screen/cubit/states.dart';
import 'package:solar_system/shared/network/remote/dio_helper.dart';

import '../../../models/model_get_all_by_company_id.dart';
import '../../../shared/const/const.dart';

class CompanyScreenCubit extends Cubit<CompanyScreenStates> {
  CompanyScreenCubit() : super(CompanyScreenInitialState());
  static CompanyScreenCubit get(context) => BlocProvider.of(context);
  AllCompanyModel? allCompany;
  void getAllCompany({
    required String token,
  }) {
    emit(CompanyScreenLoadingState());
    DioHelper.getData(
      url: '$endPoint/company',
      token: token,
      // query: {
      //   "per": 2,
      //   "page": 1,
      // },
    ).then((value) {
      // print(value.data);
      allCompany = AllCompanyModel.fromJson(value.data);
      print(allCompany!.data!.data[5].name);
      emit(CompanyScreenSuccessState(allCompany: allCompany));
    }).catchError((error) {
      print(error.toString);
      emit(CompanyScreenErrorsState());
    });
  }

  ProductForCompanyModel? productForCompany;
  void getProductForCompany({
    required int id,
    required String token,
  }) {
    emit(GetProductForCompanyLoadingState());
    print(id);
    DioHelper.getData(
      url: '$endPoint/company/productID',
      query: {'company_id': id},
      token: token,
    ).then((value) {
      print(value.data);
      // print(value.data["products"]);
      productForCompany = ProductForCompanyModel.fromJson(value.data);
      print(productForCompany!.data![0].products[0].name);
      print(
          '${productForCompany!.data![0].products.length}mmmmmmmmmmmmmmmmmmmmmmmmmmmmmm');
      emit(GetProductForCompanySuccessState(
          getProductForCompany: productForCompany));
    }).catchError((error) {
      emit(GetProductForCompanyErrorsState());
    });
  }

  GetAllByCompanyId? getAllByCompanyId;
  void getFeedBackByCompanyId({required int companyId, required String token}) {
    emit(GetFeedBackByCompanyIdLoadingState());
    DioHelper.getData(
            url: '$endPoint/feedback/showcompany',
            query: {
              'compane_id': companyId,
            },
            token: token)
        .then((value) {
      print(value.data);
      getAllByCompanyId = GetAllByCompanyId.fromJson(value.data);
      print(getAllByCompanyId!.data![0].message);
      emit(GetFeedBackByCompanyIdSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetFeedBackByCompanyIdErrorsState());
    });
  }
}
