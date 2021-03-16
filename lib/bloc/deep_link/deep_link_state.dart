part of 'deep_link_bloc.dart';

@immutable
abstract class DeepLinkState extends Equatable {
  @override
  List<Object> get props => [];
}

class DeepLinkInitial extends DeepLinkState {}

class OpenInMainLinkState extends DeepLinkState{}

class OpenInDeepLinkState extends DeepLinkState{
  final String _deepLinkString;
  OpenInDeepLinkState(this._deepLinkString);

  @override
  List<Object> get props => [_deepLinkString];
}
