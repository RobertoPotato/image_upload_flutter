import 'package:flutter/material.dart';
import 'upload.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Upload Image',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  void switchScreen(str, context, Page) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Page));
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter file upload example"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
                "Insert the URL that will receive the Multipart POST request (including the starting http://)",
                style: Theme.of(context).textTheme.headline),
            TextField(
              controller: controller,
              onSubmitted: (str) => switchScreen(str, context, StartPage()),
            ),
            FlatButton(
              child: Text("Take me to the upload screen"),
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UploadPage(
                      url: controller.text,
                    ),
                  ),
                ),
              },
            )
          ],
        ),
      ),
    );
  }
}
