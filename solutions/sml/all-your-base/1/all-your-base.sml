use "helpers.sml";

(* υψώνει τον αριθμό numb^to *)
val rec pow = fn (numb, to) =>
  if to = 0
  then 1
  else numb * pow (numb, to -1)


val intToArray = fn x =>
  let 
    val numToStr = fn x: int =>
      rev (explode (Int.toString x))

    val rec aux = fn x:char list =>
      if null x
      then []
      else ord (hd x) - 48::aux(tl x)
  in
    aux(numToStr(x))
  end

val rec findPow = fn (number:int, base:int) =>
  let
    fun aux x =
    let 
      val endiameso = number div  pow(base, x) 
    in
      if endiameso = 1
      then x
      else
        if endiameso = 0
        then x - 1
        else aux (x+1)
    end
  in
    aux 0
  end  

(* return an array from the decimal number to newbase *)
fun fromDec( number:int, newBase : int) =
  if number = 0 
  then [0]
  else
let
  val powerToStart = findPow(number, newBase)
  val rec nextPower = fn (num:int, x:int) =>
    if num = 0
    then [0]
    else
    let
      val mplier =  pow(newBase, x)
      val toRemove = num div mplier
    in
      if x = 0
      then toRemove::[]
      else toRemove::nextPower (num - (toRemove * mplier),  x -1)
    end
in
  nextPower(number, powerToStart)
end

fun aToInt( base: int, number: int list) =
let
  val power = length number -1 (* η μέγιστη δύναμη π.χ σε πίνακα [1,2,3] = ^2*)
  fun calculateValue (x:int, l:int list) =
    if x = 0
    then hd l 
    else pow(base,x) * hd l + calculateValue( x-1, tl l) 
in
  calculateValue (power, number)
end

fun rebase (inBase: int, outBase: int, digits: int list): int list option =
  if not (isValidListInBase (inBase, digits)) 
     orelse not (checkBases(inBase, outBase)) 
  then NONE
  else 
    if inBase = outBase (* no conversion needed *)
    then SOME digits
    else      
      let
        val decimalValue = aToInt(inBase, digits) (* convert to decimal value *)
      in
        SOME  (fromDec(decimalValue, outBase))
      end
