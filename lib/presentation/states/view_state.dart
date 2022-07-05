import 'package:network_client/network_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'view_state.freezed.dart';

@freezed
class ViewState<T> with _$ViewState<T> {
  const factory ViewState.success({T? data}) = _Success<T>;
  const factory ViewState.initial() = _Initial;
  const factory ViewState.error(Failure failure) = _Error;
  const factory ViewState.loading() = _Loading;
}

extension ViewStateX on ViewState {
  bool get isLoading => this == const ViewState.loading();
  bool get isInitial => this == const ViewState.initial();
  bool isSuccess(data) => this == ViewState.success(data: data);
  bool isError(Failure f) => this == ViewState.error(f);
}
