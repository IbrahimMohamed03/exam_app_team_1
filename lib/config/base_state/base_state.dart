
class BaseState<T>{
  bool isLoading;
  String? errMsg;
  T? data;
  BaseState({this.isLoading=false,this.errMsg,this.data});
  BaseState<T> copyWith({
    bool? isLoading,
    String? errMsg,
    T? data
}){
return BaseState(
    isLoading: isLoading?? this.isLoading,
    errMsg: errMsg?? this.errMsg,
    data: data?? this.data
);
}
}