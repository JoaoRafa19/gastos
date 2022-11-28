import 'package:flutter/material.dart';
import 'package:gastos/pages/core/bindings.dart';
import 'package:gastos/pages/main/main.page.dart';
import 'package:gastos/pages/transactions/transactions.page.dart';
import 'package:get/get.dart';

enum InternalPages {
  main(iconData: Icons.home, name: "Home", routeName: MainBinging.name),
  transaction(
      iconData: Icons.monetization_on,
      routeName: TransactionsBindings.name,
      name: "Transactions");

  final IconData iconData;
  final String name;
  final String routeName;
  const InternalPages(
      {required this.iconData, required this.name, required this.routeName});
}

