import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inquire/widgets/auth_buttons.dart';

class AddQuestions extends StatefulWidget {
  const AddQuestions({super.key});

  @override
  State<AddQuestions> createState() => _AddQuestionsState();
}

class _AddQuestionsState extends State<AddQuestions> {

  List<String> courses = ['Course one', 'Course two'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF1D2445),
        title: Text('Add questions', style: GoogleFonts.nunito(color: Colors.white),),
      ),

      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: Text('select course', style: GoogleFonts.nunito(),),
              trailing: DropdownButton<String>(onChanged: (value) {  }, items: courses.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: Text(courses[0]),
              ),
            ),
            Expanded(
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                  TextFormField(
                    textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF1D2445),
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Type in your question here',
                    hintStyle: TextStyle(color: Colors.black54),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),



                  ],
                ),
              ),
            ),

            ListTile(
              trailing: Checkbox(value: false, onChanged: (value){}),
              title: TextFormField(
                style: const TextStyle(
                  color: Color(0xFF1D2445),
                ),
                decoration: const InputDecoration(
                  hintText: 'type in your first answer',
                  hintStyle: TextStyle(color: Colors.black54),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1D2445)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1D2445)),
                  ),
                ),
              ),
            ),

            ListTile(
              trailing: Checkbox(value: false, onChanged: (value){}),
              title: TextFormField(
                style: const TextStyle(
                  color: Color(0xFF1D2445),
                ),
                decoration: const InputDecoration(
                  hintText: 'type in your first answer',
                  hintStyle: TextStyle(color: Colors.black54),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1D2445)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1D2445)),
                  ),
                ),
              ),
            ),

            ListTile(
              trailing: Checkbox(value: false, onChanged: (value){}),
              title: TextFormField(
                style: const TextStyle(
                  color: Color(0xFF1D2445),
                ),
                decoration: const InputDecoration(
                  hintText: 'type in your first answer',
                  hintStyle: TextStyle(color: Colors.black54),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1D2445)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1D2445)),
                  ),
                ),
              ),
            ),

            ListTile(
              trailing: Checkbox(value: false, onChanged: (value){}),
              title: TextFormField(
                style: const TextStyle(
                  color: Color(0xFF1D2445),
                ),
                decoration: const InputDecoration(
                  hintText: 'type in your first answer',
                  hintStyle: TextStyle(color: Colors.black54),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1D2445)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1D2445)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,), 
            AuthButtons(buttonText: 'Save')
          ],
        ),
      ),
    );
  }
}
