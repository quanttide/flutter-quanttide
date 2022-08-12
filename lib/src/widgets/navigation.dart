/// 导航栏
///
/// 通常用在APP首页和一级页面。
/// 当一级页面数量少于5个、并且不需要二级导航时，使用`AdaptiveNavigationBar`，通常为C端应用；
/// 当一级页面需要二级导航时，使用``，通常为企业官网。
/// 当一级页面数量多于5个、并且通常还需要需要二级导航时，使用`NavigationDrawer`，通常为B端的功能性应用；
///
/// 遵循Material Design相关规范：
///   - Navigation: https://material.io/design/navigation/understanding-navigation.html
///   - NavigationDrawer:

import 'package:flutter/material.dart';


/// Adaptive的NavigationBar
///
/// 一级页面数量少于5个、并且不需要二级导航。
/// 通常为C端应用。
class AdaptiveNavigationBar extends StatelessWidget {
  final List<Map<String, String>> items;

  const AdaptiveNavigationBar({
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
      items: [],
    );
  }
}


/// Material Design风格的Navigation Drawer
///
/// 一级页面数量多于5个、并且通常还需要需要二级导航。
/// 通常为B端的功能性应用。
class NavigationDrawer extends StatelessWidget {
  final List<Map<String, String>> items;

  const NavigationDrawer({
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // https://docs.flutter.dev/cookbook/design/drawer
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          Column(
            children: items.map(
              (item) => DrawerListTile(
                  title: item['title']!,
                  svgSrc: item['icon']!,
                  press: (){}
              )
            ).toList(),
          ),
        ],
      ),
    );
  }
}


class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      // leading: SvgPicture.asset(
      //   svgSrc,
      //   color: Colors.white54,
      //   height: 16,
      // ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}