abstract class TaskStates {}

class TaskInitial extends TaskStates {}

class TaskGetListLoading extends TaskStates {}

class TaskGetListSuccess extends TaskStates {}

class TaskGetListFailure extends TaskStates {}

class TaskSelect extends TaskStates {}

class TaskCheck extends TaskStates {}

class TaskNext extends TaskStates {}
