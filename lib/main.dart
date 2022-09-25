import 'dart:convert';
import 'dart:io';

import 'package:crowdinHelper/api/api_service.dart';
import 'package:crowdinHelper/models/crowdin_string.dart';
import 'package:crowdinHelper/models/project.dart';

Future<void> main() async {
  final lsProjects = await MainController().getListProject();
  final lsCrowdinStrings = await MainController().getListStrings();

  await MainController().addStringsToProjects(lsProjects, lsCrowdinStrings);
}

class MainController {
  Future<void> addStringsToProjects(
      List<Project> lsProjects, List<CrowdinString> lsCrowdinStrings) async {
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

  Future<List<Project>> getListProject() async {
    try {
      //Locate listProjects.json file in your local machine
      final jsonString = await File("listProjects.json").readAsString();

      final list = JsonDecoder().convert(jsonString) as List<dynamic>;
      return list
          .map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<CrowdinString>> getListStrings() async {
    try {
      //Locate listStrings.json file in your local machine
      final jsonString = await File("listStrings.json").readAsString();
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
