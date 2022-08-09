

function pow($num1, $num2) {
    $result = [math]::Pow($num1, $num2);
    "`n  {0}^{1} = {2:N0}`n" -f $num1, $num2, $result
}

function powf($num1, $num2) {
    $result = [math]::Pow($num1, $num2);
    "  {0}^{1} = {2:N0}" -f $num1, $num2, $result
}

function summation {
    Param(
        # Parameter help description
        [Parameter(Position = 1, Mandatory = $True)]
        [int]
        $start,
        [Parameter(Position = 2, Mandatory = $True)]
        [int]
        $n
    )
    if ($start -eq 0 || $start -eq 1) {
        $answer = ($n * ($n + 1)) / 2
        "`n✅ Sum({0},{1}) = {2:0}`n" -f $start, $n, $answer
    }
    else {
        $count = 0
        for ($i = $start; $i -le $n; $i++) {
            $count = $count + $i
        }
        "`n✅ Sum({0},{1}) = {2}`n" -f $start, $n, $count
    }
}


function fact {
    param(
        # Parameter help description
        [Parameter()]
        [int]
        $start
    )

    $total = 1
    for ($i = $start; $i -gt 0; $i--) {
        $total = $total * $i
    }

    "`n{0}! = {1}`n" -f $start, $total
}

function fib {
    param(
        # Parameter help description
        [Parameter()]
        [int]
        $fib
    )
    if ($fib -gt 46) {
        "Fib({0}) - {1}" -f $fib, "Number too large! Try any number between 0-46"
    }
    elseif ($fib -lt 0) {
        "Fib({0}) - {1}" -f $fib, "Number too small! Try any number between 0-46"
    }
    elseif ($fib -eq 0) {
        "Fib({0}) = 0" -f $fib 
    }
    elseif ($fib -lt 3) {
        "Fib({0}) = 1" -f $fib 
    }
    else {
        $arr = New-Object int[] ($fib + 1)
        $arr[0] = 0;
        $arr[1] = 1;
        for ($i = 2; $i -le $fib; $i++) {
            $arr[$i] = $arr[$i - 1] + $arr[$i - 2]
        }

        "Fib({0}) = {1}" -f $fib, $arr[$fib]
    }
    
}

function fibs {
    param(
        # Parameter help description
        [Parameter()]
        [int]
        $fibs
    ) 

    for ($i = 0; $i -le $fibs; $i++) {
        fib $i
    }
}

function pows($num, $k) {
    $i = 0;
    ""
    while ($i -le $k) {
        $result = powf $num $i;
        if ($i -eq $k) {
            "{0}" -f $result
        }
        else {
            "{0}," -f $result
        }
        $i++;
    }
    ""
}

function mod {
    [CmdletBinding()]
    param(
        [Parameter(Position = 0, Mandatory = $true)]
        [int] $num1,
        [Parameter(Position = 1, Mandatory = $true)]
        [int] $num2
    )

    $answer = $num1 % $num2
    if ($answer -lt 0) {
        "`n{0} % {1} => {2} OR {3}`n" -f $num1, $num2 , ($num2 + $answer), $answer
    }
    else {
        "`n{0} % {1} => {2}`n" -f $num1, $num2 , $answer
    }
}

function kbconv($kb) {
    $kbrate = pow 2 10;
    $bits = $kb * $kbrate;
	
    bitconv $bits
}

function mbconv($mb) {
    $mbrate = pow 2 20;
    $bits = $mb * $mbrate;
	
    bitconv $bits
}

function gbconv($gb) {
    $gbrate = pow 2 30;
    $bits = $gb * $gbrate;
	
    bitconv $bits
}