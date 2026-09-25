part of 'home_cubit.dart';

enum HomeStatus { initial, loading, success, error, sebhaChanged }

class HomeState {
  HomeStatus? homeStatus;
  int? currentTab;
  List<String>? hadeths;
  int? sebhaCount;
  int? tasbehIndex ;
  List<String>? suraPages;
  List<SuraModel>?mostRecently;
  HomeState({
    this.homeStatus,
    this.currentTab,
    this.mostRecently,
    this.suraPages,
    this.hadeths,
    this.sebhaCount,
    this.tasbehIndex,
  });
  HomeState copyWith({
    HomeStatus? homeStatus,
    List<SuraModel>? mostRecently,
    List<String>? hadeths,
    int? sebhaCount,
    int? tasbehIndex,
    int? currentTab,
    List<String>? suraPages,
  }) => HomeState(
    currentTab: currentTab ?? this.currentTab,
    suraPages: suraPages ?? this.suraPages,
    sebhaCount: sebhaCount ?? this.sebhaCount,
    mostRecently: mostRecently ?? this.mostRecently,
    tasbehIndex: tasbehIndex ?? this.tasbehIndex,
    hadeths: hadeths ?? this.hadeths,
    homeStatus: homeStatus ?? this.homeStatus,
  );
}

final class HomeInitial extends HomeState {
  HomeInitial() : super(homeStatus: HomeStatus.initial, mostRecently: [],currentTab: 0,sebhaCount: 0,hadeths: [],tasbehIndex: 0);
}
