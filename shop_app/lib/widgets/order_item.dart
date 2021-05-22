import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/models/order_item.dart';

class OrderItem extends StatefulWidget {
  final OrderModel order;
  OrderItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;

  void _expandItem() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('R\$${widget.order.amount}'),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(widget.order.dateTime),
            ),
            trailing: IconButton(
              onPressed: _expandItem,
              icon: Icon(
                _expanded ? Icons.expand_less : Icons.expand_more,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
