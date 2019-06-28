import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class BoardingModel extends Model {
  PageController _controller =
      new PageController(initialPage: 1, viewportFraction: 1.0);

  get controller => _controller;

  gotoLogin() {
    _controller.animateToPage(
      0,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  gotoRegister() {
    _controller.animateToPage(
      2,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }
}
