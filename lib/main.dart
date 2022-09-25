import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo_app/next_page.dart';
import 'package:flutter_demo_app/web_view_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'フラッターアプリ１'),
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
  List<String> titleList = ['Amazon','楽天','Yahoo!'];
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text('WebViewScreen'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => WebViewScreen())
              );

            },
          ),
          Divider(),

          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text('showAboutDialog'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationIcon: Icon(Icons.photo),
                applicationName: "ふらったーアプリ",
                applicationVersion: "1.0.0",
                applicationLegalese: "こんにちは",
              );
            },
          ),
          Divider(),


          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text('showDialog'),
            onTap: () {

              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return AlertDialog(
                    title: Text("タイトル"),
                    content: Text("メッセージメッセージメッセージメッセージメッセージメッセージ"),
                    actions: <Widget>[
                      // ボタン領域
                      TextButton(
                        child: Text("Cancel"),
                        onPressed: () => Navigator.pop(context),
                      ),
                      TextButton(
                        child: Text("OK"),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  );
                },
              );

              },
          ),
          Divider(),


          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text('showDialog WebView'),
            onTap: () {

              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {

                  return AlertDialog(
                    title: Text("AlertDialogの中にWebViewを表示"),
                    content: Container(
                      child: WebView(
                        javascriptMode: JavascriptMode.unrestricted,
                        onWebViewCreated: (WebViewController webViewController) async {
                          await webViewController.loadUrl('https://yahoo.co.jp');
                        },
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text("閉じる"),
                        onPressed: () => Navigator.of(context, rootNavigator: true).pop(context), // これでダイアログが閉じられる
                      ),
                    ],
                  );

                },
              );

            },
          ),
          Divider(),


        ],
      ),
      // body:ListView.builder(
      //     itemCount: titleList.length,
      //     itemBuilder: (context, index) {
      //       return Column(
      //         children: [
      //           ListTile(
      //             leading: Icon(Icons.key),
      //             title: Text(titleList[index]),
      //             onTap: () {
      //               print('リストがタップされました');
      //               Navigator.push(context, MaterialPageRoute(
      //                   builder: (context) => NextPage(titleList[index])));
      //             }
      //           ),
      //           Divider(height: 0,),
      //         ]
      //       );
      //     }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          titleList.add('Google');
          print(titleList);
          setState(() {
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
