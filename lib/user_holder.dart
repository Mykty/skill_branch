
import 'models/user.dart';

class UserHolder{
  Map<String, User> users = {};

  void registerUser(String name, String phone, String email){
    User user = User(name: name, phone: phone, email: email);

    if(!users.containsKey(user.login)){
      users[user.login] = user;
    } else {
      throw Exception("A user with this name already exist");
    }
  }

  
  User registerUserByEmail(String fullName, String email){
    User user = User(name: fullName, email: email);

    if(!users.containsKey(user.login)){
      users[user.login] = user;
      return user;

    } else {
      throw Exception("A user with this name already exist");
    }
  }

  User registerUserByPhone(String fullName, String phone){
    User user = User(name: fullName, phone: phone);

    if(!users.containsKey(user.login)){
      users[user.login] = user;
      return user;

    } else {
      throw Exception("A user with this name already exist");
    }
  }


  User getUserByLogin(String login){
    if(users.containsKey(login)) return users[login];

    return null;
  }

  void setFriends(String login, List<User> friends){
    users[login].addFriend(friends);
  }

  User findUserInFriends(String login, User user){
    if(users[login].friends.contains(user)) return user;
    else throw Exception("Friend not found");
  }

  List<User> importUsers(List<String> csv){
    List<User> users = <User>[];
    for(String userInfo in csv){
      int index1 = userInfo.indexOf(";");
      int index2 = userInfo.indexOf(";", index1+1);
      int index3 = userInfo.indexOf(";", index2+1);

      String name = userInfo.substring(0, index1).trim();
      String email = userInfo.substring(index1+1, index2).trim();
      String phone = userInfo.substring(index2+1, index3).trim();

      User user = User(name: name, phone: phone, email: email);
      print(user);

      users.add(user);

    }

    return users;
  }
}