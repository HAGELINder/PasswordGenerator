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
$msgBoxInput =  [System.Windows.MessageBox]::Show('Would you like to use Swedish characters','Hagelinder Password Generator','YesNoCancel','Question')
  switch  ($msgBoxInput) {

  'Yes' {

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
        $pswd = ($arr | Get-Random -Count $arr.Count) -join ""
        [System.Windows.MessageBox]::Show($pswd,'Your password has been copied to your clipboard') 
        Set-Clipboard -Value "$pswd"
  }

  'No' {

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
        $pswd = ($arr | Get-Random -Count $arr.Count) -join ""
        [System.Windows.MessageBox]::Show($pswd,'Your password has been copied to your clipboard')
        Set-Clipboard -Value "$pswd"
  }

  'Cancel' {

  [System.Windows.MessageBox]::Show('No password generated')

  }

  }