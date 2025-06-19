import "package:flutter/material.dart";

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  _PreferencesScreenState createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  String foodType = 'Selected Option';
  String distance = 'Selected Option';
  String cuisine = 'Selected Option';
  double budget = 2;

  final List<String> options = ['Selected Option', 'Option 1', 'Option 2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferences'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Food Types', style: TextStyle(fontWeight: FontWeight.bold)),
            _buildDropdown(foodType, (val) => setState(() => foodType = val)),

            SizedBox(height: 20),
            Text('Budget Range', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Select Budget'),
            Slider(
              value: budget,
              min: 1,
              max: 3,
              divisions: 2,
              activeColor: Colors.orange,
              onChanged: (value) {
                setState(() => budget = value);
              },
              label: '\$' * budget.toInt(),
            ),

            SizedBox(height: 20),
            Text(
              'Preferred Location Distance',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            _buildDropdown(distance, (val) => setState(() => distance = val)),

            SizedBox(height: 20),
            Text(
              'Specific Cuisines',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            _buildDropdown(cuisine, (val) => setState(() => cuisine = val)),

            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Save preferences logic
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text('Save Preferences'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String currentValue, ValueChanged<String> onChanged) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepPurple),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: currentValue,
        isExpanded: true,
        underline: SizedBox(),
        icon: Icon(Icons.arrow_drop_down),
        items: options.map((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        onChanged: (value) {},
      ),
    );
  }
}
