import 'package:flutter/material.dart';

import '../../../../core/services/cache_helper.dart';

class ChangeLangWidget extends StatefulWidget {
  const ChangeLangWidget({Key? key}) : super(key: key);

  @override
  _ChangeLangWidgetState createState() => _ChangeLangWidgetState();
}

class _ChangeLangWidgetState extends State<ChangeLangWidget> {
  String selectedLanguage = 'en';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        borderRadius: BorderRadius.circular(8),
        value: selectedLanguage,
        icon: const Icon(Icons.language),
        onChanged: (String? newValue) {
          setState(() {
            selectedLanguage = newValue!;
            CacheHelper.saveData(key: "lang", value: selectedLanguage);
          });
        },
        items: const [
          DropdownMenuItem(value: "ar", child: Text("Arabic")),
          DropdownMenuItem(value: "en", child: Text("English")),
        ]);
  }
}