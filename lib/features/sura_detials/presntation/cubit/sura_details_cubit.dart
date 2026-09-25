import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:new_islamy/core/shared_preferences/shared_preferences_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/shared_preferences/shared_keys.dart';

part 'sura_details_state.dart';

class SuraDetailsCubit extends Cubit<SuraDetailsState> {
  SuraDetailsCubit() : super(SuraDetailsInitial());
  void loadSura(int index) async {
    emit(state.copyWith(status: SuraDetailsStatus.loading));
    String suraString = await rootBundle.loadString(
      "assets/files/Suras/${index + 1}.txt",
    );
    suraString =suraString.trim();
    List<String> suraPages = suraString.split("?");
    List<List<String>> ayatOfPage = [];
    for (var page in suraPages) {
      ayatOfPage.add(page.split("\n"));
    }
    for (var page in ayatOfPage) {
      page.removeWhere((element) => element.trim().isEmpty);
    }
    for (int index = 0, pastLength = 0; index < ayatOfPage.length; index++) {
      if (index > 0) {
        pastLength += ayatOfPage[index - 1].length;
      }
      var page = ayatOfPage[index];
      for (var aya in page) {
        if (aya.trim().isNotEmpty) {
          page[page.indexOf(aya)] =
              "$aya{${(page.indexOf(aya) + pastLength) + 1}} ";
        }
      }
    }
    for (var page in ayatOfPage) {
      suraPages[ayatOfPage.indexOf(page)] = page.join();
    }
    emit(
      state.copyWith(status: SuraDetailsStatus.success, suraPages: suraPages),
    );
  }
}
