import 'dart:convert';
import 'dart:io';

import 'package:crowdinHelper/api/api_service.dart';
import 'package:crowdinHelper/models/client.dart';
import 'package:crowdinHelper/models/crowdin_string.dart';

Future<void> main() async {
  final lsProjects = await MainController().getListProject();
  final lsCrowdinStrings = await MainController().getListStrings();

  await MainController().addStringsToProjects(lsProjects, lsCrowdinStrings);
}

class MainController {
  Future<void> addStringsToProjects(
      List<Client> lsProjects, List<CrowdinString> lsCrowdinStrings) async {
    Map<int, List<CrowdinString>> map = {};

    lsProjects.forEach((project) {
      final listStringsWithFileId = lsCrowdinStrings
          .map((e) => CrowdinString(e.text, e.identifier, project.fileId,
              e.context, e.isHidden, e.maxLength))
          .toList();
      map.addAll({
        project.projectId: listStringsWithFileId,
      });
    });

    for (var entry in map.entries) {
      await MainController().postListCrowdinStrings(entry.key, entry.value);
    }
  }

  Future<void> postListCrowdinStrings(
      int projectId, List<CrowdinString> list) async {
    for (CrowdinString crowdinString in list) {
      await ApiService().postSingleCrowdinString(
        projectId: projectId,
        crowdinString: crowdinString,
      );
    }
  }

  Future<List<Client>> getListProject() async {
    try {
      final jsonString = await File(
              "/Users/nhg/Desktop/NHGDATA/Projects/flutter_projects/crowdinScript/assets/listProjects.json")
          .readAsString();
      final list = JsonDecoder().convert(jsonString) as List<dynamic>;
      return list
          .map((e) => Client.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<CrowdinString>> getListStrings() async {
    try {
      final jsonString = await File(
              "/Users/nhg/Desktop/NHGDATA/Projects/flutter_projects/crowdinScript/assets/listStrings.json")
          .readAsString();
      final list = JsonDecoder().convert(jsonString) as List<dynamic>;
      return list
          .map((e) => CrowdinString.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
