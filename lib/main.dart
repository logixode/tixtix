import 'package:flutter/material.dart';
import 'package:tixtix/services/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                SignInSignUpResult result = await AuthServices.signUp(
                    'rohmad1230@gmail.com',
                    '123456',
                    'Rohmad',
                    ['Action', 'Horror', 'Music', 'Drama'],
                    'English');
                if (result.user == null) {
                  print(result.message);
                } else
                  print(result.user.toString());
              },
              child: Text('Sign Up'),
            )
          ],
        ),
      )),
    );
  }
}
