import 'package:flutter/material.dart';
import 'package:mobile_app/screens/contact_screen.dart';
import 'package:mobile_app/screens/customer_login_screen.dart';
import 'package:mobile_app/screens/supplier_login_screen.dart';
import 'package:mobile_app/styles.dart';

import '../screens/about_screen.dart';
import '../screens/home_screen.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool isMobileMenuOpen = false;

  void toggleMobileMenu() {
    setState(() {
      isMobileMenuOpen = !isMobileMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width <= 768;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: AppStyles.headerDecoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              Image.asset('assets/logo.png', height: 50),

              // Navigation Menu (Desktop View)
              if (!isMobile)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _navItem('Home', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                      );
                    }),
                    _navItem('Rent Your Vehicle', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SupplierLoginScreen()),
                  );
                    }),
                    _navItem('Find Your Vehicle', () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CustomerLoginScreen()),
                      );
                    }),
                    _navItem('About', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AboutScreenPage()),
                      );
                    }),
                    _navItem('Contact', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactScreenPage()),
                      );
                    }),
                  ],
                ),

              // Mobile Menu Button
              if (isMobile)
                IconButton(
                  icon: Icon(isMobileMenuOpen ? Icons.close : Icons.menu),
                  onPressed: toggleMobileMenu,
                ),
            ],
          ),
        ),

        // Mobile Menu (Expanded)
        if (isMobile && isMobileMenuOpen)
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                _navItem('Home', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                }),
                _navItem('Rent Your Vehicle', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SupplierLoginScreen()),
                  );
                }),
                _navItem('Find Your Vehicle', () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CustomerLoginScreen()),
                  );
                }),
                _navItem('About', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutScreenPage()),
                  );
                }),
                _navItem('Contact', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContactScreenPage()),
                   );
                }),
              ],
            ),
          ),
      ],
    );
  }

  Widget _navItem(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: InkWell(
        onTap: onTap,
        child: Text(title, style: AppStyles.navText),
      ),
    );
  }
}