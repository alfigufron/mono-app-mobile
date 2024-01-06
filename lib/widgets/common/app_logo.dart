part of '../widget.dart';

class AppLogo extends StatelessWidget {
  final Color color;
  final double size;

  const AppLogo({super.key, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      "mono",
      style:
          TextStyle(fontSize: size, fontWeight: FontWeight.bold, color: color),
    );
  }
}
