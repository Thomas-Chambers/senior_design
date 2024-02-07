import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_design/view_models/auth_view_model.dart';
import 'package:senior_design/views/widgets/backgrounds/background.dart';
import 'package:senior_design/views/widgets/backgrounds/background_name.dart';


class PatientAccountView extends StatefulWidget {
  const PatientAccountView({Key? key}) : super(key: key);

  @override
  State<PatientAccountView> createState() => _PatientAccountViewState();
}

class _PatientAccountViewState extends State<PatientAccountView> {
  late TextEditingController _dateOfBirthController;
  late TextEditingController _genderController;
  late TextEditingController _weightController;
  late TextEditingController _heightController;
  late TextEditingController _injuryTypeController;
  late TextEditingController _dateOfInjuryController;
  late TextEditingController _pastInjuriesController;

  @override
  void initState() {
    super.initState();
    _dateOfBirthController = TextEditingController();
    _genderController = TextEditingController();
    _weightController = TextEditingController();
    _heightController = TextEditingController();
    _injuryTypeController = TextEditingController();
    _dateOfInjuryController = TextEditingController();
    _pastInjuriesController = TextEditingController();
  }

  @override
  void dispose() {
    _dateOfBirthController.dispose();
    _genderController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    _injuryTypeController.dispose();
    _dateOfInjuryController.dispose();
    _pastInjuriesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      extendBodyBehindAppBar: true, // Make body extend behind AppBar
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Back'), // Optionally, you can also add a title here
        // align the title to the right of the icon
        centerTitle: false,
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: Colors.transparent, // Ensure AppBar is transparent
        foregroundColor: Colors.black, // Set icon color
      ),
      body: BackgroundImage(
        imagePath: BackgroundName.loginBackground,
        child: Padding(
          padding: const EdgeInsets.only(
              top: kToolbarHeight + 20.0,
              left: 20.0,
              right: 20.0,
              bottom: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 100.0), // Space at the top
                const Text(
                  'Enter Patient Information',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40.0),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: buildTextField(_dateOfBirthController,
                          'Date of Birth', TextInputType.datetime),
                    ),
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: buildTextField(
                          _genderController, 'Gender', TextInputType.text),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: buildTextField(
                          _weightController, 'Weight', TextInputType.number),
                    ),
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: buildTextField(
                          _heightController, 'Height', TextInputType.number),
                    ),
                  ],
                ),
                // Continue with the rest of your fields
                buildTextField(
                    _injuryTypeController, 'Injury Type', TextInputType.text),
                buildTextField(_dateOfInjuryController, 'Date of Injury',
                    TextInputType.datetime),
                buildTextField(
                  _pastInjuriesController,
                  'Past Injuries',
                  TextInputType.multiline,
                  maxLines: null,
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    // Logic to handle patient information submission
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child:
                        Text('Create Account', style: TextStyle(fontSize: 18)),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15), // Rounded corners
                    ),
                  ),
                ),
                const SizedBox(height: 24.0), // Space at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
    TextEditingController controller,
    String labelText,
    TextInputType keyboardType, {
    int? maxLines = 1,
  }) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            border: const OutlineInputBorder(),
          ),
          keyboardType: keyboardType,
          maxLines: maxLines,
        ),
        const SizedBox(height: 12.0),
      ],
    );
  }
}
