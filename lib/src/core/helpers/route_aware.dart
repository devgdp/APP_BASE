import 'package:flutter/material.dart';
import 'app_helper.dart';

abstract class RouteAwareState<T extends StatefulWidget> extends State<T>
    with RouteAware {
  @override
  void didChangeDependencies() {
    AppHelper.routerObserver
        .subscribe(this, ModalRoute.of(context) as PageRoute);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    AppHelper.routerObserver.unsubscribe(this);
    super.dispose();
  }
}
