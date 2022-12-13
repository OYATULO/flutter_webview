import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'internet_not_connected.dart';

class Isconected extends StatefulWidget {
  const Isconected({Key? key}) : super(key: key);
  @override
  State<Isconected> createState() => _IsconectedState();
}

class _IsconectedState extends State<Isconected> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Visibility(
              visible: Provider.of<InternetConnectionStatus>(context) ==
                  InternetConnectionStatus.disconnected,
              child: const InternetNotAvailable(),
            ),
            Provider.of<InternetConnectionStatus>(context) ==
                    InternetConnectionStatus.disconnected
                ? Expanded(
                    child: Center(
                      child: Text(
                        'подключитесь к интернету',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  )
                : const Expanded(
                    child:MyHomePage()
                  ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState(); 
}
class _MyHomePageState extends State<MyHomePage> {
  late WebViewController _webViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: WillPopScope(
          onWillPop: () async {
            if (await _webViewController.canGoBack()) {
              _webViewController.goBack();
              return false;
            } else {
              return true;
            }
          },
          child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: WebView(
                initialUrl: "https://ucar.tj",
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _webViewController = webViewController;
                },
              )),
        ));
  }
}