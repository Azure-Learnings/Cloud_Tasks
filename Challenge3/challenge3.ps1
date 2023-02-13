# We have a nested object, we would like a function that you pass in the object and a key and get back the value. 
# How this is implemented is up to you.
# Example Inputs
# object = {“a”:{“b”:{“c”:”d”}}}
# key = a/b/c
##
# object = {“x”:{“y”:{“z”:”a”}}}
# key = x/y/z
# value = a

function Get-NestedValue {
    param(
        [object]$obj,
        [string]$key
    )
    $keys = $key.Split('/')
    foreach ($k in $keys) {
        if ($obj.ContainsKey($k)) {
            $obj = $obj[$k]
        } else {
            return $null
        }
    }
    return $obj
}

$object1 = @{ "a" = @{ "b" = @{ "c" = "d" } } }
$key1 = "a/b/c"
$value1 = Get-NestedValue -obj $object1 -key $key1
Write-Output "Value 1: "$value1 # Output: "d"

$object2 = @{ "x" = @{ "y" = @{ "z" = "a" } } }
$key2 = "x/y/z"
$value2 = Get-NestedValue -obj $object2 -key $key2
Write-Output "Value 2:"$value2 # Output: "a"