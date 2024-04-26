import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:techub/db/insertion.dart';

class UniversityForm extends StatefulWidget {
  @override
  _UniversityFormState createState() => _UniversityFormState();
}

class _UniversityFormState extends State<UniversityForm> {
  final _formKey = GlobalKey<FormState>();
  String universityName = '';
  String naacCredits = '';
  String numberOfStudents = '';
  String affiliation = '';
  String tpoName = '';
  String tpoPhoneNumber = '';
  String uid = '';
  String mous = '';
  String pgt = '';
  String pbt = '';
  String plt = '';

  //List<String> projectAchievementDomains = [];
  List<Map<String, String>> projects = [];
  List<Map<String, String>> achievements = [];
  List<Map<String, String>> companies = [];
  List<Map<String, dynamic>> domains = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 208, 0),
        title: Text('University Details Form'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                  labelText: 'University Id',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter university id';
                }
                return null;
              },
              onSaved: (value) {
                print(uid);
                uid = value!;
              },
              onChanged: (value) {
                print(uid);
                uid = value!;
              },
            ),
            SizedBox(height: 7),
            TextFormField(
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                  labelText: 'University Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter university name';
                }
                return null;
              },
              onSaved: (value) {
                universityName = value!;
              },
              onChanged: (value) {
                print(value);
                universityName = value!;
              },
            ),
            SizedBox(height: 7),
            TextFormField(
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                  labelText: 'NAAC Credits',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter NAAC credits';
                }
                return null;
              },
              onSaved: (value) {
                naacCredits = value!;
              },
              onChanged: (value) {
                print(value);
                naacCredits = value!;
              },
            ),
            SizedBox(height: 7),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Number of Students',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter number of students';
                }
                return null;
              },
              onSaved: (value) {
                numberOfStudents = value!;
              },
              onChanged: (value) {
                print(value);
                numberOfStudents = value!;
              },
            ),
            SizedBox(height: 7),
            TextFormField(
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                  labelText: 'Affiliation',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter affiliation';
                }
                return null;
              },
              onSaved: (value) {
                affiliation = value!;
              },
              onChanged: (value) {
                print(value);
                affiliation = value!;
              },
            ),
            SizedBox(height: 7),
            TextFormField(
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                  labelText: 'TPO Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter TPO name';
                }
                return null;
              },
              onSaved: (value) {
                tpoName = value!;
              },
              onChanged: (value) {
                print(value);
                tpoName = value!;
              },
            ),
            SizedBox(height: 7),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'TPO Phone Number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter TPO phone number';
                }
                return null;
              },
              onSaved: (value) {
                tpoPhoneNumber = value!;
              },
              onChanged: (value) {
                print(value);
                tpoPhoneNumber = value!;
              },
            ),
            SizedBox(height: 7),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "MOU'S Signed",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter MOUs Signedr';
                }
                return null;
              },
              onSaved: (value) {
                mous = value!;
              },
              onChanged: (value) {
                print(value);
                mous = value!;
              },
            ),
            SizedBox(height: 7),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Packages GreaterThan 15',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Packages>15';
                }
                return null;
              },
              onSaved: (value) {
                pgt = value!;
              },
              onChanged: (value) {
                print(value);
                pgt = value!;
              },
            ),
            SizedBox(height: 7),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Packages between 5 and 15',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter pacages<15';
                }
                return null;
              },
              onSaved: (value) {
                pbt = value!;
              },
              onChanged: (value) {
                print(value);
                pbt = value!;
              },
            ),
            SizedBox(height: 7),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Package lessThan 5',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Packages < 5';
                }
                return null;
              },
              onSaved: (value) {
                plt = value!;
              },
              onChanged: (value) {
                print(value);
                plt = value!;
              },
            ),
            SizedBox(height: 20),
            // Text(
            //   'Projects',
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // ),
            // SizedBox(height: 10),
            // Column(
            //   children: List.generate(projects.length, (index) {
            //     return Column(
            //       children: [
            //         TextFormField(
            //           textCapitalization: TextCapitalization.words,
            //           decoration: InputDecoration(
            //               labelText: 'Project Name',
            //               border: OutlineInputBorder(
            //                   borderRadius: BorderRadius.circular(16))),
            //           validator: (value) {
            //             if (value!.isEmpty) {
            //               return 'Please enter project name';
            //             }
            //             return null;
            //           },
            //           onSaved: (value) {
            //             projects[index]['Name'] = value!;
            //           },
            //         ),
            //         SizedBox(height: 7),
            //         TextFormField(
            //           textCapitalization: TextCapitalization.words,
            //           decoration: InputDecoration(
            //               labelText: 'Team Name',
            //               border: OutlineInputBorder(
            //                   borderRadius: BorderRadius.circular(16))),
            //           validator: (value) {
            //             if (value!.isEmpty) {
            //               return 'Please enter team name';
            //             }
            //             return null;
            //           },
            //           onSaved: (value) {
            //             projects[index]['Team_Name'] = value!;
            //           },
            //         ),
            //         SizedBox(height: 10),
            //         ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //             primary: Color.fromARGB(255, 255, 244, 195),
            //             onPrimary: Colors.black,
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(16),
            //             ),
            //           ),
            //           onPressed: () {
            //             setState(() {
            //               projects.removeAt(index);
            //             });
            //           },
            //           child: Text('Remove'),
            //         ),
            //       ],
            //     );
            //   }),
            // ),
            // SizedBox(height: 10),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     primary: Color.fromARGB(255, 255, 244, 195),
            //     onPrimary: Colors.black,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(16),
            //     ),
            //   ),
            //   onPressed: () {
            //     setState(() {
            //       projects.add({'Name': '', 'Team_Name': ''});
            //     });
            //   },
            //   child: Text('Add Project'),
            // ),
            // SizedBox(height: 20),
            Text(
              'Achievements',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              children: List.generate(achievements.length, (index) {
                return Column(
                  children: [
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                          labelText: 'Achievement Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter achievement name';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        achievements[index]['Event_name'] = value!;
                      },
                    ),
                    SizedBox(height: 7),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                          labelText: 'Team Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter team name';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        achievements[index]['Team_Name'] = value!;
                      },
                    ),
                    SizedBox(height: 7),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                          labelText: 'Year',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter year';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        achievements[index]['Year'] = value;
                      },
                    ),
                    SizedBox(height: 7),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                          labelText: 'Status',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter status';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        achievements[index]['Status'] = value!;
                      },
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 255, 244, 195),
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          achievements.removeAt(index);
                        });
                      },
                      child: Text('Remove'),
                    ),
                  ],
                );
              }),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 255, 244, 195),
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                setState(() {
                  achievements.add({
                    'Event_name': '',
                    'Team_Name': '',
                    'Status': '',
                    'Year': ''
                  });
                });
              },
              child: Text('Add Achievement'),
            ),
            SizedBox(height: 20),
            Text(
              'Domains',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              children: List.generate(domains.length, (index) {
                return Column(
                  children: [
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                          labelText: 'Domain Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter domain name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        domains[index]['Name'] = value;
                      },
                    ),
                    SizedBox(height: 7),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Number of Students',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter number of students';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        domains[index]['No_of_Students'] = value;
                      },
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 255, 244, 195),
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          domains.removeAt(index);
                        });
                      },
                      child: Text('Remove'),
                    ),
                  ],
                );
              }),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 255, 244, 195),
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                setState(() {
                  domains.add({
                    'Name': '',
                    'No_of_Students': '',
                  });
                });
              },
              child: Text('Add Domain'),
            ),
            SizedBox(height: 20),
            Text(
              'Companies',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              children: List.generate(companies.length, (index) {
                return Column(
                  children: [
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                          labelText: 'Company Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter company name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        companies[index]['Name'] = value!;
                      },
                    ),
                    SizedBox(height: 7),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Number of Students',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter number of students';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        companies[index]['No_of_recruit'] = value!;
                      },
                    ),
                    SizedBox(height: 7),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Year',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter year';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        companies[index]['Year'] = value!;
                      },
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 255, 244, 195),
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          companies.removeAt(index);
                        });
                      },
                      child: Text('Remove'),
                    ),
                  ],
                );
              }),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 255, 244, 195),
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                setState(() {
                  companies.add({'Name': '', 'No_of_recruit': '', 'Year': ''});
                });
              },
              child: Text('Add Company'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  print(uid);
                  adduni(universityName, naacCredits, numberOfStudents,
                      affiliation, tpoName, tpoPhoneNumber, uid);
                  //addproject(jsonEncode(projects), uid);
                  addach(jsonEncode(achievements), uid);
                  print("hi" + jsonEncode(achievements));
                  addcomp(jsonEncode(companies), uid);
                  adddom(jsonEncode(domains), uid);
                  addmou(mous, pgt, pbt, plt, uid);
                  adduni(universityName, naacCredits, numberOfStudents,
                      affiliation, tpoName, tpoPhoneNumber, uid);
                  //addproject(jsonEncode(projects), uid);
                  addach(jsonEncode(achievements), uid);
                  print("hi" + jsonEncode(achievements));
                  addcomp(jsonEncode(companies), uid);
                  adddom(jsonEncode(domains), uid);
                  addmou(mous, pgt, pbt, plt, uid);
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
