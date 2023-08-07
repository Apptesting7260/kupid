

import 'dart:convert';
import 'dart:io';

import 'package:cupid_match/controllers/controller/SetRoleController/SetRoleController.dart';
import 'package:cupid_match/data/network/base_api_services.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

import '../app_exceptions.dart';

class NetworkApiServices extends BaseApiServices {
var apiresponsehit;

  @override
  Future<dynamic> getApi(String url)async{

    if (kDebugMode) {
      print(url);
    }

    dynamic responseJson ;
    try {

      final response = await http.get(Uri.parse(url)).timeout( const Duration(seconds: 10));
      responseJson  = returnResponse(response) ;
      apiresponsehit=jsonDecode(response.body);
    }on SocketException {
      throw InternetException('');
    }on RequestTimeOut {
      throw RequestTimeOut('');

    }
    print(responseJson);
    return responseJson ;

  }
@override
Future<dynamic> getApi2(String url)async{

  if (kDebugMode) {
    print(url);
  }

  dynamic responseJson ;
  try {


    final response = await http.get(Uri.parse(url),
      headers: { "Authorization":"Bearer 201|NYX8AGXeBk9CVhHwmt8ncUVDLvJDYwhEUJ3xG8nE"},
    ).timeout( const Duration(seconds: 20)

    );
    responseJson  = returnResponse(response) ;
    apiresponsehit=jsonDecode(response.body);
  }on SocketException {
    throw InternetException('');
  }on RequestTimeOut {
    throw RequestTimeOut('');

  }
  // print(responseJson);
  return responseJson ;

}


  @override
  Future<dynamic> postApi(var data , String url)async{

    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson ;
    try {
print("yes");
      final response = await http.post(Uri.parse(url),
        body: data,

      ).timeout( const Duration(seconds: 10));



      responseJson  = returnResponse(response) ;
apiresponsehit=jsonDecode(response.body);
    }on SocketException {
      throw InternetException('');
    }on RequestTimeOut {
      throw RequestTimeOut('');

    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson ;

  }

  @override
  Future  postApi2(var data , String url)async{

    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson ;
    try {
      print(BarrierToken.toString());
      var response = await http.post(Uri.parse(url),

            headers: { "Authorization":"Bearer $BarrierToken"},


          body: data
      );
            // print(response.body);
      // print("object");
      responseJson  = returnResponse(response) ;

      apiresponsehit=jsonDecode(response.body);
      // print(apiresponsehit);
    }on SocketException {
      throw InternetException('');
    }on RequestTimeOut {
      throw RequestTimeOut('');

    }
    if (kDebugMode) {
      // print(responseJson);
    }
    return responseJson ;

  }
  dynamic returnResponse(http.Response response){

 
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson ;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson ;
        case 404:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson ;

      default :
        throw FetchDataException('Error accoured while communicating with server '+response.statusCode.toString()) ;
    }
  }

}