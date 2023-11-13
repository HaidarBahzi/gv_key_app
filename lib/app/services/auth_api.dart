import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';

const baseUrl = 'https://knowing-fit-goose.ngrok-free.app';

Future<http.Response> registerProcess({required Map body}) async {
  final response = await retry(
    () async {
      return await http
          .post(Uri.parse('$baseUrl/api/auth/register'), body: jsonEncode(body))
          .timeout(Duration(seconds: 5));
    },
    retryIf: (e) => e is http.ClientException || e is TimeoutException,
    maxAttempts: 5,
  );

  if (response.statusCode == 200) {
    return response;
  } else {
    throw Exception('Failed to connect to the server');
  }
}

Future<http.Response> loginProcess({required Map body}) async {
  final response = await retry(
    () async {
      return await http
          .post(Uri.parse('$baseUrl/api/auth/login'), body: jsonEncode(body))
          .timeout(Duration(seconds: 5));
    },
    retryIf: (e) => e is http.ClientException || e is TimeoutException,
    maxAttempts: 5,
  );

  if (response.statusCode == 200) {
    return response;
  } else {
    throw Exception('Failed to connect to the server');
  }
}

Future<http.Response> reloginProcess({required Map body}) async {
  final response = await retry(
    () async {
      return await http
          .post(Uri.parse('$baseUrl/api/auth/relogin'), body: jsonEncode(body))
          .timeout(Duration(seconds: 5));
    },
    retryIf: (e) => e is http.ClientException || e is TimeoutException,
    maxAttempts: 5,
  );

  if (response.statusCode == 200) {
    return response;
  } else {
    throw Exception('Failed to connect to the server');
  }
}

Future<http.Response> verifyAccountProcess({required Map body}) async {
  final response = await retry(
    () async {
      return await http
          .post(Uri.parse('$baseUrl/api/auth/account-verify'),
              body: jsonEncode(body))
          .timeout(Duration(seconds: 5));
    },
    retryIf: (e) => e is http.ClientException || e is TimeoutException,
    maxAttempts: 5,
  );

  if (response.statusCode == 200) {
    return response;
  } else {
    throw Exception('Failed to connect to the server');
  }
}

Future<http.Response> initResetProcess({required Map body}) async {
  final response = await retry(
    () async {
      return await http
          .post(Uri.parse('$baseUrl/api/auth/init-reset'),
              body: jsonEncode(body))
          .timeout(Duration(seconds: 5));
    },
    retryIf: (e) => e is http.ClientException || e is TimeoutException,
    maxAttempts: 5,
  );

  if (response.statusCode == 200) {
    return response;
  } else {
    throw Exception('Failed to connect to the server');
  }
}

Future<http.Response> verifyOtpResetProcess({required Map body}) async {
  final response = await retry(
    () async {
      return await http
          .post(Uri.parse('$baseUrl/api/auth/verify-reset'),
              body: jsonEncode(body))
          .timeout(Duration(seconds: 5));
    },
    retryIf: (e) => e is http.ClientException || e is TimeoutException,
    maxAttempts: 5,
  );

  if (response.statusCode == 200) {
    return response;
  } else {
    throw Exception('Failed to connect to the server');
  }
}

Future<http.Response> resetPasswordProcess({required Map body}) async {
  final response = await retry(
    () async {
      return await http
          .post(Uri.parse('$baseUrl/data'), body: jsonEncode(body))
          .timeout(Duration(seconds: 5));
    },
    retryIf: (e) => e is http.ClientException || e is TimeoutException,
    maxAttempts: 5,
  );

  if (response.statusCode == 200) {
    return response;
  } else {
    throw Exception('Failed to connect to the server');
  }
}
