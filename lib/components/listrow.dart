import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:croshez/main.dart';

class ListRow extends StatelessWidget {
  const ListRow({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: double.infinity,
          height: size.height * 0.1,
          // color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(color: Colors.grey[400]),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 6,
                child: Container(color: Colors.grey[600]),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Container(color: Colors.grey[400]),
              )
            ],
          )),
    );
  }
}
