import 'dart:async';
import 'dart:convert';
import 'package:clubhub_app/modules/search/model/user_results.dart';
import 'package:clubhub_app/util/exceptions/general_exception.dart';
import 'package:clubhub_app/util/exceptions/search_timeout_exception.dart';
import 'package:http/http.dart' as httpClient;

class UserRepository {
  final _url = 'https://randomuser.me/api/1.4/';
  Future<UserResults?> getUsers({
    required String searchTerm,
  }) async {
    try {
      final results = await httpClient.get(
        Uri.parse('$_url?results=500&seed=club&nat=us,mx,gb'),
      );
      return UserResults.fromJson(jsonDecode(results.body));
    } on TimeoutException {
      throw SearchTimeoutException('Failed to retrieve results');
    } catch (e) {
      throw GeneralException(message: 'Request failure ${e.toString()}');
    }
  }
}
