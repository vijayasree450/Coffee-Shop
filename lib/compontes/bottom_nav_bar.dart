// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

// class BottomNavBar extends StatelessWidget {
//   void Function(int)? onTabChange;
//   BottomNavBar({super.key,required this.onTabChange});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
    
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       child: GNav(
//         onTabChange: (value) => onTabChange!(value),
//         color: Colors.grey[400],
//         gap: 8,
//         mainAxisAlignment: MainAxisAlignment.center,
//         activeColor: Colors.grey[700],
//         tabBackgroundColor: Colors.grey.shade300,
//         tabBorderRadius: 24,
//         tabActiveBorder: Border.all(color: Colors.white,),

//         tabs: const [
//           GButton(
//             icon: Icons.home,
//             text: 'Shop',
//           ),
//           GButton(
//             icon: Icons.shopping_bag_outlined,
//             text: 'Cart',
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {

  final void Function(int)? onTabChange; // ✅ FINAL

  const BottomNavBar({
    super.key,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(icon: Icons.home, text: 'Shop'),
          GButton(icon: Icons.shopping_bag, text: 'Cart'),
        ],
      ),
    );
  }
}
