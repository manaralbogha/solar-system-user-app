import 'package:solar_system/shared/network/local/cache_helper.dart';

const String endPoint = 'http://192.168.157.63:8000/api';
String endPointImage = 'http://192.168.157.63:8000/';
String? token = CacheHelper.getData(key: 'token');
String name = CacheHelper.getData(key: 'name');
String email = CacheHelper.getData(key: 'email');
