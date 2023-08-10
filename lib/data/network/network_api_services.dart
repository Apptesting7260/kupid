

import 'dart:convert';
import 'dart:io';

import 'package:cupid_match/controllers/controller/SetRoleController/SetRoleController.dart';
import 'package:cupid_match/data/network/base_api_services.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (kDebugMode) {
    print(url);
  }

  dynamic responseJson ;
  try {

print(prefs.getString("BarearToken"));
    final response = await http.get(Uri.parse(url),
      headers: {"Authorization":"Bearer "+prefs.getString("BarearToken").toString()},
    ).timeout( const Duration(seconds: 20)

    );

    print(response.body);
    responseJson  = returnResponse(response) ;
    apiresponsehit=jsonDecode(response.body);
    print(apiresponsehit);
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

            headers: { "Authorization":"Bearer 292|S1KgjTAYIjIt4mKEt1nbczgzcFVBpFMstK06xNSw"},


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