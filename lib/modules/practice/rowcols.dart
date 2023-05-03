import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:croshez/main.dart';

class rowcols extends StatelessWidget {
  const rowcols({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: 100,
          width: 100,
          color: Colors.yellow,
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.orange,
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.red,
        ),
      ]),
    );
  }
}
