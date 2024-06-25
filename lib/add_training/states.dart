abstract class PostStatus {}

class InitialStates extends PostStatus {}

// حالات إنشاء المنشور
class CreatePostLoadingState extends PostStatus {}

class CreatePostSuccessState extends PostStatus {}

class CreatePostErrorState extends PostStatus {}

// حالات اختيار الصورة للمنشور
class PostPickerSuccessState extends PostStatus {}

class PostPickerErrorState extends PostStatus {}

// حالة إزالة الصورة المختارة
class RemovePostImageState extends PostStatus {}

// حالات الحصول على المنشورات
class GetPostsLoadingStates extends PostStatus {}

class GetPostsSuccessStates extends PostStatus {}

class GetPostsErrorStates extends PostStatus {
  final String error;

  GetPostsErrorStates(this.error);
}

// حالات تحديث المنشور
class UpdatePostLoadingState extends PostStatus {}

class UpdatePostSuccessState extends PostStatus {}

class UpdatePostErrorState extends PostStatus {}

// حالات أخرى لإشارات الحالة
class RestartSuccessState extends PostStatus {}
