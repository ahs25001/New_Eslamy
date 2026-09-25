import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:new_islamy/features/home/presntation/data/models/sura_model.dart';

import '../../../../core/shared_preferences/shared_keys.dart';
import '../../../../core/shared_preferences/shared_preferences_services.dart';
import '../../../../core/utils/app_constants.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  PageController pageController = PageController(initialPage: 0);
  HomeCubit() : super(HomeInitial()) {
    loadHadeths();
  }
  void changeCurrentTab(int currentTab) {
    pageController.animateToPage(
      currentTab,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    emit(state.copyWith(currentTab: currentTab));
  }

  void loadHadeths() async {
    emit(state.copyWith(homeStatus: HomeStatus.loading));
    List<String> hadeths = [];
    for (int i = 1; i <= 50; i++) {
      String hadeth = await rootBundle.loadString(
        "assets/files/hadeth/h$i.txt",
      );
      hadeths.add(hadeth);
    }
    emit(state.copyWith(homeStatus: HomeStatus.success, hadeths: hadeths));
  }

  void onSebhaTap() {
    int sebhaCount = state.sebhaCount ?? 0;
    if (sebhaCount < 33) {
      emit(
        state.copyWith(
          homeStatus: HomeStatus.sebhaChanged,
          sebhaCount: ++sebhaCount,
        ),
      );
    } else {
      emit(
        state.copyWith(
          homeStatus: HomeStatus.sebhaChanged,
          sebhaCount: 0,
          tasbehIndex: (state.tasbehIndex ?? 0) + 1,
        ),
      );
    }
  }

  void addSuraToMostRecently(int index) {
    List<int> mostRecentlyIndexes = state.mostRecently!
        .map((e) => e.index)
        .toList();
    mostRecentlyIndexes.removeWhere((element) => element == index);
    mostRecentlyIndexes.insert(0, index);
    if (mostRecentlyIndexes.length > 20) {
      mostRecentlyIndexes.removeAt(mostRecentlyIndexes.length - 1);
    }
    SharedPreferencesServices.addListOfStrings(
      SharedKeys.mostRecently.value,
      mostRecentlyIndexes.map((e) => e.toString()).toList(),
    );
    getMostRecently();
  }

  void getMostRecently() {
    List<String> mostRecentlyIndexes =
        SharedPreferencesServices.getLisOfStrings(
          SharedKeys.mostRecently.value,
        );
    emit(
      state.copyWith(
        mostRecently: mostRecentlyIndexes
            .map(
              (e) => SuraModel(
                index: int.parse(e),
                suraAyatNumber: ayaNumberList[int.parse(e)],
                suraName: arabicQuranSuras[int.parse(e)],
                suraNameEnglish: englishQuranSurahs[int.parse(e)],
              ),
            )
            .toList(),
      ),
    );
  }
}
