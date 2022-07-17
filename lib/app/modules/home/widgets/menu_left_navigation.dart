// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:igreja_izau/app/modules/home/controller/home_controller.dart';

class MenuLeftNavigation extends StatelessWidget {
  final int selectedIndex;

  const MenuLeftNavigation({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: selectedIndex,
      elevation: 5,
      minWidth: 100,
      labelType: NavigationRailLabelType.all,
      selectedLabelTextStyle: TextStyle(color: Colors.grey[700]),
      unselectedLabelTextStyle: TextStyle(color: Colors.grey[300]),
      backgroundColor: Colors.white,
      onDestinationSelected: (index) {
        Modular.get<HomeController>()
            .selectedIndexOfMenuLeftNavigation(selectedIndex: index);
      },
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.people),
          label: Text('Membros'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.perm_contact_cal),
          label: Text('Obreiros'),
        ),
      ],
    );
  }
}
