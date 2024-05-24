


class Persistentdb{
  final String task;
  final bool  istaskComplete;

  Persistentdb({required this.task, required this.istaskComplete});

  String getString(){
    return this.task;
  }
  
  
}