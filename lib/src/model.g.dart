// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JupiterIndexedRouteMap _$JupiterIndexedRouteMapFromJson(
        Map<String, dynamic> json) =>
    JupiterIndexedRouteMap(
      mintKeys:
          (json['mintKeys'] as List<dynamic>).map((e) => e as String).toList(),
      indexedRouteMap: (json['indexedRouteMap'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as int).toList()),
      ),
    );

Map<String, dynamic> _$JupiterIndexedRouteMapToJson(
        JupiterIndexedRouteMap instance) =>
    <String, dynamic>{
      'mintKeys': instance.mintKeys,
      'indexedRouteMap': instance.indexedRouteMap,
    };

JupiterSwapTransactions _$JupiterSwapTransactionsFromJson(
        Map<String, dynamic> json) =>
    JupiterSwapTransactions(
      setupTransaction: json['setupTransaction'] as String?,
      swapTransaction: json['swapTransaction'] as String,
      cleanupTransaction: json['cleanupTransaction'] as String?,
    );

Map<String, dynamic> _$JupiterSwapTransactionsToJson(
        JupiterSwapTransactions instance) =>
    <String, dynamic>{
      'setupTransaction': instance.setupTransaction,
      'swapTransaction': instance.swapTransaction,
      'cleanupTransaction': instance.cleanupTransaction,
    };

JupiterRoute _$JupiterRouteFromJson(Map<String, dynamic> json) => JupiterRoute(
      inAmount: json['inAmount'] as int,
      outAmount: json['outAmount'] as int,
      outAmountWithSlippage: json['outAmountWithSlippage'] as int,
      priceImpactPct: (json['priceImpactPct'] as num?)?.toDouble(),
      marketInfos: (json['marketInfos'] as List<dynamic>)
          .map((e) => JupiterMarket.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$JupiterRouteToJson(JupiterRoute instance) =>
    <String, dynamic>{
      'inAmount': instance.inAmount,
      'outAmount': instance.outAmount,
      'outAmountWithSlippage': instance.outAmountWithSlippage,
      'priceImpactPct': instance.priceImpactPct,
      'marketInfos': instance.marketInfos,
    };

JupiterMarket _$JupiterMarketFromJson(Map<String, dynamic> json) =>
    JupiterMarket(
      id: json['id'] as String,
      label: json['label'] as String,
      inputMint: json['inputMint'] as String,
      outputMint: json['outputMint'] as String,
      notEnoughLiquidity: json['notEnoughLiquidity'] as bool,
      inAmount: json['inAmount'] as int,
      outAmount: json['outAmount'] as int,
      priceImpactPct: (json['priceImpactPct'] as num?)?.toDouble(),
      lpFee: JupiterFee.fromJson(json['lpFee'] as Map<String, dynamic>),
      platformFee:
          JupiterFee.fromJson(json['platformFee'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JupiterMarketToJson(JupiterMarket instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'inputMint': instance.inputMint,
      'outputMint': instance.outputMint,
      'notEnoughLiquidity': instance.notEnoughLiquidity,
      'inAmount': instance.inAmount,
      'outAmount': instance.outAmount,
      'priceImpactPct': instance.priceImpactPct,
      'lpFee': instance.lpFee,
      'platformFee': instance.platformFee,
    };

JupiterFee _$JupiterFeeFromJson(Map<String, dynamic> json) => JupiterFee(
      amount: (json['amount'] as num).toDouble(),
      mint: json['mint'] as String,
      pct: (json['pct'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$JupiterFeeToJson(JupiterFee instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'mint': instance.mint,
      'pct': instance.pct,
    };
