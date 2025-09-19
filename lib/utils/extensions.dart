import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import 'package:ikommerce/utils/routes.dart' as app_route;

void backToRoot(context) {
  Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
}

void popUntilRoot(context) {
  Navigator.popUntil(context, ModalRoute.withName('/'));
}

void backToMain(context) {
  Navigator.pushNamedAndRemoveUntil(context, '/main', (_) => false);
}

void hideKeyboard(context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

void popScreen(BuildContext context, [dynamic data]) {
  Navigator.pop(context, data);
}

enum RouteTransition { slide, dualSlide, fade, material, cupertino, slideUp , slideBack}

Future pushScreen(BuildContext context, Widget buildScreen, [RouteTransition routeTransition = RouteTransition.slide, Widget? fromScreen]) async {
  dynamic data;
  switch (routeTransition) {
    case RouteTransition.slide:
      data = await Navigator.push(context, app_route.SlideRoute(page: buildScreen));
      break;
    case RouteTransition.fade:
      data = await Navigator.push(context, app_route.FadeRoute(page: buildScreen));
      break;
    case RouteTransition.material:
      data = await Navigator.push(context, MaterialPageRoute(builder: (context) => buildScreen));
      break;
    case RouteTransition.dualSlide:
      data = await Navigator.push(context, app_route.DualSlideRoute(enterPage: buildScreen, exitPage: fromScreen ?? context.widget));
      break;
    case RouteTransition.cupertino:
      data = await Navigator.push(context, CupertinoPageRoute(fullscreenDialog: true, builder: (context) => buildScreen));
      break;
    case RouteTransition.slideUp:
      data = await Navigator.push(context, app_route.SlideUpRoute(page: buildScreen));
      break;
    case RouteTransition.slideBack:
      data = await Navigator.push(context, app_route.SlideBackRoute(page: buildScreen));
      break;
  }
  return data;
}

void pushAndRemoveScreen(BuildContext context, {required Widget pageRef, RouteTransition routeTransition = RouteTransition.material}) {
  Route route;

  switch (routeTransition) {
    case RouteTransition.slide:
      route = app_route.SlideRoute(page: pageRef);
      break;
    case RouteTransition.fade:
      route = app_route.FadeRoute(page: pageRef);
      break;
    case RouteTransition.material:
      route = MaterialPageRoute(builder: (context) => pageRef);
      break;
    case RouteTransition.dualSlide:
      route = app_route.DualSlideRoute(enterPage: pageRef, exitPage: context.widget);
      break;
    case RouteTransition.cupertino:
      route = CupertinoPageRoute(fullscreenDialog: true, builder: (context) => pageRef);
      break;
    case RouteTransition.slideUp:
      route = app_route.SlideUpRoute(page: pageRef);
      break;
    case RouteTransition.slideBack:
      route = app_route.SlideBackRoute(page: pageRef);
      break;
  }

  Navigator.pushAndRemoveUntil(
    context,
    route,
    (Route<dynamic> route) => false,
  );
}

void pushAndReplacePreviousScreenWithHome(
  BuildContext context, {
  required Widget newPage,
  required Widget homeScreen,
  RouteTransition routeTransition = RouteTransition.slide,
}) {
  Route route;

  switch (routeTransition) {
    case RouteTransition.slide:
      route = app_route.SlideRoute(page: newPage);
      break;
    case RouteTransition.fade:
      route = app_route.FadeRoute(page: newPage);
      break;
    case RouteTransition.material:
      route = MaterialPageRoute(builder: (context) => newPage);
      break;
    case RouteTransition.dualSlide:
      route = app_route.DualSlideRoute(enterPage: newPage, exitPage: context.widget);
      break;
    case RouteTransition.cupertino:
      route = CupertinoPageRoute(fullscreenDialog: true, builder: (context) => newPage);
      break;
    case RouteTransition.slideUp:
      route = app_route.SlideUpRoute(page: newPage);
      break;
    case RouteTransition.slideBack:
      route = app_route.SlideBackRoute(page: newPage);
      break;
  }

  Navigator.pushReplacement(
    context,
    route,
  );
}

void handleCopy(BuildContext context, String text, String message) {
  Clipboard.setData(ClipboardData(text: text));
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        margin: EdgeInsets.zero,
        duration: const Duration(seconds: 2),
        content: Text(message),
        backgroundColor: Colors.grey[900],
        behavior: SnackBarBehavior.floating,
      ),
    );
}

/// Formats a DateTime object into a human-readable string in Indonesian format,
/// including day of the week, day of the month, month name, and year.
///
/// Returns:
///   `day` `day(int)` `month` `year`
///ex: Senin 2 Agustus 2022

Future<File> getTemporaryFileFromAsset(String assetPath) async {
  final byteData = await rootBundle.load(assetPath);
  final tempDir = await getTemporaryDirectory();
  final tempFile = File('${tempDir.path}/${assetPath.split('/').last}');
  return await tempFile.writeAsBytes(byteData.buffer.asUint8List());
}

String shortenText(String text, {int maxLength = 40}) {
  if (text.length > maxLength) {
    return '${text.substring(0, maxLength)}...';
  }
  return text;
}


String formatRupiah(num number) {
  final formatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );
  return formatter.format(number);
}
