class TaskFlow {
  static List<Task> _taskList = [];
  Function? _onSuccess;
  Function([Object?])? _onFail;
  int _index = 0;

  TaskFlow(List<Task> taskList) {
    _taskList = taskList;
  }

  static TaskFlow create(List<Task> taskList) {
    return TaskFlow(taskList);
  }

  void start({Function? onSuccess, Function([Object?])? onFail}) async {
    _onSuccess = onSuccess;
    _onFail = onFail;

    await _execute();
  }

  void next() async {
    await _execute();
  }

  void fail([Object? error]) {
    _onFail!(error);
  }

  Future _execute() async {
    if (_index < _taskList.length) {
      if (_taskList[_index].canExecute != false) {
        await _taskList[_index].action();
        _index++;
      }
    } else {
      _onSuccess!();
    }
  }
}

class Task {
  final Function action;
  final bool? canExecute;

  Task({required this.action, this.canExecute});
}
