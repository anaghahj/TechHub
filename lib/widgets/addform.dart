// import 'package:flutter/material.dart';
// import 'package:techub/db/insertion.dart';

// class UniversityFormW extends StatefulWidget {
//   @override
//   _UniversityFormWState createState() => _UniversityFormWState();
// }

// class _UniversityFormWState extends State<UniversityFormW> {
//   final _formKey = GlobalKey<FormState>();
//   String universityName = '';
//   String naacCredits = '';
//   String numberOfStudents = '';
//   String affiliation = '';
//   String tpoName = '';
//   String mous = '';
//   String pgt = '';
//   String pbt = '';
//   String plt = '';
//   String tpoPhoneNumber = '';
//   List<String> projectAchievementDomains = [];
//   List<Map<String, String>> projects = [];
//   List<Map<String, String>> achievements = [];
//   List<Map<String, dynamic>> domains = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('University Details Form'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: ListView(
//           padding: EdgeInsets.all(16.0),
//           children: <Widget>[
//             TextFormField(
//               decoration: InputDecoration(labelText: 'University Id'),
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Please enter university Id';
//                 }
//                 return null;
//               },
//               onSaved: (value) {
//                 universityName = value!;
//               },
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'University Name'),
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Please enter university name';
//                 }
//                 return null;
//               },
//               onSaved: (value) {
//                 universityName = value!;
//               },
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'NAAC Credits'),
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Please enter NAAC credits';
//                 }
//                 return null;
//               },
//               onSaved: (value) {
//                 naacCredits = value!;
//               },
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Number of Students'),
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Please enter number of students';
//                 }
//                 return null;
//               },
//               onSaved: (value) {
//                 numberOfStudents = value!;
//               },
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Affiliation'),
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Please enter affiliation';
//                 }
//                 return null;
//               },
//               onSaved: (value) {
//                 affiliation = value!;
//               },
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'TPO Name'),
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Please enter TPO name';
//                 }
//                 return null;
//               },
//               onSaved: (value) {
//                 tpoName = value!;
//               },
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'TPO Phone Number'),
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Please enter TPO phone number';
//                 }
//                 return null;
//               },
//               onSaved: (value) {
//                 tpoPhoneNumber = value!;
//               },
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: "MOU'S Signed"),
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Please enter MOUs Signedr';
//                 }
//                 return null;
//               },
//               onSaved: (value) {
//                 mous = value!;
//               },
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Packages GreaterThan 15'),
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Please enter Packages>15';
//                 }
//                 return null;
//               },
//               onSaved: (value) {
//                 pgt = value!;
//               },
//             ),
//             TextFormField(
//               decoration:
//                   InputDecoration(labelText: 'packages between 5 and 15'),
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Please enter pacages<15';
//                 }
//                 return null;
//               },
//               onSaved: (value) {
//                 pbt = value!;
//               },
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Package lessThan 5'),
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Please enter Packages < 5';
//                 }
//                 return null;
//               },
//               onSaved: (value) {
//                 plt = value!;
//               },
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Projects',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Column(
//               children: List.generate(projects.length, (index) {
//                 return Column(
//                   children: [
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'Project Name'),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please enter project name';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         projects[index]['name'] = value!;
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'Team Name'),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please enter team name';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         projects[index]['team'] = value!;
//                       },
//                     ),
//                     SizedBox(height: 10),
//                   ],
//                 );
//               }),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   projects.add({'name': '', 'team': ''});
//                 });
//               },
//               child: Text('Add Project'),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Achievements',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Column(
//               children: List.generate(achievements.length, (index) {
//                 return Column(
//                   children: [
//                     TextFormField(
//                       decoration:
//                           InputDecoration(labelText: 'Achievement Name'),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please enter achievement name';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         achievements[index]['name'] = value!;
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'Team Name'),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please enter team name';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         achievements[index]['team'] = value!;
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'Status'),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please enter status';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         achievements[index]['status'] = value!;
//                       },
//                     ),
//                     SizedBox(height: 10),
//                   ],
//                 );
//               }),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   achievements.add({'name': '', 'team': '', 'status': ''});
//                 });
//               },
//               child: Text('Add Achievement'),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Domains',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Column(
//               children: List.generate(domains.length, (index) {
//                 return Column(
//                   children: [
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'Domain Name'),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please enter domain name';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         domains[index]['name'] = value;
//                       },
//                     ),
//                     TextFormField(
//                       decoration:
//                           InputDecoration(labelText: 'Number of Students'),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please enter number of students';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         domains[index]['numberOfStudents'] = value;
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'Company Name'),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please enter company name';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         domains[index]['companyName'] = value;
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'Year'),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please enter year';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         domains[index]['year'] = value;
//                       },
//                     ),
//                     SizedBox(height: 10),
//                   ],
//                 );
//               }),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   domains.add({
//                     'name': '',
//                     'numberOfStudents': '',
//                     'companyName': '',
//                     'year': ''
//                   });
//                 });
//               },
//               child: Text('Add Domain'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   _formKey.currentState!.save();
//                   // Send form data to backend or process it accordingly
//                   // Here you can print or process the captured data
//                   adduni(universityName, naacCredits, numberOfStudents, affiliation, tpoName, tpoPhoneNumber, uid)
//                   print('University Name: $universityName');
//                   print('NAAC Credits: $naacCredits');
//                   print('Number of Students: $numberOfStudents');
//                   print('Affiliation: $affiliation');
//                   print('TPO Name: $tpoName');
//                   print('TPO Phone Number: $tpoPhoneNumber');
//                   print(
//                       'Project Achievement Domains: $projectAchievementDomains');
//                   print('Projects:');
//                   for (var project in projects) {
//                     print(
//                         'Project Name: ${project['name']}, Team Name: ${project['team']}');
//                   }
//                   print('Achievements:');
//                   for (var achievement in achievements) {
//                     print(
//                         'Achievement Name: ${achievement['name']}, Team Name: ${achievement['team']}, Status: ${achievement['status']}');
//                   }
//                   print('Domains:');
//                   for (var domain in domains) {
//                     print(
//                         'Domain Name: ${domain['name']}, Number of Students: ${domain['numberOfStudents']}, Company Name: ${domain['companyName']}, Year: ${domain['year']}');
//                   }
//                 }
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
