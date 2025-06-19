import "package:flutter/material.dart";

class CheckoutScreenPage extends StatefulWidget {
  const CheckoutScreenPage({super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreenPage> {
  String selectedService = 'Lalamove';
  final TextEditingController addressController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Summary',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            _buildOrderRow('Chicken Burger', '2 items', 12.99),
            _buildOrderRow('Fries', '1 item', 3.99),
            SizedBox(height: 20),

            Text(
              'Delivery Service',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                _buildServiceButton('Lalamove'),
                SizedBox(width: 10),
                _buildServiceButton('GrabExpress'),
              ],
            ),
            SizedBox(height: 20),

            Text(
              'Delivery Details',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            _buildInputField(addressController, 'Delivery Address'),
            SizedBox(height: 10),
            _buildInputField(contactController, 'Contact Number'),
            SizedBox(height: 20),

            Text(
              'Payment Summary',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            _buildSummaryRow('Subtotal', 16.98),
            _buildSummaryRow('Delivery Fee', 4.50),
            Divider(),
            _buildSummaryRow('Total', 21.48, isBold: true),

            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Place order logic
                },
                child: Text('Place Order'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown[100],
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderRow(String item, String quantity, double price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item, style: TextStyle(fontWeight: FontWeight.w500)),
              Text(quantity, style: TextStyle(color: Colors.grey)),
            ],
          ),
          Text('\$${price.toStringAsFixed(2)}'),
        ],
      ),
    );
  }

  Widget _buildServiceButton(String label) {
    final bool isSelected = selectedService == label;
    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          setState(() => selectedService = label);
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected ? Colors.grey[300] : Colors.transparent,
          side: BorderSide(color: Colors.grey),
        ),
        child: Text(label),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.brown[50],
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, double amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: isBold ? TextStyle(fontWeight: FontWeight.bold) : null,
          ),
          Text(
            '\$${amount.toStringAsFixed(2)}',
            style: isBold ? TextStyle(fontWeight: FontWeight.bold) : null,
          ),
        ],
      ),
    );
  }
}
