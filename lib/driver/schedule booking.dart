import 'package:fleetride/driver/repairs_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ScheduleBook extends StatefulWidget {
  const ScheduleBook({Key? key}) : super(key: key);

  @override
  _ScheduleBookState createState() => _ScheduleBookState();
}

class _ScheduleBookState extends State<ScheduleBook> {
  List<bool> _isSelected = List.generate(8, (index) => false);
  List<String> _selectedLabels = [];

  void _toggleSelection(int index) {
    setState(() {
      _isSelected[index] = !_isSelected[index];
      if (_isSelected[index]) {
        _selectedLabels.add(_getLabel(index));
      } else {
        _selectedLabels.remove(_getLabel(index));
      }
    });
  }

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return 'Set/Create Trip';
      case 1:
        return 'My Trips';
      case 2:
        return 'Trip Request';
      case 3:
        return 'Delivery Request';
      case 4:
        return 'Facility Search';
      case 5:
        return 'Search Events';
      case 6:
        return 'HelpLine';
      case 7:
        return 'Report Issue';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('FleetRide'),
          actions: [
            IconButton(
              onPressed: () {
                // Navigate to DriverProfile screen
              },
              icon: const Icon(Icons.person),
            ),
          ],
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/background.jpeg'),
                    fit: BoxFit.fill,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 40,
                  crossAxisSpacing: 40,
                  children: [
                    _buildGridItem(Icons.directions_car, Colors.blue, 0),
                    _buildGridItem(Icons.directions_car, Color.fromRGBO(84, 194, 194, 100), 1),
                    _buildGridItem(Icons.directions, Colors.green, 2),
                    _buildGridItem(Icons.delivery_dining, Colors.orange, 3),
                    _buildGridItem(Icons.search, Colors.red, 4),
                    _buildGridItem(Icons.search, Colors.blueGrey, 5),
                    _buildGridItem(Icons.help_outline, Colors.purple, 6),
                    _buildGridItem(Icons.report_outlined, Colors.pink, 7),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print('Selected items: ${_selectedLabels.join(', ')}');
                Navigator.push(context, MaterialPageRoute(builder: (context) => RepairNamesList(),));
                // Navigate or perform other actions based on selected items
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(IconData icon, Color color, int index) {
    return GestureDetector(
      onTap: () => _toggleSelection(index),
      child: Container(
        decoration: BoxDecoration(
          color: _isSelected[index] ? color.withOpacity(0.5) : color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: _isSelected[index] ? Colors.white : null,
                  child: Icon(icon, size: 40, color: _isSelected[index] ? color : Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  _getLabel(index),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            if (_isSelected[index])
              Icon(Icons.check_circle, color: Colors.black, size: 40),
          ],
        ),
      ),
    );
  }
}
