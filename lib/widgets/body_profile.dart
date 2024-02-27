import 'package:flutter/material.dart';
import 'package:subproj/widgets/widget_text.dart';

class BodyProfile extends StatelessWidget {
  const BodyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetText(data: 'This is Profile');
  }
}