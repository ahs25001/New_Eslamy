part of 'on_boarding_cubit.dart';
enum OnBoardingStatus {
  initial,
  loading,
  success,
  error
}
 class OnBoardingState {
  OnBoardingStatus ? onBoardingStatus;
  int ? currentPage;
  String ? errorMessage;
  OnBoardingState({
    this.onBoardingStatus,
    this.currentPage,
    this.errorMessage,
  });
  OnBoardingState copyWith({OnBoardingStatus ? onBoardingStatus,
  int ? currentPage,
  String ? errorMessage})=> OnBoardingState(
    onBoardingStatus: onBoardingStatus ?? this.onBoardingStatus,
    currentPage: currentPage ?? this.currentPage,
    errorMessage: errorMessage ?? this.errorMessage,
  );
}

final class OnBoardingInitial extends OnBoardingState {
  OnBoardingInitial(): super(onBoardingStatus: OnBoardingStatus.initial,currentPage: 0);
}
