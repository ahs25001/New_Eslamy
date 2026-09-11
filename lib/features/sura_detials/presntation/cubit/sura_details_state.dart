part of 'sura_details_cubit.dart';
enum SuraDetailsStatus { loading, success, failure,initial }
 class SuraDetailsState {
  SuraDetailsStatus ?status;
  List<String> ?suraPages;
  SuraDetailsState({ this.status,  this.suraPages});
  SuraDetailsState copyWith ({SuraDetailsStatus? status, List<String>? suraPages}){
    return SuraDetailsState(
      status: status ?? this.status,
      suraPages: suraPages ?? this.suraPages,
    );
  }
}

final class SuraDetailsInitial extends SuraDetailsState {
   SuraDetailsInitial() : super(status: SuraDetailsStatus.initial);
}
