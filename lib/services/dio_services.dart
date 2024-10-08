import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dr_sohan_raj_tater/helpers/navigation_helper.dart';
import 'package:dr_sohan_raj_tater/view/provider/home_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

// String baseUrl = "http://192.168.29.27:8000/";


enum apiMethod {
  get,
  post,
  delete,
  update,
}

class ApiService {
  static Map errorResponse = {};
  static Dio dio = Dio();

  // static Future<void> dioInitializerAndSetter({required String token}) async {

  //     // dio.options.headers['Authorization'] = 'Bearer $tokenFromShared';
  //     // print(dio.options.headers['Authorization'] = 'Bearer $tokenFromShared');

  // }

  ///token remover
  static Future<void> tokenRemover() async {
    dio.options.headers["Authorization"] = "";
    print("token remover");
  }

  ///api method set up
  static Future<Response<dynamic>?> apiMethodSetup(
      {required apiMethod method,
      required String url,
      var data,
      var queryParameters,
      Function(int, int)? onSendProgress,
      Function(int, int)? onRecieveProgress,
      Options? options}) async {
    //dio.options.headers['Content-Type'] = 'application/json';
   // dio.options.headers['Accept'] = 'application/json';
   // dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = const Duration(milliseconds: 10000);
    dio.options.receiveTimeout = const Duration(milliseconds: 10000);
 //   dio.options.contentType = Headers.acceptHeader;
    try {
      Response? response;
      switch (method) {
        case apiMethod.get:
          if (data != null) {
            response = await dio.get(url,
                queryParameters: queryParameters, options: options ?? Options());
          } else {
            response = await dio.get(url, options: options ?? Options(),queryParameters: queryParameters);
          }
          break;
        case apiMethod.post:
          response = await dio.post(url,
              data: data,
              queryParameters: queryParameters,
              onSendProgress: onSendProgress,
              onReceiveProgress: onRecieveProgress);
          break;
        case apiMethod.delete:
          // ignore: todo
          // TODO: Handle this case.
          break;
        case apiMethod.update:
          // ignore: todo
          // TODO: Handle this case.
          break;
      }
      return response;
    } on DioError catch (e) {
      print(e);
      if (e.response?.statusCode == 401) {
        errorResponse["status"] = "401";
        errorResponse["message"] = "Authorization error";
        Fluttertoast.showToast(msg: 'Authorization error');

        print(errorResponse);
      } else if (e.response?.statusCode == 500) {
        final homePro = Provider.of<HomeProvider>(navigatorKey.currentContext!,listen: false);
        homePro.onEndLoading();
        Fluttertoast.showToast(msg: 'Server Error');
      } else if (e.type == DioErrorType.receiveTimeout) {
        Fluttertoast.showToast(msg: 'Check your network speed');
      } else if (e.type == DioErrorType.connectionTimeout) {
        Fluttertoast.showToast(msg: 'Check your connectivity');
      } else if (e.error is SocketException) {
        errorResponse["status"] = "101";
        errorResponse["message"] = "internet error";
        Fluttertoast.showToast(msg: 'Please check your network');
        print(errorResponse);
      } else {
        print("103");
      }
    }
    return null;
  }
}
