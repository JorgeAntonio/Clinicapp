import 'package:app_clinica/src/features/presentation/tabs/profile_tabs/view/profile_page.dart';
import 'package:app_clinica/src/features/presentation/tabs/schedule_tabs/view/schedule_page.dart';
import 'package:app_clinica/src/features/presentation/tabs/specialities_tabs/view/specialities_page.dart';
import 'package:flutter/material.dart';
//COLORS
import 'package:app_clinica/src/colors/colors.dart';
//TABS
import 'package:app_clinica/src/features/presentation/tabs/modulo_tabs/view/module_tabs.dart';

class TabsPage extends StatefulWidget {
  static Widget create(BuildContext context) => TabsPage();
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  List<Widget> _widgetOption = [
    ModuloTab(),
    DoctorsPage(),
    SchedulePage(),
    ProfilePage()
  ];

  int _selectedItemIndex = 0;

  void _cambiarWidget(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOption.elementAt(_selectedItemIndex),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
        iconSize: 24.0,
        selectedItemColor: myPrimaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedItemIndex,
        onTap: _cambiarWidget,
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital), label: 'Modulo'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin), label: 'Especialidades'),
          BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'Citas'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Cuenta')
        ]);
  }
}
