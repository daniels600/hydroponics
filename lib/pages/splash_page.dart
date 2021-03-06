import 'package:flutter/material.dart';
import 'package:hydroponics/pages/home_page.dart';
import 'package:hydroponics/pages/login_page.dart';
import 'package:hydroponics/stores/login_store.dart';
import 'package:hydroponics/theme.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Provider.of<LoginStore>(context, listen: false).isAlreadyAuthenticated().then((result) {
      if (result) {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => const HomePage()), (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => const LoginPage()), (Route<dynamic> route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MyColors.primaryColor,
    );
  }
}
