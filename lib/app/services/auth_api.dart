import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';

const baseUrl = 'https://knowing-fit-goose.ngrok-free.app';

Future<http.Response> registerProcess({required Map body}) async {
  final response = await retry(
    () async {
      return await http.post(Uri.parse('$baseUrl/api/auth/register'),
          body: jsonEncode(body),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          }).timeout(Duration(seconds: 5));
    },
    retryIf: (e) => e is http.ClientException || e is TimeoutException,
    maxAttempts: 5,
  );

  return response;
}

Future<http.Response> loginProcess({required Map body}) async {
  final response = await retry(
    () async {
      return await http.post(Uri.parse('$baseUrl/api/auth/login'),
          body: jsonEncode(body),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          }).timeout(Duration(seconds: 5));
    },
    retryIf: (e) => e is http.ClientException || e is TimeoutException,
    maxAttempts: 5,
  );

  return response;
}

Future<http.Response> reloginProcess({required Map body}) async {
  final response = await retry(
    () async {
      return await http.post(Uri.parse('$baseUrl/api/auth/relogin'),
          body: jsonEncode(body),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          }).timeout(Duration(seconds: 5));
    },
    retryIf: (e) => e is http.ClientException || e is TimeoutException,
    maxAttempts: 5,
  );

  return response;
}

Future<http.Response> verifyAccountProcess({required Map body}) async {
  final response = await retry(
    () async {
      return await http.post(Uri.parse('$baseUrl/api/auth/account-verify'),
          body: jsonEncode(body),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          }).timeout(Duration(seconds: 5));
    },
    retryIf: (e) => e is http.ClientException || e is TimeoutException,
    maxAttempts: 5,
  );

  return response;
}

Future<http.Response> initResetProcess({required Map body}) async {
  final response = await retry(
    () async {
      return await http.post(Uri.parse('$baseUrl/api/auth/init-reset'),
          body: jsonEncode(body),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          }).timeout(Duration(seconds: 5));
    },
    retryIf: (e) => e is http.ClientException || e is TimeoutException,
    maxAttempts: 5,
  );

  return response;
}

Future<http.Response> verifyOtpResetProcess({required Map body}) async {
  final response = await retry(
    () async {
      return await http.post(Uri.parse('$baseUrl/api/auth/verify-reset'),
          body: jsonEncode(body),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          }).timeout(Duration(seconds: 5));
    },
    retryIf: (e) => e is http.ClientException || e is TimeoutException,
    maxAttempts: 5,
  );

  return response;
}

Future<http.Response> resetPasswordProcess({required Map body}) async {
  final response = await retry(
    () async {
      return await http.post(Uri.parse('$baseUrl/api/auth/reset-password'),
          body: jsonEncode(body),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          }).timeout(
        Duration(seconds: 5),
      );
    },
    retryIf: (e) => e is http.ClientException || e is TimeoutException,
    maxAttempts: 5,
  );

  return response;
}
