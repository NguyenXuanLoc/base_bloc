import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import '../../utils/connection_utils.dart';
import '../globals.dart' as globals;
import 'api_result.dart';

class BaseService {
  var baseUrl = '';

  void initProvider() {}

  // ignore: non_constant_identifier_names
  Future<ApiResult> GET(String url,
      {Map<String, dynamic>? queryParam,
      bool isNewFormat = false,
      String baseUrl = ''}) async {
    if (await ConnectionUtils.isConnect() == false) {
      return ApiResult(error: "LocaleKeys.network_error.tr");
    }
    print('============================================================');
    print('[GET] ${baseUrl!}$url');
    print("Bearer ${globals.accessToken}");
    print("Language ${globals.lang}");
    try {
      final response = await Dio().get(
        url,
        queryParameters: queryParam,
        options: Options(headers: {
          'Authorization': 'Bearer ${globals.accessToken}',
          /*'Content-Type':'application/json'*/
          'Host': 'auth.com',
          'lang': globals.lang
        }),
      );
      if ((response.statusCode == 200 || response.statusCode == 201) &&
          response.data != null) {
        var result = response.data;
        Logger().d(result);
        return ApiResult<dynamic>(
          data: result,
        );
      } else {
        Logger().e('Error ${response.statusCode} - ${response.statusMessage}');
        var result = response.data;
        return ApiResult<dynamic>(
            error: isNewFormat
                ? ''
                : result["meta"] ??
                    (result["meta"]["message"] ?? response.statusMessage),
            data: result,
            statusCode: response.statusCode);
      }
    } on DioError catch (exception) {
      Logger().e('[EXCEPTION] $exception');
      print('============================================================');
      return ApiResult<dynamic>(error: "LocaleKeys.network_error.tr");
    } catch (error) {
      Logger().e('[EXCEPTION] $error');
      Logger().e('[ERROR] $error');
      print('============================================================');
      return ApiResult<dynamic>(error: "LocaleKeys.network_error.tr");
    }
  }

