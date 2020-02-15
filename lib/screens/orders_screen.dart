import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_bar_deco.dart';
import '../widgets/order_card.dart';
import '../providers/orders.dart';

class OrdersScreen extends StatefulWidget {

  static const routeName = '/orders_screen';

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  
  @override
  Widget build(BuildContext context) {

    final orders = Provider.of<Orders>(context).orders;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: AppBarDeco("Your Medicines"),
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => OrderCard(orders[index]),
        itemCount: orders.length,
      ),
    );
  }
}