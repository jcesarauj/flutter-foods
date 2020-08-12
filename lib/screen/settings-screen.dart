import 'package:flutter/material.dart';
import 'package:flutterMeats/components/main-drawer.dart';
import 'package:flutterMeats/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.settings, this.onSettingsChanged);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
      String title, String subTitle, bool value, Function(bool) onChange) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subTitle),
      value: value,
      onChanged: (value) {
        onChange(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(20),
              child: Text('Configurações',
                  style: Theme.of(context).textTheme.title)),
          Expanded(
            child: ListView(
              children: <Widget>[
                _createSwitch(
                    "Sem Glutén",
                    "Só exibe refeições sem glutem",
                    settings.isGlutenFree,
                    (value) => setState(() => settings.isGlutenFree = value)),
                _createSwitch(
                    "Sem Lactose",
                    "Só exibe refeições sem lactose",
                    settings.isLactoseFree,
                    (value) => setState(() => settings.isLactoseFree = value)),
                _createSwitch(
                    "Vegana",
                    "Só exibe refeições Veganas",
                    settings.isVegan,
                    (value) => setState(() => settings.isVegan = value)),
                _createSwitch(
                    "Vegetariano",
                    "Só exibe refeições Vegetarianas",
                    settings.isVegetarian,
                    (value) => setState(() => settings.isVegetarian = value))
              ],
            ),
          )
        ],
      ),
    );
  }
}
