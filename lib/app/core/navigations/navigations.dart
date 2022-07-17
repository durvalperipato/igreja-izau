import 'package:flutter/widgets.dart';
import 'package:igreja_izau/app/modules/obreiros/obreiros_page.dart';

enum Body {
  //membros(MembroPage()),
  obreiros(ObreirosPage());

  const Body(this.child);
  final Widget child;
}
