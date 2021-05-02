import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spending;
  final double percentange;

  const ChartBar({
    Key? key,
    required this.label,
    required this.spending,
    required this.percentange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constrain) {
      return Column(
        children: [
          Container(
            height: constrain.maxHeight * 0.15,
            child: FittedBox(
              child: Text("R\$: ${spending.toStringAsFixed(0)}"),
            ),
          ),
          SizedBox(height: constrain.maxHeight * 0.05),
          Container(
            width: 10,
            height: constrain.maxHeight * 0.6,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: percentange.isNaN ? percentange : 0.1,
                  child: Container(
                    decoration:
                        BoxDecoration(color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: constrain.maxHeight * 0.05),
          Container(
            height: constrain.maxHeight * 0.15,
            child: FittedBox(
              child: Text(label),
            ),
          ),
        ],
      );
    });
  }
}
