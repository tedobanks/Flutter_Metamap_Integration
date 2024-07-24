import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:metamap_plugin_flutter/metamap_plugin_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MetaMap flutter plugin demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'MetaMap Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void showMetaMapFlow() {
    final metaData = {"key": "value"};
    MetaMapFlutter.showMetaMapFlow(
        "64c18fae208a49001a8e87aa", "64c18fae879fe6001c849d3e", metaData);
    MetaMapFlutter.resultCompleter.future.then((result) =>
        Fluttertoast.showToast(
            msg: result is ResultSuccess
                ? "Success ${result.verificationId}"
                : "Cancelled",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM));
  }

  void showMetaMapBVNFlow() {
    final metaData = {"key": "value"};
    MetaMapFlutter.showMetaMapFlow(
        "64c18fae208a49001a8e87aa", "64ef84d825f5aa001c414f58", metaData);
    MetaMapFlutter.resultCompleter.future.then((result) =>
        Fluttertoast.showToast(
            msg: result is ResultSuccess
                ? "Success ${result.verificationId}"
                : "Cancelled",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: showMetaMapBVNFlow,
              child: const Text('BVN'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: showMetaMapFlow,
              child: const Text('KYC'),
            )
          ],
        ),
      ),
    );
  }
}