  Future<ApiResult> PATCH(String url, dynamic body) async {
    if (await ConnectionUtils.isConnect() == false) {
      return ApiResult(error: "LocaleKeys.network_error.tr");
    }
    print('============================================================');
    print('[PATCH] ${baseUrl!}$url');
    print('[PARAMS] $body');
    print("Bearer ${globals.accessToken}");
    print("Language ${globals.lang}");

    try {
      final response = await Dio().patch(
        url,
        data: body,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${globals.accessToken}',
            'lang': globals.lang
            /*  'Content-Type': 'application/json'*/
            /* 'Host': 'auth.com'*/
          },
        ),
      );
      if (response.data != null) {
        var result = response.data;
        Logger().d(result);
        return ApiResult<dynamic>(
            data: result,
            statusCode: response.statusCode,
            message: result['meta']['message'] ?? result['meta']['db_message']);
      } else {
        Logger().e('Error ${response.statusCode} - ${response.statusMessage}');
        var result = response.data;
        return ApiResult<dynamic>(
          error: result["meta"]["message"] ?? response.statusMessage ?? '',
          data: result,
        );
      }
    } on Exception catch (exception) {
      Logger().e('[EXCEPTION] $exception');
      print('============================================================');
      return ApiResult<dynamic>(error: "LocaleKeys.network_error.tr");
    } catch (error) {
      Logger().e('[ERROR] ' + error.toString());
      print('============================================================');
      return ApiResult<dynamic>(error: "LocaleKeys.network_error.tr");
    }
  }

  // ignore: non_constant_identifier_names
  Future<ApiResult> POST(String url, dynamic body,
      {bool isMultipart = false,
      bool isContentType = false,
      String baseUrl = '',
      bool isNewFormat = false}) async {
    if (await ConnectionUtils.isConnect() == false) {
      return ApiResult(error: "LocaleKeys.network_error.tr");
    }
    print('============================================================');
    print('[POST] ' + baseUrl! + url);
    print("Bearer " + globals.accessToken);
    print('[PARAMS] ' + (!isMultipart ? json.encode(body) : ''));
    try {
      var headers = {
        'Authorization': 'Bearer ${globals.accessToken}',
        'Host': 'auth.com',
        'lang': globals.lang
      };
      if (isContentType) headers['Content-Type'] = 'application/json';
      final response = await Dio().post(url,
          data: json.encode(body), options: Options(headers: headers));
      Logger().d(response.data);
      if (response.data != null) {
        var result = response.data;
        return ApiResult<dynamic>(
            data: result,
            statusCode: response.statusCode,
            message: isNewFormat
                ? ''
                : result['meta']['message'] ?? result['meta']['db_message']);
      } else {
        Logger().e(
            'Error ${response.statusCode} - ${response.statusMessage} - ${response.data}');
        var result = response.data;
        return ApiResult<dynamic>(
          error: result["meta"]["message"] ?? response.statusMessage ?? '',
          data: result,
        );
      }
    } on Exception catch (exception) {
      Logger().e('[EXCEPTION] ' + exception.toString());
      print('============================================================');
      return ApiResult<dynamic>(
        error: "LocaleKeys.network_error.tr",
      );
    } catch (error) {
      Logger().e('[ERROR] ' + error.toString());
      print('============================================================');
      return ApiResult<dynamic>(error: "LocaleKeys.network_error.tr");
    }
  }

  // ignore: non_constant_identifier_names
  Future<ApiResult> PUT(String url, dynamic body,
      {String baseUrl = '', bool isNewFormat = false}) async {
    if (await ConnectionUtils.isConnect() == false) {
      return ApiResult(error: "LocaleKeys.network_error.tr");
    }
    print('============================================================');
    print('[PUT] ' + baseUrl! + url);
    print('[PARAMS] ' + body.toString());
    try {
      final response = await Dio().put(url,
          data: body,
          options: Options(
            headers: {
              'Authorization': 'Bearer ${globals.accessToken}',
              'Content-Type': 'application/json',
              'lang': globals.lang /*
          'Host': 'auth.com'*/
            },
          ));
      if (response.data != null) {
        var result = response.data;
        Logger().d(result);
        return ApiResult<dynamic>(
            data: result,
            statusCode: response.statusCode,
            message: isNewFormat
                ? ''
                : result['meta']['message'] ?? result['meta']['db_message']);
      } else {
        Logger().e('Error ${response.statusCode} - ${response.statusMessage}');
        var result = response.data;
        return ApiResult<dynamic>(
          error: result["meta"]["message"] ?? response.statusMessage ?? '',
          data: result,
        );
      }
    } on Exception catch (exception) {
      Logger().e('[EXCEPTION] $exception');
      print('============================================================');
      return ApiResult<dynamic>(error: "LocaleKeys.network_error.tr");
    } catch (error) {
      Logger().e('[ERROR] $error');
      print('============================================================');
      return ApiResult<dynamic>(error: "LocaleKeys.network_error.tr");
    }
  }

  // ignore: non_constant_identifier_names
  Future<ApiResult> DELETE(String url, {String baseUrl = ''}) async {
    if (await ConnectionUtils.isConnect() == false) {
      return ApiResult(error: "LocaleKeys.network_error.tr");
    }
    print('============================================================');
    if (kDebugMode) {
      print('[DELETE] ${baseUrl!}$url');
    }
    try {
      final response = await Dio().delete(url,
          options: Options(headers: {
            'Authorization': 'Bearer ${globals.accessToken}',
            'lang': globals.lang
            /*'Content-Type': 'application/json'
            'Host': 'auth.com'*/
          }));

      if (response.data != null) {
        var result = response.data;
        Logger().d(result);
        return ApiResult<dynamic>(
            data: result,
            statusCode: response.statusCode,
            message: result['meta']['message'] ?? result['meta']['db_message']);
      } else {
        Logger().e('Error ${response.statusCode} - ${response.statusMessage}');
        var result = response.data;
        return ApiResult<dynamic>(
          error: result["meta"]["message"] ?? response.statusMessage ?? '',
          data: result,
        );
      }
    } on Exception catch (exception) {
      Logger().e('[EXCEPTION] $exception');
      print('============================================================');
      return ApiResult<dynamic>(error: "LocaleKeys.network_error.tr");
    } catch (error) {
      Logger().e('[ERROR] $error');
      print('============================================================');
      return ApiResult<dynamic>(error: "LocaleKeys.network_error.tr");
    }
  }
}
