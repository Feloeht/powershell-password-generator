param($length)

function Get-RandomCharacters($length, $characters) {
    
    $random = 1..$length | ForEach-Object { Get-Random -Maximum $characters.length }
    $private:ofs=""
    return [String]$characters[$random]
}

function Get-EightCharactersPassword() {
    $password = Get-RandomCharacters -length 5 -characters 'abcdefghiklmnoprstuvwxyz'
    $password += Get-RandomCharacters -length 1 -characters '!@#$%&_-+=\(){}:;"<>?/'
    $password += Get-RandomCharacters -length 1 -characters 'ABCDEFGHKLMNOPRSTUVWXYZ'
    $password += Get-RandomCharacters -length 1 -characters '1234567890'
    return $password
}

if($length -eq $null -or $length -eq 8){
    return Get-EightCharactersPassword
}
elseif($length > 9){
    $characters = $characters = 'abcdefghiklmnoprstuvwxyz1234567890!@#$%&_-+=\(){}:;"<>?/ABCDEFGHKLMNOPRSTUVWXYZ'
    $password = Get-EightCharactersPassword
    $password += Get-RandomCharacters -length $length-8 -characters $characters
    return $password
}
else{
    $characters = $characters = 'abcdefghiklmnoprstuvwxyz1234567890!@#$%&_-+=\(){}:;"<>?/ABCDEFGHKLMNOPRSTUVWXYZ'
    return Get-RandomCharacters -length $length -characters $characters
}