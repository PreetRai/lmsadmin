import 'package:flutter/material.dart';
import 'package:lmsadmin/pages/properties/property_tab.dart';

class TabPair {
  final Tab tab;
  final Widget view;
  TabPair({required this.tab, required this.view});
}

List<TabPair> tabPairs = [
  TabPair(
    tab: const Tab(
      text: 'Property',
    ),
    view: const Center(child: PropertTab()),
  ),
  TabPair(
    tab: const Tab(
      text: 'Oppertunities',
    ),
    view: const Center(
      child: Text(
        'null',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  )
];

class TabBarAndTabViews extends StatefulWidget {
  const TabBarAndTabViews({
    Key? key,
  }) : super(key: key);

  @override
  _TabBarAndTabViewsState createState() => _TabBarAndTabViewsState();
}

class _TabBarAndTabViewsState extends State<TabBarAndTabViews>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: tabPairs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // give the tab bar a height [can change height to preferred height]
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                25.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: TabBar(
                  controller: _tabController,
                  // give the indicator a decoration (color and border radius)
                  indicator: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: tabPairs.map((tabPair) => tabPair.tab).toList()),
            ),
          ),
          Expanded(
            child: TabBarView(
                controller: _tabController,
                children: tabPairs.map((tabPair) => tabPair.view).toList()),
          ),
        ],
      ),
    );
  }
}
