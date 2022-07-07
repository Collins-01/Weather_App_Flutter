import 'package:equatable/equatable.dart';

abstract class HomeEvents extends Equatable {
  const HomeEvents();
}

class OnHomePageLoadEvent extends HomeEvents {
  const OnHomePageLoadEvent();
  @override
  List<Object?> get props => [];
}

class HomePageSearchEvent extends HomeEvents {
  final String query;
  const HomePageSearchEvent(this.query);
  @override
  List<Object?> get props => [query];
}
