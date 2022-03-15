// Getter - Setter

void main() {
  

  User1 user1 = User1();
  user1.id = 1;
  user1.name = "name";
  print(user1);

  User2 user2 = User2(2, "user2");
  user2.id = 22;
  user2.name = "name22";
  print(user2);               // User [22 : name22]

  User3 user3 = User3();
  print(user3);               // User3 [3 : user3]
  // user3.name = "user33";

  /*
  * 
  * ch06_getset.dart:19:9: Error: The setter 'name' isn't defined for the class 'User3'.
 - 'User3' is from 'ch06_getset.dart'.
  Try correcting the name to the name of an existing setter, or defining a setter or field named 'name'.
  user3.name = "user33";
        ^^^^
*/

  
  // ch06_getset.dart:30:22: Error: Too few positional arguments: 2 required, 0 given.
  //User4 user4 = User4();

  User4 user4 = User4(4,"name4");
  print(user4);               
  //user4.name = "user44";
  /*
   ch06_getset.dart:35:9: Error: The setter 'name' isn't defined for the class 'User4'.
   - 'User4' is from 'ch06_getset.dart'.
  Try correcting the name to the name of an existing setter, or defining a setter or field named 'name'.
  user4.name = "user44";
        ^^^^
  */

  User5 user5 = User5(5,"name5");
  print(user5);


  //print(user5.id);
  
  /*
  ch06_getset.dart:46:15: Error: Can't use 'id' because it is declared more than once.
  print(user5.id);
              ^^ 
  */

  //user5.id = 55;
  
  // Unhandled exception:
  // Stack Overflow
  // #0      User5.id= (file:///.../ch06_classes/ch06_getset.dart:119:3)
  // #1      User5.id= (file:///.../ch06_classes/ch06_getset.dart:119:20)
  // #2      User5.id= (file:///.../ch06_classes/ch06_getset.dart:119:20)
  //           ..................................


  User6 user6 = User6(6,"name6");
  print(user6);                          // User6 [6 : name6]
  user6.name2 = "user66";
  print(user6);                         // User6 [6 : name66]
  
  // user6.id = 66;

  //ch06_getset.dart:70:9: Error: The setter 'id' isn't defined for the class 'User6'.
  //- 'User6' is from 'ch06_getset.dart'.
  //Try correcting the name to the name of an existing setter, or defining a setter or field named 'id'.
  //user6.id = 66;
  //      ^^

  // user6._id = 66;
  // ch06_getset.dart:78:9: Error: The setter '_id' isn't defined for the class 'User6'.
  // - 'User6' is from 'ch06_getset.dart'.
  // Try correcting the name to the name of an existing setter, or defining a setter or field named '_id'.
  // user6._id = 66;
  //       ^^^
  
  MySingleton s1 = MySingleton.instance;
  MySingleton s2 = MySingleton.instance;
  if (s1 == s2){
    print('eq!');
  }

}

class User1{
  /*
    ch06_getset.dart:16:7: Error: Field 'id' should be initialized because its type 'int' doesn't allow null.
      int id;
          ^^
  int id;
   
 */

  int? id;
  String? name;

  @override
  String toString() => "User1 [$id : $name]";
}

class User2{
  int id;
  String name;
  User2(this.id, this.name);
  @override
  String toString() => "User2 [$id : $name]";
}


class User3{
  /*
  ch06_getset.dart:44:13: Error: Final field 'id' is not initialized.
  Try to initialize the field in the declaration or in every constructor.
  final int id;
            ^^
  final int id;

  */
  final int id = 3;
  final String name = "user3";
  //User3(this.id, this.name);

  @override
  String toString() => "User3 [$id : $name]";
}

class User4{
  final int id;
  final String name;

  //User4();

  /*ch06_getset.dart:98:3: Error: 'User4' is already declared in this scope.
  User4(this.id, this.name);
  ^^^^^
  ch06_getset.dart:97:3: Context: Previous declaration of 'User4'.
  User4();
  ^^^^^
  */
  
  User4(this.id, this.name);

  @override
  String toString() => "User4 [$id : $name]";
}
  
  
class User5{
  final int id;
  final String name;

  User5(this.id, this.name);

  set id(int v) => id = v; 

//  int get id => id;

  /*
  * ch06_getset.dart:127:11: Error: 'id' is already declared in this scope.
  int get id => id;
          ^^
  ch06_getset.dart:121:13: Context: Previous declaration of 'id'.
  final int id;
            ^^
  */


  @override
  String toString() => "User5 [$id : $name]";
}


class User6{
  final int _id;
  String name;
  //String _name;

  // ch06_getset.dart:159:18: Error: 'name' isn't an instance field of this class.
  //User6(id, this.name):_id = id;
  //               ^^^^


  User6(id, this.name):_id = id;

  set name2(String v) => name = v; 

  String get name2 => name;


  @override
  String toString() => "User6 [$_id : $name2]";
}

class MySingleton{
  MySingleton._();
  static final instance = MySingleton._();
}
