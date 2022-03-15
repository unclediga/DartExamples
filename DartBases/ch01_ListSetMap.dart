void main(){

  //////////////////////////////////////
  /// 
  ///          L I S T 
  /// 
  /// //////////////////////////////////
  var l1 = [1,2,3];

  //  Error: A value of type 'String' can't be assigned to a variable of type 'List<int>'.
  // 
  //  print(l1 + " type ");
  //  print(" type " + l1);
  //
  print(l1.toString() + " type");
  print("$l1 type");

  l1.forEach(print);
  for(var i in l1) { print(i); };

  var l11 = [for(var i in l1) if(i > 2) i];
  prn(l11); // [3] type List<int>
  l11 = [for(var i in l1) if(i > 2) i,...l1];
  prn(l11); // [3, 1, 2, 3] type List<int>






  // https://dart.dev/guides/language/effective-dart/usage
  print("${l1.toList()} type ${l1.toList().runtimeType}");   // [1, 2, 3] type  List<int>
  print("${List.from(l1)} type ${List.from(l1).runtimeType}"); // [1, 2, 3] type List<dynamic>

  // list

  var l2 = [[1,2,3],4];
  print(l2); // [[1, 2, 3], 4] type List<Object>


  l2 = [[1,2,3]];
  print(l2); // [[1, 2, 3]] type List<Object>
  var l3 = [[11,22,33]];
  prn(l3); // [[11, 22, 33]] type List<List<int>>


   //  Error: The method 'add' isn't defined for the class 'Object'.
   // 
   //   l2[0].add(77);
   // 


   (l2[0] as List).add(77);
   l3[0].add(77);

  
  print(l2); // [[1, 2, 3, 77]] type List<Object>
  print(l3); // [[11, 22, 33, 77]] type List<List<int>>

  var l23 = [...l2,...l3];
  prn(l23); // [[1, 2, 3, 77], [11, 22, 33, 77]] type List<Object>
  var l33 = [...l3,...l3];
  prn(l33); // [[11, 22, 33, 77], [11, 22, 33, 77]] type List<List<int>>

  var l22 = [l2,l2];
  prn(l22); // [[[1, 2, 3, 77]], [[1, 2, 3, 77]]] type List<List<Object>>
  List<List<List<int>>> l222 = [l3,l3];
  prn(l222); //[[[11, 22, 33, 77]], [[11, 22, 33, 77]]] type List<List<List<int>>> 
  List<List<Object>> l2222 = l222 as List<List<Object>>;
  prn(l2222); //[[[11, 22, 33, 77]], [[11, 22, 33, 77]]] type List<List<List<int>>> 





  ///////////////////////////////////////////////////////// 
  /// 
  ///               SET 
  /// 
  ///////////////////////////////////////////////////////// 
  var s1 = <int>{1,2,3,3,3,3,4,4,4,4,5};
  prn(s1); // {1, 2, 3, 4, 5} type _CompactLinkedHashSet<int>
  s1.add(10);
  s1.remove(1);
  prn(s1); // {2, 3, 4, 5, 10} type _CompactLinkedHashSet<int> 



  // Error: Constant evaluation error:
  // const s2 = <int>{1,2,3,3,3,3,4,4,4,4,5};
  //                 ^
  // ch01_Types.dart:67:26: Context: The element '3' conflicts with another existing element in the set.
  // const s2 = <int>{1,2,3,3,3,3,4,4,4,4,5};
  //                        ^

   const s2 = <int>{1,2,3,4,5};
   prn(s2); // {1, 2, 3, 4, 5} type _CompactImmutableLinkedHashSet<int>

   //Unhandled exception:
   // Unsupported operation: Cannot change an unmodifiable set
   //
   //  s2.add(10);

   final s3 = <int>{1,2,3,3,3,4,4,5};
   s3.add(10);
   //my: error s3 - unordered! 
   // s3[1] = 222;
   prn(s3);  // {1, 2, 3, 4, 5, 10} type _CompactLinkedHashSet<int>


   ////////////////////////////////////
   /// 
   ///             MAP 
   /// 
   /// ////////////////////////////////

   var m1 = {1 : "1", 2 : "2"};
   prn(m1); // {1: 1, 2: 2} type _InternalLinkedHashMap<int, String>

   m1[1] = "111";
   m1[3] = "3";
   prn(m1);


   var m2 = {"A" : 1, "B" : 2, "C" : 3};
   print(m2["A"]);  // 1
   prn(m2);  // {A: 1, B: 2, C: 3} type _InternalLinkedHashMap<String, int>


   var k = m2.keys;   
   var v = m2.values; 
   prn(k);         // (A, B, C) type _CompactIterable<String>
   prn(v);         // (1, 2, 3) type _CompactIterable<int>

   m2.remove("C");
   prn(m2);         // {A: 1, B: 2} type _InternalLinkedHashMap<String, int>

   m1.removeWhere((key, value) => (key % 2 != 0));
   prn(m1);      // {2: 2} type _InternalLinkedHashMap<int, String>


   /////////////////////////////////////////
   ///   dynamic
   /// ///////////////////////////////////

   var ld = [1,"2",[3,4]];
   ld.add('a');
   prn(ld);  // [1, 2, [3, 4], a] type List<Object>

   List<dynamic> ld2 = [1,"2",[3,4]];  
   ld2.add('a');
   prn(ld2);   // [1, 2, [3, 4], a] type List<dynamic>

   var md = <dynamic,dynamic>{
     1: "111",
     "2": 222,
     "3": "333",
     4 : 444
   } ;
   print(md[1]);
   print(md["2"]);
   prn(md);  // {1: 111, 2: 222, 3: 333, 4: 444} type _InternalLinkedHashMap<dynamic, dynamic>
}


void prn(Object a){
  print("${a} type ${a.runtimeType}"); //[[[11, 22, 33, 77]], [[11, 22, 33, 77]]] type List<List<List<int>>>   
}

