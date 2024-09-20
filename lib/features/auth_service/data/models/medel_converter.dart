import '../../domain/entities/user_model_entity.dart';
import 'current_user_model.dart';
import 'other_user_model.dart';

CurrentUserEntity currentUserToEntity(CurrentUserModel currentUser) {
  return CurrentUserEntity(
    id: currentUser.id,
    email: currentUser.email,
    username: currentUser.username,
    profilePictureUrl: currentUser.profilePictureUrl,
    isOnline: currentUser.isOnline,
    password: currentUser.password,
    contacts: currentUser.contacts,
    blockedUsers: currentUser.blockedUsers,
    chats: currentUser.chats,
  );
}

OtherUserEntity otherUserToEntity(OtherUserModel otherUser) {
  return OtherUserEntity(
    id: otherUser.id,
    email: otherUser.email,
    username: otherUser.username,
    profilePictureUrl: otherUser.profilePictureUrl,
    isOnline: otherUser.isOnline,
  );
}
