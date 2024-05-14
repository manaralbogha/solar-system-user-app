import 'package:solar_system/models/model_get_all_company.dart';
import 'package:solar_system/models/model_product_for_company.dart';

abstract class CompanyScreenStates {}

class CompanyScreenInitialState extends CompanyScreenStates {}

class CompanyScreenLoadingState extends CompanyScreenStates {}

class CompanyScreenSuccessState extends CompanyScreenStates {
  AllCompanyModel? allCompany;
  CompanyScreenSuccessState({this.allCompany});
}

class CompanyScreenErrorsState extends CompanyScreenStates {}

class GetProductForCompanyLoadingState extends CompanyScreenStates {}

class GetProductForCompanySuccessState extends CompanyScreenStates {
  ProductForCompanyModel? getProductForCompany;
  GetProductForCompanySuccessState({this.getProductForCompany});
}

class GetProductForCompanyErrorsState extends CompanyScreenStates {}

class GetFeedBackByCompanyIdLoadingState extends CompanyScreenStates {}

class GetFeedBackByCompanyIdSuccessState extends CompanyScreenStates {}

class GetFeedBackByCompanyIdErrorsState extends CompanyScreenStates {}
