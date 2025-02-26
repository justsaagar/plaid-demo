import 'dart:convert';
import 'dart:io';

import 'package:plaid_demo/app/helper/extension_helper.dart';
import 'package:plaid_demo/app/helper/rest_helper.dart';
import 'package:plaid_demo/repository/authentication/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<String?> getLinkToken() async {
    try {
      final Map<String, dynamic> bodyMap = {
        'client_id': '679d14bb1d59820023b5b060',
        'secret': '30e2e9ac933e664c57aead17eb6cee',
        'client_name': 'Plaid demo',
        'user': {'client_user_id': 'unique-user-id'},
        'products': ['transactions'],
        'country_codes': ['US'],
        'language': 'en',
      };
      'Body map --> $bodyMap'.infoLogs();
      final response = await RestServices.instance.postRestCall(endpoint: RestConstants.instance.createToken, body: bodyMap);
      if (response != null) {
        'Response --> $response'.infoLogs();
        final Map<String, dynamic> responseMap = jsonDecode(response);
        'Response map --> $responseMap'.infoLogs();
        if (responseMap.containsKey('link_token') && responseMap['link_token'] != null) {
          return responseMap['link_token'].toString();
        }
      }
    } on SocketException catch (e) {
      'Catch SocketException in getLinkToken --> ${e.message}'.errorLogs();
    }
    return null;
  }
}
