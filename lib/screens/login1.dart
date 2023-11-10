import 'package:flutter/cupertino.dart';

class login1 extends StatefulWidget {
  @override
  _login1State createState() => _login1State();
}

class _login1State extends State<login1> {
  //set up variables for username and password
  String username = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBrown,
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Cupertino Demo'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //cupertino Text Fields for username and password
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoTextField(
              placeholder: 'Username',
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
              clearButtonMode: OverlayVisibilityMode.editing,
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
            ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 12)),
            CupertinoTextField(
              placeholder: 'Password',
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
              obscureText: true,
              clearButtonMode: OverlayVisibilityMode.editing,
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}