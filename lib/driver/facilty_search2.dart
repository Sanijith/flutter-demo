import 'package:fleetride/driver/driver_home.dart';
import 'package:flutter/material.dart';

class IconButtonTextField extends StatefulWidget {
  final IconData icon;
  final String initialText;
  final Function(String) onSubmit;

  const IconButtonTextField({
    Key? key,
    required this.icon,
    this.initialText = '',
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<IconButtonTextField> createState() => _IconButtonTextFieldState();
}

class _IconButtonTextFieldState extends State<IconButtonTextField> {
  bool _showTextField = false;
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController.text = widget.initialText;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: _showTextField ? 200.0 : 40.0,
      child: Row(
        children: [
          IconButton(
            icon: Icon(widget.icon),
            onPressed: () => setState(() => _showTextField = !_showTextField),
          ),
          if (_showTextField)
            Expanded(
              child: TextFormField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Search Facilities...',
                ),
                onFieldSubmitted: (text) {
                  widget.onSubmit(text);
                  setState(() => _showTextField = false);
                  _textController.clear();
                },
              ),
            ),
        ],
      ),
    );
  }
}

class FacilitySearch2 extends StatefulWidget {
  const FacilitySearch2({super.key});

  @override
  State<FacilitySearch2> createState() => _FacilitySearch2State();
}

class _FacilitySearch2State extends State<FacilitySearch2> {
  void handleSearch(String text) {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('FLEETRIDE'),
        actions: [
          IconButtonTextField(
            icon: Icons.search,
            onSubmit: handleSearch,
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DriverHome()));
              },
              icon: const Icon(Icons.home)),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Card(
                color: Colors.red.shade50,
                child: ListTile(
                  title: Text('Facility $index'),
                  subtitle:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(' Location:'),
                      SizedBox(width: MediaQuery.of(context).size.width*.030),
                      Text('Reg Fee:'),
                      SizedBox(width: MediaQuery.of(context).size.width*.030),
                      Text('Phone Number:')
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: 5),
      ),
    );
  }
}