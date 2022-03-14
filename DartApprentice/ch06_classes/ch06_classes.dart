//       C O N S T R U C T O R 
void main(){
  

  //////////////////////////////
  Object user = User()
    ..id = 1
    ..name = 'test';
  
  print(user);

  user = User2(2, 'test2');
  print(user);  
  user = User3(3, 'test3');
  print(user);  

  user = UserAnony.anonymous();
  print("anonymous is $user");    

  user = UserAnony();
  print("default anonymous is $user");    
  
  user = UserAnony2.anonymous();
  print("UserAnony2 anonymous is $user");    

  user = UserAnony3.anonymous();
  print("UserAnony3 anonymous is $user");    

  user = UserAnony4.anonymous();
  print("UserAnony4 anonymous is $user");    

  user = User4.anonymous();
  print("User4 anonymous is $user");    

  // working in mode : dart --enable-asserts *.dart
  user = User5(id:-1, name:'');
  print("User5 anonymous is $user");    


  user = User6(id:100, name:'const1');
  const user2 = User6(id:200, name:'const2');


  print("User6  is $user");    
  print("User6  is $user2");    

  
  final Map<String,Object> m = {"id":100,"name" : "User7" };
  user = User7.fromJson(m);
  print("User7  is $user");    

}


class User{
  //  Error: Field 'name' should be initialized because its type 'String' doesn't allow null
  String name = '';
  int id = 0;

  ///////// def constructor
  //User(){}

  @override
  String toString(){
    return "User [$id : $name]";
  }

}

class User2{
  // Error: Field 'name' should be initialized because its type 'String' doesn't allow null
  String name = '';
  int id = 0;

  ///////// custom constructor
  User2(int id, String name){
    this.id = id;
    this.name = name;
  }

  @override
  String toString(){
    return "User2 [$id : $name]";
  }
}

class User3{
  // No Error !
  String name;
  int id;

  ///////// Short-form constructor
  User3(this.id, this.name);

  @override
  String toString(){
    return "User3 [$id : $name]";
  }
}


class UserAnony{

  //  Error: Field 'name' should be initialized because its type 'String' doesn't allow null
  String name = '';
  int id = -1;

  
  /// Error: Couldn't find constructor 'User'.
  // Object user = User()
  //               ^^^^
  UserAnony(){}

  @override
  String toString(){
    return "User [$id : $name]";
  }

  // Named constructor

  UserAnony.anonymous(){
    id = 0;
    name = 'anonymous';
  }
}


class UserAnony2{

  String name;
  int id;

  
  UserAnony2(this.id, this.name);

  // Named constructor

  UserAnony2.anonymous(): this(0,'anonymous');

  @override
  String toString(){
    return "User [$id : $name]";
  }

}

class UserAnony3{

  String name;
  int id;

  
  UserAnony3({this.id = -1, this.name = ''});

  // Named constructor

  UserAnony3.anonymous(): this(id:0,name:'anonymous');

  @override
  String toString(){
    return "User [$id : $name]";
  }

}

class UserAnony4{

  String name;
  int id;

  
  UserAnony4({this.id = 0, this.name = ''});

  // Named constructor

  UserAnony4.anonymous(): this(name:'anonymous');

  @override
  String toString(){
    return "User [$id : $name]";
  }

}


class User4{

  String _name;
  int _id;

  //                                |  <-  initializer list ->  |
  User4({id = 0, name = 'anonymous'}) : _id = id, _name = name;

  // Named constructor

  User4.anonymous(): this();

  @override
  String toString(){
    return "User [$_id : $_name]";
  }

}

// Checking for errors

class User5{

  String _name;
  int _id;

                                
// working in debug-mode or cmd: dart --enable-asserts *.dart
  User5({id = 0, name = 'anonymous'}) : 
    assert(id >= 0),
    assert(name.isNotEmpty),
    _id = id, _name = name;


  @override
  String toString(){
    return "User [$_id : $_name]";
  }

}


// immutable 

class User6{

  final String _name;
  final int _id;

                                
//  Error: Cannot invoke a non-'const' constructor where a const expression is expected.
//  Try using a constructor or factory that is 'const'.
//       const user2 = User6(id:200, name:'const2');
//                     ^^^^^
//  User6({id = 0, name = 'anonymous'}) : .....
const  User6({id = 0, name = 'anonymous'}) : 
    _id = id, _name = name;


  @override
  String toString(){
    return "User [$_id : $_name]";
  }

}

// Factory constructors

class User7{

  final String _name;
  final int _id;

                                
  User7({id = 0, name = 'anonymous'}) : 
    _id = id, _name = name;

  factory User7.fromJson(Map<String,Object> json) {
    final userId = json["id"] as int;
    final userName = json["name"] as String;
    return User7(id:userId, name:userName);
  }


  @override
  String toString(){
    return "User [$_id : $_name]";
  }




}



class Address{
  var id = '';

} 
