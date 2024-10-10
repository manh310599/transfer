import 'package:flutter/material.dart';
import 'package:mb_transfer/utils/hex_color.dart';

class DashedDivider extends StatelessWidget {
  final double height;
  final double dashWidth;
  final double dashSpace;

  DashedDivider({
    this.height = 1.0,
    this.dashWidth = 10.0,
    this.dashSpace = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, height),
      painter: _DashedDividerPainter(dashWidth: dashWidth, dashSpace: dashSpace),
    );
  }
}

class _DashedDividerPainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;

  _DashedDividerPainter({required this.dashWidth, required this.dashSpace});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = HexColor.getColorFromHex('E3E3E3')
      ..strokeWidth = 1.0;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Dashed Divider Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Above the dashed line'),
          DashedDivider(height: 2.0, dashWidth: 8.0, dashSpace: 4.0),
          Text('Below the dashed line'),
        ],
      ),
    ),
  ));
}
