import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("زیارت ناحیہ"),
        ),
        body: Center(
          child: TextButton(
            onPressed: () => {},
            child: Text("زیارت پڑھیں"),
          ),
        ));
  }
}
