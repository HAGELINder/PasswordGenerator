# 20 character password Generator
# author HagelinDer
# To take from
$alpha = 'a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z'
$swe = 'å,ä,ö'
$num = 0..9
$char = '!,#,¤,%,&,/,(,),=,?,>,<,@,[,],^,{,}'
# create an empty array
$arr = @()
$kg = $true

while ($kg) {
    Try {
        $extra = Read-Host -Prompt 'Use Swedish characters? y/n '
        $extra = $extra.ToLower()
        if ($extra -eq 'y') {
            # add to the array, alpha (splitting the string (by ",") to an array to extract)
            # get 9 random alphanumeric characters
            $arr += $alpha.Split(",") | Get-Random -Count 9
            # add 1 random Swedish character
            $arr += $swe.Split(",") | Get-Random -Count 1
            # set the first character to uppercase
            $arr[0] = $arr[0].ToUpper()
            # set the last character to upper
            $arr[-1] = $arr[-1].ToUpper()
            # get 6 random numbers
            $arr += $num | Get-Random -Count 6
            # get 4 random special characters
            $arr += $char.Split(",") | Get-Random -Count 4
            ($arr | Get-Random -Count $arr.Count) -join ""
            # exit
            $kg = $false
        }
        elseif ($extra -eq 'n') {
            # add to the array, alpha (splitting the string (by ",") to an array to extract)
            # get 9 random alphanumeric characters
            $arr += $alpha.Split(",") | Get-Random -Count 9
            # set the first character to uppercase
            $arr[0] = $arr[0].ToUpper()
            # set the last character to upper
            $arr[-1] = $arr[-1].ToUpper()
            # get 6 random numbers
            $arr += $num | Get-Random -Count 6
            # get 4 random special characters
            $arr += $char.Split(",") | Get-Random -Count 4
            ($arr | Get-Random -Count $arr.Count) -join ""
            # exit
            $kg = $false
        }
        else {
        'Please select y or n'
        }
    }    
    catch {
        throw 'Error'
        }
}
