// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dashboard_cubit.dart';

enum HomeMenu { home, transaction, wallet, profile }

class DashboardState extends Equatable {
  final HomeMenu menu;

  const DashboardState({
    this.menu = HomeMenu.home,
  });

  @override
  List<Object?> get props => [menu];

  DashboardState copyWith({
    HomeMenu? menu,
  }) {
    return DashboardState(
      menu: menu ?? this.menu,
    );
  }
}
