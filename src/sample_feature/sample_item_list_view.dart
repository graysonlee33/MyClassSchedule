import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'sample_item.dart';
import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    super.key,
    this.items = const [SampleItem(1, "AP Physics C", "Explore concepts such as kinematics; Newton's laws of motion, work, energy, and power; systems of particles and linear momentum; rotation; oscillations; and gravitation. You'll do hands-on laboratory work and in-class activities to investigate phenomena and use calculus to solve problems.", true),
     SampleItem(2, "AP English Literature and Composition", "Learn how to understand and evaluate works of fiction, poetry, and drama from various periods and cultures. You’ll read literary works and write essays to explain and support your analysis of them.", true
    ), SampleItem(3, "AP Calculus BC", "Explore the concepts, methods, and applications of differential and integral calculus, including topics such as parametric, polar, and vector functions, and series. You’ll perform experiments and investigations and solve problems by applying your knowledge and skills.", true),
     SampleItem(4, "AP Macroeconomics", "Explore the principles of economics that apply to an economic system as a whole. You’ll use graphs, charts, and data to analyze, describe, and explain economic concepts.", true), SampleItem(5, "Practicum in Government"
     , "Students gain hands-on experience shadowing attorneys. Students will observe the legal system in practice through this year long internship. Students must complete 320 hours of on field site work in order to recieve credit.", false)],
  });

  static const routeName = '/';

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('My Class Schedule'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
            title: Text(item.name),
            leading: const CircleAvatar(
              // Display the Flutter Logo image asset.
              foregroundImage: AssetImage('assets/images/flutter_logo.png'),
            ),
            onTap: () {
              // Navigate to the details page. If the user leaves and returns to
              // the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.pushNamed(
                context,
                SampleItemDetailsView.routeName,arguments: 
                SampleItem(item.id, item.name, item.about, item.advanced), 
              );
            }
          );
        },
      ),
    );
  }
}
