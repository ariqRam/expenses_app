import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double totalAmt;
  final double percentAmt;

  ChartBar({this.label, this.totalAmt, this.percentAmt});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((ctx, constraint) {
        return Column(
          children: <Widget>[
            Container(
                height: constraint.maxHeight * 0.15,
                child:
                    FittedBox(child: Text('\$${totalAmt.toStringAsFixed(0)}'))),
            SizedBox(height: constraint.maxHeight * 0.05),
            Container(
                height: constraint.maxHeight * 0.60,
                width: 10,
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: Color.fromRGBO(220, 220, 220, 1),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Container(
                      child: FractionallySizedBox(
                          heightFactor: percentAmt,
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorDark,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )),
                    ),
                  ],
                )),
            SizedBox(height: constraint.maxHeight * 0.05),
            Container(
              height: constraint.maxHeight * 0.15,
              child: FittedBox(child: Text(label)),
            ),
          ],
        );
      }),
    );
  }
}
