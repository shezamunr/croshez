import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:croshez/main.dart';
import 'package:croshez/components/listrow.dart';

class rowcols extends StatefulWidget {
  const rowcols({super.key});
  @override
  State<rowcols> createState() => _rowcolsState();
}

class _rowcolsState extends State<rowcols> {
  @override
  Widget build(BuildContext context) {
    final List _rows = [
      'row1',
      'row2',
      'row3',
      'row4',
      'row5',
      'row1',
      'row2',
      'row3',
      'row4',
      'row5'
    ];

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Column(children: [
          Container(
            width: double.infinity,
            height: size.height * 0.3,
            color: Colors.grey,
          ),
          Expanded(
            child: ListView.builder(
              // shrinkWrap: true,
              itemCount: _rows.length,
              itemBuilder: (context, index) {
                return ListRow();
              },
            ),
          )
        ]),
      ),
    );
  }
}
