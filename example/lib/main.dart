import 'package:flutter/material.dart';
import 'package:jupiter_aggregator/jupiter_aggregator.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final client = JupiterAggregatorClient();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<JupiterIndexedRouteMap>(
        future: client.getIndexedRouteMap(),
        builder: (context, snapshot) {
          final data = snapshot.data;
          return Text('Got ${data?.mintKeys.length} keys');
        },
      ),
    );
  }
}
