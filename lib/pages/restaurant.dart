import 'package:flutter/material.dart';

class RestaurantPage extends Page {
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (_) {
        return Container();
      },
    );
  }
}
