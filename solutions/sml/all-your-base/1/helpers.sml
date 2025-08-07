(* υψώνει τον αριθμό numb^to *)
val rec pow = fn (numb, to) =>
  if to = 0
  then 1
  else numb * pow (numb, to -1)

(* list has no negative digits*)
val rec hasPositiveOnlyDigits = fn (lx: int list) =>
  if null lx
  then true
  else
    if hd lx < 0
    then false
    else hasPositiveOnlyDigits (tl lx) 

(* είναι όλα τα ψηφία εντός βάσης *)
val isAllDigitsInBase = fn (base:int, lx:int list) =>
  let
    val maxValidDigit = base - 1
    val rec checkDigit = fn (llx: int list) =>
    if null llx
    then true
    else
      if hd llx > maxValidDigit
      then false
      else checkDigit (tl llx)
  in
    if base <= 1 orelse null lx
    then false
    else checkDigit lx 
  end

val isValidList = fn x:int list =>
let
  (* trim front zeros *)
  val rec trimLeadingZero = fn (x:int list) =>
    if null x
    then []
    else
      if length x = 0
      then []
      else 
        if hd x = 0
        then trimLeadingZero (tl x)
        else x

  (*is empty list *)
  val isNotEmpty = fn (lx)=>
    not (null lx)
in
  isNotEmpty (trimLeadingZero x) 
end

val isValidListInBase = fn (base: int, lx:int list) =>
  isValidList lx andalso isAllDigitsInBase (base, lx) andalso
  hasPositiveOnlyDigits lx


val checkBases = fn (inB:int, outB:int)=>
  if inB < 2 orelse outB < 2
  then false
  else true
