import 'package:flutter/material.dart';
import 'dart:html' as html;

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('4Trainer Dashboard'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: GridView.count(
            crossAxisCount: _getCrossAxisCount(context),
            padding: const EdgeInsets.all(24),
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1.5,
            children: const [
              DashboardNavigation(
                title: 'Edge Pairing Trainer',
                description: 'L5E trainer',
                icon: Icons.train_outlined,
                route: '/trainer',
                color: Colors.blue,
              ),
              DashboardNavigation(
                title: 'Edge solver',
                description: 'Modified batch solver to care only about edge pairing',
                icon: Icons.lightbulb_outline_sharp,
                route: '/bird/is-the-word',
                color: Colors.amber,
                isExternalUrl: true,
              ),
              DashboardNavigation(
                title: 'L5E Image catalog',
                description: 'Images for L5E cases',
                icon: Icons.image_outlined,
                route: '/switchoun',
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1200) return 3;
    if (width > 800) return 2;
    return 1;
  }
}

class DashboardNavigation extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final String route;
  final Color color;
  final bool isExternalUrl;

  const DashboardNavigation({
    required this.title,
    required this.description,
    required this.icon,
    required this.route,
    required this.color,
    this.isExternalUrl = false,
  });

  Future<void> _handleNavigation(BuildContext context) async {
    if (isExternalUrl) {
      html.window.location.href = route;
    } else {
      Navigator.pushNamed(context, route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () => _handleNavigation(context),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.1),
                color.withOpacity(0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 48,
                color: color,
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
