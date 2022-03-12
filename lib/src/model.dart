import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class JupiterIndexedRouteMap {
  JupiterIndexedRouteMap({
    required this.mintKeys,
    required this.indexedRouteMap,
  });

  final List<String> mintKeys;
  final Map<String, List<int>> indexedRouteMap;

  factory JupiterIndexedRouteMap.fromJson(Map<String, dynamic> json) =>
      _$JupiterIndexedRouteMapFromJson(json);

  Map<String, dynamic> toJson() => _$JupiterIndexedRouteMapToJson(this);
}

@JsonSerializable()
class JupiterSwapTransactions {
  JupiterSwapTransactions({
    required this.setupTransaction,
    required this.swapTransaction,
    required this.cleanupTransaction,
  });

  final String? setupTransaction;
  final String swapTransaction;
  final String? cleanupTransaction;

  factory JupiterSwapTransactions.fromJson(Map<String, dynamic> json) =>
      _$JupiterSwapTransactionsFromJson(json);

  Map<String, dynamic> toJson() => _$JupiterSwapTransactionsToJson(this);
}

@JsonSerializable()
class JupiterRoute {
  JupiterRoute({
    required this.inAmount,
    required this.outAmount,
    required this.outAmountWithSlippage,
    required this.priceImpactPct,
    required this.marketInfos,
  });

  final int inAmount;
  final int outAmount;
  final int outAmountWithSlippage;
  final double? priceImpactPct;
  final List<JupiterMarket> marketInfos;

  bool isSameRouteAs(JupiterRoute other) {
    if (marketInfos.length != other.marketInfos.length) return false;
    for (var i = 0; i < marketInfos.length; i++) {
      if (marketInfos[i].id != other.marketInfos[i].id) return false;
    }
    return true;
  }

  factory JupiterRoute.fromJson(Map<String, dynamic> json) =>
      _$JupiterRouteFromJson(json);

  Map<String, dynamic> toJson() => _$JupiterRouteToJson(this);
}

@JsonSerializable()
class JupiterMarket {
  JupiterMarket({
    required this.id,
    required this.label,
    required this.inputMint,
    required this.outputMint,
    required this.notEnoughLiquidity,
    required this.inAmount,
    required this.outAmount,
    required this.priceImpactPct,
    required this.lpFee,
    required this.platformFee,
  });

  final String id;
  final String label;
  final String inputMint;
  final String outputMint;
  final bool notEnoughLiquidity;
  final int inAmount;
  final int outAmount;
  final double? priceImpactPct;
  final JupiterFee lpFee;
  final JupiterFee platformFee;

  factory JupiterMarket.fromJson(Map<String, dynamic> json) =>
      _$JupiterMarketFromJson(json);

  Map<String, dynamic> toJson() => _$JupiterMarketToJson(this);
}

@JsonSerializable()
class JupiterFee {
  JupiterFee({
    required this.amount,
    required this.mint,
    required this.pct,
  });

  final double amount;
  final String mint;
  final double? pct;

  factory JupiterFee.fromJson(Map<String, dynamic> json) =>
      _$JupiterFeeFromJson(json);

  Map<String, dynamic> toJson() => _$JupiterFeeToJson(this);
}
