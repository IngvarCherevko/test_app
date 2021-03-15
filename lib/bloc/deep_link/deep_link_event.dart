part of 'deep_link_bloc.dart';

@immutable
abstract class DeepLinkEvent extends Equatable {
  const DeepLinkEvent();

  @override
  List<Object> get props => [];
}

class CheckDeepLinkStatus extends DeepLinkEvent {}
