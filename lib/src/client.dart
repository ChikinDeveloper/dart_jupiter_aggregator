import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model.dart';

class JupiterAggregatorClient {
  static const apiHost = 'quote-api.jup.ag';
  static const apiRoot = '/v1';

  final client = http.Client();

  /// Returns a hash map, input mint as key and an array of valid output mint
  /// as values, token mints are indexed to reduce the file size
  Future<JupiterIndexedRouteMap> getIndexedRouteMap() async {
    final url = Uri.https('quote-api.jup.ag', '$apiRoot/indexed-route-map');
    final response = await client.get(url);
    final Map<String, dynamic> data = jsonDecode(response.body);
    return JupiterIndexedRouteMap.fromJson(data);
  }

  /// Returns a hash map, input mint as key and an array of valid output mint
  /// as values
  @Deprecated('Use getIndexedRouteMap instead')
  Future<Map<String, List<String>>> getRouteMap() async {
    final url = Uri.https('quote-api.jup.ag', '$apiRoot/route-map');
    final response = await client.get(url);
    final Map data = jsonDecode(response.body);
    return data.map<String, List<String>>((key, value) =>
        MapEntry<String, List<String>>(
            key as String, value.map<String>((e) => e as String).toList()));
  }

  /// Get quote for a given input mint, output mint and amount
  /// [inputMint] input token mint
  /// [outputMint] output token mint
  /// [amount] input token amount
  /// [slippage] slippage tolerance (percent)
  /// [feeBps] host fee bps
  Future<List<JupiterRoute>> getQuote({
    required String inputMint,
    required String outputMint,
    required int amount,
    double? slippage,
    double? feeBps,
  }) async {
    final url = Uri.https('quote-api.jup.ag', '$apiRoot/quote', {
      'inputMint': inputMint,
      'outputMint': outputMint,
      'amount': amount.toString(),
      if (slippage != null) 'slippage': slippage.toString(),
      if (feeBps != null) 'feeBps': feeBps.toString(),
    });
    final response = await client.get(url);
    final List data = jsonDecode(response.body)['data'];
    final result =
        data.map<JupiterRoute>((e) => JupiterRoute.fromJson(e)).toList();
    return result;
  }

  /// Get swap serialized transactions for a route
  /// [userPublicKey] swap user public key
  /// [route] route (@see [getQuote])
  Future<JupiterSwapTransactions> getSwapTransactions({
    required String userPublicKey,
    required JupiterRoute route,
  }) async {
    final url = Uri.https('quote-api.jup.ag', '$apiRoot/swap');
    final response = await client.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'route': route.toJson(),
          'userPublicKey': userPublicKey,
        }));
    return JupiterSwapTransactions.fromJson(jsonDecode(response.body));
  }
}
