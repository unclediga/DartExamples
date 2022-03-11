void main(){
  withinTolerance(5);

/*
 Error: Expected an identifier, but got ','.
Try inserting an identifier before ','.
  withinTolerance(5,,100);


  withinTolerance(5,,100);

*/

  withinTolerance(25,0,24);
  withinTolerance(25,0,100);


/*
 Error: Too many positional arguments: 1 allowed, but 3 found.
Try removing the extra positional arguments.

  within1(5,0,24);

 Error: Too many positional arguments: 1 allowed, but 3 found.
Try removing the extra positional arguments.

  within1(25,0,100);
*/

  within1(25,min: 0,max: 100);  
  within1(5,min: -10);  
  within1(5,max: 15);  

   
/*
   Error: Required named parameter 'value' must be provided.

   within2();
*/

   within2(value:123);


   print(compliment(123));
   print(compliment(1.2345));
   print(compliment('hello'));


   ////////// Anonymous functions


   Function fn = (number){
     return 'fn: $number is a value';
   };

   print(fn('ANONYMOUS'));

   myPrint(fn,'ANONYMOUS');

   Function triple =  applyMultiplier(3);
   
   print(triple(2));
   print(triple(2.1));

   // local clojure
   int counter = 0;
   final incrementCounter = (){
     counter+=1;
   };
   incrementCounter();
   incrementCounter();
   incrementCounter();
   incrementCounter();
   incrementCounter();
   print("counter $counter");   

   // Arrow
   triple =  applyMultiplier2(3);
   
   print(triple(2));
   print(triple(2.1));


}


 //////////// default values

bool withinTolerance(int value, [int min = 0, int max = 10]) {
  return min <= value && value <= max;
}


///////////// Naming parameters
bool within1(int value, {int min = 0, int max = 10}) {
  return min <= value && value <= max;
}


//////////// required params
bool within2({
  required int value, 
  int min = 0, 
  int max = 10}) {
  return min <= value && value <= max;
}

/////////// Optional types

compliment(number){
  return '$number is a value';
}

//  The following function is the equivalent of what Dart sees 
//  String compliment(dynamic number){
//    return '$number is a value';
//  }

 void myPrint(Function fn, val){
   print("my print: " + fn(val));
 }

Function applyMultiplier(num times){
  return (num val){
     return val * times;
  };
}


 //////////// Arrow function


Function applyMultiplier2(num times){
  return (num val) => val * times;
}
