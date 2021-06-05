import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gallery_v4/wrapper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // check if firebase is initialized
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          _initialized = true;
        });
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Something went wrong!"),
          ),
        ),
      );
    }

    // Show a loader until Firebase is initialized
    if (!_initialized) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Something loading!"),
          ),
        ),
      );
    }

    return Wrapper();
  }
}
