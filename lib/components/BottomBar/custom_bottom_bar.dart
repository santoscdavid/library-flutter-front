import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/controllers/RoutesController/routes_controller.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    var store = Modular.get<RoutesController>();

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.purple,
            Colors.deepPurple,
          ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Observer(
        builder: (_) => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.deepPurple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Editoras',
              backgroundColor: Colors.deepPurple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Livros',
              backgroundColor: Colors.deepPurple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'Clientes',
              backgroundColor: Colors.deepPurple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Alugueis',
              backgroundColor: Colors.deepPurple,
            ),
          ],
          currentIndex: store.selectedIndex,
          onTap: (newIndex) {
            if (newIndex != store.selectedIndex) {
              switch (newIndex) {
                case 0:
                  Modular.to.navigate("/");
                  break;
                case 1:
                  Modular.to.navigate("/publishers");
                  break;
                case 2:
                  Modular.to.navigate("/books");
                  break;
                case 3:
                  Modular.to.navigate("/customers");
                  break;
                case 4:
                  Modular.to.navigate("/rents");
                  break;
              }
            }
            store.changeIndex(newIndex);
          },
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.white,
          selectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedItemColor: Colors.white54,
          type: BottomNavigationBarType.fixed,
          elevation: 20,
        ),
      ),
    );
  }
}
