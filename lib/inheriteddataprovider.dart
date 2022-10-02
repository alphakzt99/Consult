import 'package:flutter/material.dart';


class InheritedDataProvider extends InheritedWidget {

  final ScrollController InheritedScrollcontroller;
  InheritedDataProvider({
    Key? key,
    
    required Widget child,
    required this.InheritedScrollcontroller,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedDataProvider oldWidget) =>
      
      InheritedScrollcontroller != oldWidget.InheritedScrollcontroller;
  static InheritedDataProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedDataProvider>()!;
}
