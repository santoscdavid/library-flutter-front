import 'package:flutter/material.dart';
import 'package:library_flutter/controllers/RoutesController/routes_controller.dart';
import 'package:provider/provider.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RoutesController>(context);
    final routesIndex = provider.index;

    void _changeRoute(int index) {
      if (index != routesIndex) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, "/");
            break;
          case 1:
            Navigator.pushNamed(context, "/publishers");
            break;
          case 2:
            Navigator.pushNamed(context, "/books");
            break;
          case 3:
            Navigator.pushNamed(context, "/customers");
            break;
          case 4:
            Navigator.pushNamed(context, "/rents");
            break;
        }
      }
    }

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
      child: BottomNavigationBar(
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
        currentIndex: routesIndex,
        onTap: (newIndex) {
          provider.changeIndex(newIndex);
          _changeRoute(newIndex);
        },
        backgroundColor: Colors.transparent,
        selectedItemColor: Colors.white,
        selectedIconTheme: const IconThemeData(color: Colors.white),
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        elevation: 20,
      ),
    );
  }
}
