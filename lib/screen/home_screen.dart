import 'package:flutter/material.dart';

// web view plugin import
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {

  WebViewController? controller;
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Code Factory'),
        centerTitle: true,

        leading: IconButton(
          onPressed: () {
            controller!.goBack();
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),

        actions: [
          IconButton(
              onPressed: () {
                if(controller != null) {
                  controller!.loadUrl('https://blog.codefactory.ai');
                }
              },
              icon: Icon(
                Icons.home,
              ),
          ),
          IconButton(
              onPressed: () {
                controller!.goForward();
              },
              icon: Icon(
                Icons.arrow_forward,
              ),
          ),

        ],
      ),
      body: WebView(
        // onWebViewCreated : WebView가 생성되면 자동으로 실행.
        onWebViewCreated: (WebViewController controller) {
          this.controller = controller;
        },


        initialUrl: 'https://blog.codefactory.ai',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

}