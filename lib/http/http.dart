import 'package:dio/dio.dart';
import 'http_config.dart';

class HttpRequset {
  // 创建DIO实例
  static BaseOptions baseOptions = BaseOptions(
    baseUrl: BASEURL,
    connectTimeout: TIMEOUT
  );
  static Dio dio = Dio(baseOptions);

  static Future<T> request<T>(String url, {String method = 'get', Map<String, Object> params}) async {
    // 1.单独相关的设置
    Options options = Options();
    options.method = method;

    // 2.发送网络请求
    try {
      Response response = await dio.request<T>(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (e) {
      throw e;
    }
  }
}