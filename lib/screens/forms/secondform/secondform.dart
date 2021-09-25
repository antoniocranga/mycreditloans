import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mycreditloans/models/user.dart';
import 'package:mycreditloans/screens/forms/secondform/photosection.dart';
import 'package:mycreditloans/widgets/customTextField.dart';
import 'package:mycreditloans/widgets/largeButton.dart';

import '../../../constants.dart';
import '../../../utils.dart';
import '../../root.dart';

class SecondForm extends StatefulWidget {
  SecondForm({Key? key}) : super(key: key);

  @override
  _SecondFormState createState() => _SecondFormState();
}

class _SecondFormState extends State<SecondForm> {
  File? imageFile;

  final TextEditingController firstNameController = new TextEditingController();
  final TextEditingController lastNameController = new TextEditingController();
  final TextEditingController jobTitleController = new TextEditingController();
  final TextEditingController paycheckController = new TextEditingController();

  bool firstNameValidator = true;
  bool lastNameValidator = true;
  bool jobTitleValidator = true;
  bool paycheckValidator = true;
  bool employedValidator = true;

  bool? employed;
  double? paycheck;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: buildCloseButton(),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          bottom: true,
          top: false,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Text("Informații personale",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w600)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Text(
                      "Completeaza sectiunea referitoare la datele personale si la situatia economica actuala.",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.grey)),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                        child: CustomTextField(
                            textInputType: TextInputType.name,
                            controller: firstNameController,
                            label: "Prenume",
                            valid: firstNameValidator)),
                    Expanded(
                      child: CustomTextField(
                        textInputType: TextInputType.name,
                        controller: lastNameController,
                        label: "Nume de familie",
                        valid: lastNameValidator,
                      ),
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Angajat?", style: labelTextStyle),
                        Row(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                    value: employed == true,
                                    onChanged: (value) {
                                      onChangedCheckbox(true);
                                    }),
                                Text("Da")
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value: employed == false,
                                    onChanged: (value) {
                                      onChangedCheckbox(false);
                                    }),
                                Text("Nu")
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            if (employedValidator == false)
                              Text("Completează câmpul",
                                  style:
                                      TextStyle(fontSize: 12, color: redColor))
                          ],
                        ),
                      ],
                    )),
                CustomTextField(
                  controller: jobTitleController,
                  label: "Job curent",
                  enabled: employed == true,
                  valid: jobTitleValidator,
                ),
                CustomTextField(
                  textInputType: TextInputType.number,
                  controller: paycheckController,
                  label: "Venit lunar",
                  valid: paycheckValidator,
                ),
                PhotoSection(
                  imageFile: (imageFileC) {
                    setState(() {
                      imageFile = imageFileC;
                    });
                  },
                ),
                LargeButton(
                  loading: loading,
                  label: "Validează",
                  callback: () {
                    validate();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                      "Verifică dacă esti eligibil pentru a lua împrumutul.",
                      style: infoTextStyle),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onChangedCheckbox(bool value) {
    setState(() {
      employed = value;
    });
  }

  void validate() async {
    setState(() {
      firstNameValidator = firstNameController.text.isNotEmpty;
      lastNameValidator = lastNameController.text.isNotEmpty;
      employedValidator = employed != null;
      jobTitleValidator = (employedValidator == true &&
              employed == true &&
              jobTitleController.text.isEmpty)
          ? false
          : true;
      paycheckValidator = paycheckController.text.isNotEmpty;

      if (imageFile == null)
        showPlatformAdaptiveDialog(
            context: context,
            title: Text("Ups.."),
            content: Text("Adaugă o poză cu ultima factură"),
            primaryAction: () {
              Navigator.pop(context);
            },
            primaryLabel: "Revino");
    });

    if (checkValidators()) {
      setState(() {
        loading = true;
      });
      await localUser.checkEligibility().then((value) {
        localUser = localUser.copyWith(
          employed: employed,
          jobTitle: jobTitleController.text,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          paycheck: double.parse(paycheckController.text),
          photo: imageFile,
        );
        setState(() {
          loading = false;
        });
        String title = value == true ? "Eligibil" : "Nu esti eligibil";
        String content = value == true
            ? "Felicitări, ești eligibil pentru a lua împrumutul."
            : "Ne pare rău, nu ești eligibil pentru a lua împrumutul.";
        showPlatformAdaptiveDialog(
                context: context,
                title: Text(title),
                content: Text(content),
                primaryAction: () {
                  platformPush(context, Root());
                },
                primaryLabel: "închide")
            .then((value) => platformPush(context, Root()));
        print(value);
      }).onError((error, stackTrace) {
        print(error);
        showPlatformAdaptiveDialog(
                context: context,
                title: Text("Ups.."),
                content: Text(
                    "Am întâmpinat o eroare, încearcă din nou mai târziu."),
                primaryAction: () {
                  Navigator.pop(context);
                },
                primaryLabel: "Revino")
            .then((value) {
          setState(() {
            loading = false;
          });
        });
      });
    }
  }

  bool checkValidators() {
    return !(firstNameValidator == false ||
        lastNameValidator == false ||
        jobTitleValidator == false ||
        paycheckValidator == false ||
        employedValidator == false ||
        imageFile == null);
  }
}
