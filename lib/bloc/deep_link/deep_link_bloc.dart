import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth_flutter_app/services/deep_link.dart';
import 'package:meta/meta.dart';

part 'deep_link_event.dart';
part 'deep_link_state.dart';

class DeepLinkBloc extends Bloc<DeepLinkEvent, DeepLinkState> {
  DeepLinkBloc() : super(DeepLinkInitial());
  DynamicLinkService _service = DynamicLinkService();

  @override
  Stream<DeepLinkState> mapEventToState(
    DeepLinkEvent event,
  ) async* {
    if (event is CheckDeepLinkStatus) {
      String _path = await _service.initDynamicLinks();
      if (_path != null) {
        yield OpenInDeepLinkState(_path);
      } else {
        yield OpenInMainLinkState();
      }
    }
  }
}
