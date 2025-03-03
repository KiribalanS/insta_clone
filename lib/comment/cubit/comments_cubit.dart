import 'package:flutter_bloc/flutter_bloc.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<List<String>> {
  CommentsCubit()
      : super([
          "commment1",
          "commment1",
          "commment1",
          "commment1",
          "commment1",
          "commment1",
          "commment1",
        ]);

  void addComment(String s) {
    emit([...state, s]);
  }
}
