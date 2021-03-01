import 'package:bloc/bloc.dart';

///
/// [BlocObserver] for the insta application which
/// observes all [Cubit] state changes.
///

class InstaCubitObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    print('${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }
}
