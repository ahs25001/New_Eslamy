import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  PageController pageController = PageController(
    initialPage: 0,
  );
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
}
