abstract class ViewModelBase<T> {
  ViewModelBase(
      {this.isLoading = false,
      this.isSuccess = false,
      this.message = 'Unknown',
      this.data});

  final bool isLoading;
  final bool isSuccess;
  final String? message;
  final T? data;
}
