import 'dart:convert';

import 'package:http/http.dart' as http;

String ip = "10.10.0.10";

void adduni(String universityName, String naacCredits, String numberOfStudents,
    String affiliation, String tpoName, String tpoPhoneNumber, String uid) {
  print(
      "hello $uid $universityName $affiliation $tpoName $naacCredits $numberOfStudents $tpoPhoneNumber");
  var url = Uri.parse("https://$ip/dbms_company/university_insert.php");

  http.post(url, body: {
    "Uid": uid,
    "Name": universityName,
    "NAAC_Credits": naacCredits,
    "No_of_Students": numberOfStudents,
    "Affiliation": affiliation,
    "TPO": tpoName,
    "TPO_Phone": tpoPhoneNumber
  });
}

// addproject(Projects, uid) {
//   print(Projects + uid);
//   var url = Uri.parse("https://$ip/dbms_company/projects_insert.php");
//   http.post(url, body: {"projects": Projects, "Uid": uid});
// }

addach(achs, uid) {
  print(achs + uid);
  var url = Uri.parse("https://$ip/dbms_company/achievements_insert.php");
  http.post(url, body: {"achievements": achs, "Uid": uid});
}

addcomp(comp, uid) {
  print("hello");
  print(comp + uid);
  var url = Uri.parse("https://$ip/dbms_company/companies_insert.php");
  http.post(url, body: {"companies": comp, "Uid": uid});
}

adddom(dom, uid) {
  print(dom + uid);
  var url = Uri.parse("https://$ip/dbms_company/domains_insert.php");
  http.post(url, body: {"domains": dom, "Uid": uid});
}

addmou(mous, pgt, pbt, plt, uid) {
  print(mous + pgt + pbt + plt + uid);
  var url = Uri.parse("https://$ip/dbms_company/placement_record_insert.php");
  http.post(url, body: {
    "Uid": uid,
    'Package_gt_15': pgt,
    'Package_bw_5_15': pbt,
    'Package_lt_5': plt,
    'MOU_Signed': mous
  });
}

Future<List<dynamic>> fetchDatauni(String uid) async {
  var url = Uri.parse("https://$ip/dbms_company/university.php");
  var response = await http.post(url, body: {'Uid': uid});
  var data = jsonDecode(response.body);
  print("Data: $data");
  return data;
}

Future<List<dynamic>> fetchDatabar(String uid) async {
  var url = Uri.parse("https://$ip/dbms_company/placement_record.php");
  var response = await http.post(url, body: {'Uid': uid});
  var data = jsonDecode(response.body);
  print("Data: $data");
  return data;
}

Future<List<dynamic>> fetchDataac(String uid) async {
  var url = Uri.parse("https://$ip/dbms_company/achievements.php");
  var response = await http.post(url, body: {'Uid': uid});
  var data = jsonDecode(response.body);
  print("Data: $data");
  return data;
}

Future<List<dynamic>> fetchDatado(String uid) async {
  var url = Uri.parse("https://$ip/dbms_company/companies.php");
  var response = await http.post(url, body: {'Uid': uid});
  var data = jsonDecode(response.body);
  print("Data: $data");
  return data;
}

Future<List<dynamic>> fetchDatapie(String usn) async {
  var url = Uri.parse("https://$ip/dbms_company/domain.php");
  var response = await http.post(url, body: {'Uid': usn});
  var data = jsonDecode(response.body);
  print("Data: $data");
  return data;
}

Future<List> getData() async {
  final response =
      await http.get(Uri.parse("https://$ip/dbms_company/getdata.php"));
  print(response.body);
  return jsonDecode(response.body);
}
