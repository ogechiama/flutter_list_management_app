import 'package:flutter/material.dart';

import '../models/item.dart';
import 'detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MasterScreen(),
    );
  }
}

class MasterScreen extends StatefulWidget {
  const MasterScreen({super.key});

  @override
  State<MasterScreen> createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  final TextEditingController _searchController = TextEditingController();
  late List<Item> _allItems;
  List<Item> _filteredItems = [];

  // Filtering states
  String _selectedcategory = 'All';
  final List<String> _categories = ['All', 'Technology', 'Design', 'Business'];

  @override
  void initState() {
    super.initState();
    // Generate sample data
    _allItems = List.generate(20, (index) {
      String assignedcategory;
      if (index % 3 == 0) {
        assignedcategory = "Technology";
      } else if (index % 3 == 1) {
        assignedcategory = 'Design';
      } else {
        assignedcategory = 'Business';
      }
      return Item(
        id: '${index + 1}',
        title: 'Master Item ${(index + 1).toString().padLeft(2, '0')}',
        subtitle: 'Description details for item ${index + 1}.',
        category: assignedcategory,
      );
    });
    _filteredItems = List.from(_allItems);
  }

  void _runFilter() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems = _allItems.where((item) {
        final matchQuery =
            query.isEmpty ||
            item.title.toLowerCase().contains(query) ||
            item.subtitle.toLowerCase().contains(query);
        final matchescategory =
            _selectedcategory == 'All' || item.category == _selectedcategory;
        return matchQuery && matchescategory;
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Master List & Catalog'), elevation: 2),
      body: Column(
        children: [
          // Search Input Field
          Padding(
            padding: EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              onChanged: ((value) => _runFilter()),
              decoration: InputDecoration(
                labelText: 'Search Items',
                hintText: "Type to filter by text",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _runFilter();
                        },
                      )
                    : null,
              ),
            ),
          ),

          // Category Filter Chips Row
          SizedBox(
            height: 50,
            child: ListView.builder(
              itemBuilder: ((context, index) {
                final category = _categories[index];
                return Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: _selectedcategory == category,
                    onSelected: (selected) {
                      setState(() {
                        _selectedcategory = category;
                        _runFilter();
                      });
                    },
                  ),
                );
              }),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 12),
              itemCount: _categories.length,
            ),
          ),
          const SizedBox(height: 8),

          // Dynamic Filtered List View
          Expanded(
            child: _filteredItems.isEmpty
                ? const Center(
                    child: Text(
                      'No matching items found.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: _filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = _filteredItems[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 4.0,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            child: Text(
                              item.id,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(
                            item.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(item.subtitle),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(item: item),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
