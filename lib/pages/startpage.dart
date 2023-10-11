import 'package:location/location.dart';
import 'package:stickmap/models/map.dart';
import 'package:flutter/material.dart';

class Startpage extends StatefulWidget {
  const Startpage({super.key, required this.title});

  final String title;

  @override
  State<Startpage> createState() => _StartpageState();
}

class _StartpageState extends State<Startpage> {
  @override
  @protected
  @mustCallSuper
  initState() {
    super.initState();
    _getLocation();
  }

  void _getLocation() async {
    final location = Location();
    final hasPermissions = await location.hasPermission();
    if (hasPermissions != PermissionStatus.granted) {
      await location.requestPermission();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                child: Center(child: Text('Stickmap')),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () => {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Eyo')))
                },
              )
            ],
          ),
        ),
        body: const StickMap());
  }
}