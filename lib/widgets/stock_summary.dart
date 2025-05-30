import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StockSummary extends StatelessWidget {
  final int totalProductos;
  final double valorTotalStock;

  const StockSummary({
    super.key,
    required this.totalProductos,
    required this.valorTotalStock,
  });

  @override
  Widget build(BuildContext context) {
    final formatoMoneda = NumberFormat.currency(
      locale: 'es_CO',
      symbol: '\$',
      decimalDigits: 2,
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildSummaryCard(
            title: 'Total Productos',
            value: totalProductos.toString(),
            color: Colors.blue,
          ),
          _buildSummaryCard(
            title: 'Valor Total',
            value: formatoMoneda.format(valorTotalStock),
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard({
    required String title,
    required String value,
    required Color color,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 150,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: color,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                color: color,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
