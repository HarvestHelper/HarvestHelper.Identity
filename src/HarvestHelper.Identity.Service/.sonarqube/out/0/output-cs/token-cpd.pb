�
�C:\Users\DuartePC\source\repos\HarvestHelper\HarvestHelper.Identity\src\HarvestHelper.Identity.Service\Areas\Identity\Pages\Account\Logout.cshtml.cs
	namespace 	
HarvestHelper
 
. 
Identity  
.  !
Service! (
.( )
Areas) .
.. /
Identity/ 7
.7 8
Pages8 =
.= >
Account> E
{ 
public 

class 
LogoutModel 
: 
	PageModel (
{ 
private 
readonly 
SignInManager &
<& '
ApplicationUser' 6
>6 7
_signInManager8 F
;F G
private 
readonly 
ILogger  
<  !
LogoutModel! ,
>, -
_logger. 5
;5 6
private 
readonly -
!IIdentityServerInteractionService :
interaction; F
;F G
public 
LogoutModel 
( 
SignInManager (
<( )
ApplicationUser) 8
>8 9
signInManager: G
,G H
ILoggerI P
<P Q
LogoutModelQ \
>\ ]
logger^ d
,d e.
!IIdentityServerInteractionService	f �
interaction
� �
)
� �
{ 	
_signInManager 
= 
signInManager *
;* +
_logger 
= 
logger 
; 
this 
. 
interaction 
= 
interaction *
;* +
} 	
public 
async 
Task 
< 
IActionResult '
>' (
OnGet) .
(. /
string/ 5
logoutId6 >
)> ?
{ 	
var   
context   
=   
await   
interaction    +
.  + ,!
GetLogoutContextAsync  , A
(  A B
logoutId  B J
)  J K
;  K L
if!! 
(!! 
context!! 
?!! 
.!! 
ShowSignoutPrompt!! *
==!!+ -
false!!. 3
)!!3 4
{"" 
return## 
await## 
this## !
.##! "
OnPost##" (
(##( )
context##) 0
.##0 1!
PostLogoutRedirectUri##1 F
)##F G
;##G H
}$$ 
return&& 
Page&& 
(&& 
)&& 
;&& 
}'' 	
public)) 
async)) 
Task)) 
<)) 
IActionResult)) '
>))' (
OnPost))) /
())/ 0
string))0 6
	returnUrl))7 @
=))A B
null))C G
)))G H
{** 	
await++ 
_signInManager++  
.++  !
SignOutAsync++! -
(++- .
)++. /
;++/ 0
_logger,, 
.,, 
LogInformation,, "
(,," #
$str,,# 5
),,5 6
;,,6 7
if-- 
(-- 
	returnUrl-- 
!=-- 
null-- !
)--! "
{.. 
return// 
Redirect// 
(//  
	returnUrl//  )
)//) *
;//* +
}00 
else11 
{22 
return55 
RedirectToPage55 %
(55% &
)55& '
;55' (
}66 
}77 	
}88 
}99 �o
�C:\Users\DuartePC\source\repos\HarvestHelper\HarvestHelper.Identity\src\HarvestHelper.Identity.Service\Areas\Identity\Pages\Account\Register.cshtml.cs
	namespace 	
HarvestHelper
 
. 
Identity  
.  !
Service! (
.( )
Areas) .
.. /
Identity/ 7
.7 8
Pages8 =
.= >
Account> E
{ 
public 

class 
RegisterModel 
:  
	PageModel! *
{ 
private 
readonly 
SignInManager &
<& '
ApplicationUser' 6
>6 7
_signInManager8 F
;F G
private 
readonly 
UserManager $
<$ %
ApplicationUser% 4
>4 5
_userManager6 B
;B C
private 
readonly 

IUserStore #
<# $
ApplicationUser$ 3
>3 4

_userStore5 ?
;? @
private   
readonly   
IUserEmailStore   (
<  ( )
ApplicationUser  ) 8
>  8 9
_emailStore  : E
;  E F
private!! 
readonly!! 
ILogger!!  
<!!  !
RegisterModel!!! .
>!!. /
_logger!!0 7
;!!7 8
private"" 
readonly"" 
IEmailSender"" %
_emailSender""& 2
;""2 3
private## 
readonly## 
IdentitySettings## )
identitySettings##* :
;##: ;
public%% 
RegisterModel%% 
(%% 
UserManager&& 
<&& 
ApplicationUser&& '
>&&' (
userManager&&) 4
,&&4 5

IUserStore'' 
<'' 
ApplicationUser'' &
>''& '
	userStore''( 1
,''1 2
SignInManager(( 
<(( 
ApplicationUser(( )
>(() *
signInManager((+ 8
,((8 9
ILogger)) 
<)) 
RegisterModel)) !
>))! "
logger))# )
,))) *
IEmailSender** 
emailSender** $
,**$ %
IOptions++ 
<++ 
IdentitySettings++ %
>++% &
identityOptions++' 6
)++6 7
{,, 	
_userManager-- 
=-- 
userManager-- &
;--& '

_userStore.. 
=.. 
	userStore.. "
;.." #
_emailStore// 
=// 
GetEmailStore// '
(//' (
)//( )
;//) *
_signInManager00 
=00 
signInManager00 *
;00* +
_logger11 
=11 
logger11 
;11 
_emailSender22 
=22 
emailSender22 &
;22& '
identitySettings33 
=33 
identityOptions33 .
.33. /
Value33/ 4
;334 5
}44 	
[:: 	
BindProperty::	 
]:: 
public;; 

InputModel;; 
Input;; 
{;;  !
get;;" %
;;;% &
set;;' *
;;;* +
};;, -
publicAA 
stringAA 
	ReturnUrlAA 
{AA  !
getAA" %
;AA% &
setAA' *
;AA* +
}AA, -
publicGG 
IListGG 
<GG  
AuthenticationSchemeGG )
>GG) *
ExternalLoginsGG+ 9
{GG: ;
getGG< ?
;GG? @
setGGA D
;GGD E
}GGF G
publicMM 
classMM 

InputModelMM 
{NN 	
[SS 
RequiredSS 
]SS 
[TT 
EmailAddressTT 
]TT 
[UU 
DisplayUU 
(UU 
NameUU 
=UU 
$strUU #
)UU# $
]UU$ %
publicVV 
stringVV 
EmailVV 
{VV  !
getVV" %
;VV% &
setVV' *
;VV* +
}VV, -
[\\ 
Required\\ 
]\\ 
[]] 
StringLength]] 
(]] 
$num]] 
,]] 
ErrorMessage]] +
=]], -
$str]]. l
,]]l m
MinimumLength]]n {
=]]| }
$num]]~ 
)	]] �
]
]]� �
[^^ 
DataType^^ 
(^^ 
DataType^^ 
.^^ 
Password^^ '
)^^' (
]^^( )
[__ 
Display__ 
(__ 
Name__ 
=__ 
$str__ &
)__& '
]__' (
public`` 
string`` 
Password`` "
{``# $
get``% (
;``( )
set``* -
;``- .
}``/ 0
[ff 
DataTypeff 
(ff 
DataTypeff 
.ff 
Passwordff '
)ff' (
]ff( )
[gg 
Displaygg 
(gg 
Namegg 
=gg 
$strgg .
)gg. /
]gg/ 0
[hh 
Comparehh 
(hh 
$strhh 
,hh  
ErrorMessagehh! -
=hh. /
$strhh0 f
)hhf g
]hhg h
publicii 
stringii 
ConfirmPasswordii )
{ii* +
getii, /
;ii/ 0
setii1 4
;ii4 5
}ii6 7
}jj 	
publicmm 
asyncmm 
Taskmm 

OnGetAsyncmm $
(mm$ %
stringmm% +
	returnUrlmm, 5
=mm6 7
nullmm8 <
)mm< =
{nn 	
	ReturnUrloo 
=oo 
	returnUrloo !
;oo! "
ExternalLoginspp 
=pp 
(pp 
awaitpp #
_signInManagerpp$ 2
.pp2 31
%GetExternalAuthenticationSchemesAsyncpp3 X
(ppX Y
)ppY Z
)ppZ [
.pp[ \
ToListpp\ b
(ppb c
)ppc d
;ppd e
}qq 	
publicss 
asyncss 
Taskss 
<ss 
IActionResultss '
>ss' (
OnPostAsyncss) 4
(ss4 5
stringss5 ;
	returnUrlss< E
=ssF G
nullssH L
)ssL M
{tt 	
	returnUrluu 
??=uu 
Urluu 
.uu 
Contentuu %
(uu% &
$struu& *
)uu* +
;uu+ ,
ExternalLoginsvv 
=vv 
(vv 
awaitvv #
_signInManagervv$ 2
.vv2 31
%GetExternalAuthenticationSchemesAsyncvv3 X
(vvX Y
)vvY Z
)vvZ [
.vv[ \
ToListvv\ b
(vvb c
)vvc d
;vvd e
ifww 
(ww 

ModelStateww 
.ww 
IsValidww "
)ww" #
{xx 
varyy 
useryy 
=yy 

CreateUseryy %
(yy% &
)yy& '
;yy' (
await{{ 

_userStore{{  
.{{  !
SetUserNameAsync{{! 1
({{1 2
user{{2 6
,{{6 7
Input{{8 =
.{{= >
Email{{> C
,{{C D
CancellationToken{{E V
.{{V W
None{{W [
){{[ \
;{{\ ]
await|| 
_emailStore|| !
.||! "
SetEmailAsync||" /
(||/ 0
user||0 4
,||4 5
Input||6 ;
.||; <
Email||< A
,||A B
CancellationToken||C T
.||T U
None||U Y
)||Y Z
;||Z [
var}} 
result}} 
=}} 
await}} "
_userManager}}# /
.}}/ 0
CreateAsync}}0 ;
(}}; <
user}}< @
,}}@ A
Input}}B G
.}}G H
Password}}H P
)}}P Q
;}}Q R
if 
( 
result 
. 
	Succeeded $
)$ %
{
�� 
_logger
�� 
.
�� 
LogInformation
�� *
(
��* +
$str
��+ V
)
��V W
;
��W X
await
�� 
_userManager
�� &
.
��& '
AddToRoleAsync
��' 5
(
��5 6
user
��6 :
,
��: ;
Roles
��< A
.
��A B
Player
��B H
)
��H I
;
��I J
_logger
�� 
.
�� 
LogInformation
�� *
(
��* +
$"
��+ -
$str
��- D
{
��D E
Roles
��E J
.
��J K
Player
��K Q
}
��Q R
$str
��R X
"
��X Y
)
��Y Z
;
��Z [
var
�� 
userId
�� 
=
��  
await
��! &
_userManager
��' 3
.
��3 4
GetUserIdAsync
��4 B
(
��B C
user
��C G
)
��G H
;
��H I
var
�� 
code
�� 
=
�� 
await
�� $
_userManager
��% 1
.
��1 21
#GenerateEmailConfirmationTokenAsync
��2 U
(
��U V
user
��V Z
)
��Z [
;
��[ \
code
�� 
=
�� 
WebEncoders
�� &
.
��& '
Base64UrlEncode
��' 6
(
��6 7
Encoding
��7 ?
.
��? @
UTF8
��@ D
.
��D E
GetBytes
��E M
(
��M N
code
��N R
)
��R S
)
��S T
;
��T U
var
�� 
callbackUrl
�� #
=
��$ %
Url
��& )
.
��) *
Page
��* .
(
��. /
$str
�� /
,
��/ 0
pageHandler
�� #
:
��# $
null
��% )
,
��) *
values
�� 
:
�� 
new
��  #
{
��$ %
area
��& *
=
��+ ,
$str
��- 7
,
��7 8
userId
��9 ?
=
��@ A
userId
��B H
,
��H I
code
��J N
=
��O P
code
��Q U
,
��U V
	returnUrl
��W `
=
��a b
	returnUrl
��c l
}
��m n
,
��n o
protocol
��  
:
��  !
Request
��" )
.
��) *
Scheme
��* 0
)
��0 1
;
��1 2
await
�� 
_emailSender
�� &
.
��& '
SendEmailAsync
��' 5
(
��5 6
Input
��6 ;
.
��; <
Email
��< A
,
��A B
$str
��C W
,
��W X
$"
�� 
$str
�� B
{
��B C
HtmlEncoder
��C N
.
��N O
Default
��O V
.
��V W
Encode
��W ]
(
��] ^
callbackUrl
��^ i
)
��i j
}
��j k
$str
��k 
"�� �
)��� �
;��� �
if
�� 
(
�� 
_userManager
�� $
.
��$ %
Options
��% ,
.
��, -
SignIn
��- 3
.
��3 4%
RequireConfirmedAccount
��4 K
)
��K L
{
�� 
return
�� 
RedirectToPage
�� -
(
��- .
$str
��. D
,
��D E
new
��F I
{
��J K
email
��L Q
=
��R S
Input
��T Y
.
��Y Z
Email
��Z _
,
��_ `
	returnUrl
��a j
=
��k l
	returnUrl
��m v
}
��w x
)
��x y
;
��y z
}
�� 
else
�� 
{
�� 
await
�� 
_signInManager
�� ,
.
��, -
SignInAsync
��- 8
(
��8 9
user
��9 =
,
��= >
isPersistent
��? K
:
��K L
false
��M R
)
��R S
;
��S T
return
�� 
LocalRedirect
�� ,
(
��, -
	returnUrl
��- 6
)
��6 7
;
��7 8
}
�� 
}
�� 
foreach
�� 
(
�� 
var
�� 
error
�� "
in
��# %
result
��& ,
.
��, -
Errors
��- 3
)
��3 4
{
�� 

ModelState
�� 
.
�� 
AddModelError
�� ,
(
��, -
string
��- 3
.
��3 4
Empty
��4 9
,
��9 :
error
��; @
.
��@ A
Description
��A L
)
��L M
;
��M N
}
�� 
}
�� 
return
�� 
Page
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
private
�� 
ApplicationUser
�� 

CreateUser
��  *
(
��* +
)
��+ ,
{
�� 	
try
�� 
{
�� 
return
�� 
	Activator
��  
.
��  !
CreateInstance
��! /
<
��/ 0
ApplicationUser
��0 ?
>
��? @
(
��@ A
)
��A B
;
��B C
}
�� 
catch
�� 
{
�� 
throw
�� 
new
�� '
InvalidOperationException
�� 3
(
��3 4
$"
��4 6
$str
��6 S
{
��S T
nameof
��T Z
(
��Z [
ApplicationUser
��[ j
)
��j k
}
��k l
$str
��l o
"
��o p
+
��q r
$"
�� 
$str
�� #
{
��# $
nameof
��$ *
(
��* +
ApplicationUser
��+ :
)
��: ;
}
��; <
$str��< �
"��� �
+��� �
$"
�� 
$str
�� a
"
��a b
)
��b c
;
��c d
}
�� 
}
�� 	
private
�� 
IUserEmailStore
�� 
<
��  
ApplicationUser
��  /
>
��/ 0
GetEmailStore
��1 >
(
��> ?
)
��? @
{
�� 	
if
�� 
(
�� 
!
�� 
_userManager
�� 
.
�� 
SupportsUserEmail
�� /
)
��/ 0
{
�� 
throw
�� 
new
�� #
NotSupportedException
�� /
(
��/ 0
$str
��0 j
)
��j k
;
��k l
}
�� 
return
�� 
(
�� 
IUserEmailStore
�� #
<
��# $
ApplicationUser
��$ 3
>
��3 4
)
��4 5

_userStore
��5 ?
;
��? @
}
�� 	
}
�� 
}�� �+
�C:\Users\DuartePC\source\repos\HarvestHelper\HarvestHelper.Identity\src\HarvestHelper.Identity.Service\Controllers\UsersController.cs
	namespace 	
HarvestHelper
 
. 
Identity  
.  !
Service! (
.( )
Controllers) 4
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
[ 
	Authorize 
( 
Policy 
= 
LocalApi  
.  !

PolicyName! +
,+ ,
Roles- 2
=3 4
Roles5 :
.: ;
Admin; @
)@ A
]A B
public 

class 
UsersController  
:! "
ControllerBase# 1
{ 
private 
readonly 
UserManager $
<$ %
ApplicationUser% 4
>4 5
userManager6 A
;A B
public 
UsersController 
( 
UserManager *
<* +
ApplicationUser+ :
>: ;
userManager< G
)G H
{ 	
this 
. 
userManager 
= 
userManager *
;* +
} 	
[ 	
HttpGet	 
] 
public 
ActionResult 
< 
IEnumerable '
<' (
UserDto( /
>/ 0
>0 1
Get2 5
(5 6
)6 7
{ 	
var 
users 
= 
userManager #
.# $
Users$ )
.) *
ToList* 0
(0 1
)1 2
.2 3
Select3 9
(9 :
user: >
=>? A
userB F
.F G
AsDtoG L
(L M
)M N
)N O
;O P
return 
Ok 
( 
users 
) 
; 
}   	
["" 	
HttpGet""	 
("" 
$str"" 
)"" 
]"" 
public## 
async## 
Task## 
<## 
ActionResult## &
<##& '
UserDto##' .
>##. /
>##/ 0
GetByIdAsync##1 =
(##= >
Guid##> B
id##C E
)##E F
{$$ 	
var%% 
user%% 
=%% 
await%% 
userManager%% (
.%%( )
FindByIdAsync%%) 6
(%%6 7
id%%7 9
.%%9 :
ToString%%: B
(%%B C
)%%C D
)%%D E
;%%E F
if'' 
('' 
user'' 
=='' 
null'' 
)'' 
{(( 
return)) 
NotFound)) 
())  
)))  !
;))! "
}** 
return,, 
user,, 
.,, 
AsDto,, 
(,, 
),, 
;,,  
}-- 	
[// 	
HttpPut//	 
(// 
$str// 
)// 
]// 
public00 
async00 
Task00 
<00 
ActionResult00 &
>00& '
PutAsync00( 0
(000 1
Guid001 5
id006 8
,008 9
UpdateUserDto00: G
userDto00H O
)00O P
{11 	
var22 
user22 
=22 
await22 
userManager22 (
.22( )
FindByIdAsync22) 6
(226 7
id227 9
.229 :
ToString22: B
(22B C
)22C D
)22D E
;22E F
if44 
(44 
user44 
==44 
null44 
)44 
{55 
return66 
NotFound66 
(66  
)66  !
;66! "
}77 
user99 
.99 
Email99 
=99 
userDto99  
.99  !
Email99! &
;99& '
user:: 
.:: 
UserName:: 
=:: 
userDto:: #
.::# $
Email::$ )
;::) *
await<< 
userManager<< 
.<< 
UpdateAsync<< )
(<<) *
user<<* .
)<<. /
;<</ 0
return>> 
	NoContent>> 
(>> 
)>> 
;>> 
}?? 	
[AA 	

HttpDeleteAA	 
(AA 
$strAA 
)AA 
]AA 
publicBB 
asyncBB 
TaskBB 
<BB 
ActionResultBB &
>BB& '
DeleteAsyncBB( 3
(BB3 4
GuidBB4 8
idBB9 ;
)BB; <
{CC 	
varDD 
userDD 
=DD 
awaitDD 
userManagerDD (
.DD( )
FindByIdAsyncDD) 6
(DD6 7
idDD7 9
.DD9 :
ToStringDD: B
(DDB C
)DDC D
)DDD E
;DDE F
ifFF 
(FF 
userFF 
==FF 
nullFF 
)FF 
{GG 
returnHH 
NotFoundHH 
(HH  
)HH  !
;HH! "
}II 
awaitKK 
userManagerKK 
.KK 
DeleteAsyncKK )
(KK) *
userKK* .
)KK. /
;KK/ 0
returnMM 
	NoContentMM 
(MM 
)MM 
;MM 
}NN 	
}PP 
}QQ �
nC:\Users\DuartePC\source\repos\HarvestHelper\HarvestHelper.Identity\src\HarvestHelper.Identity.Service\Dtos.cs
	namespace 	
HarvestHelper
 
. 
Identity  
.  !
Service! (
.( )
Dtos) -
{ 
public 

record 
UserDto 
( 
Guid 
Id !
,! "
string# )
Username* 2
,2 3
string4 :
Email; @
,@ A
DateTimeOffsetB P
CreatedDateQ \
)\ ]
;] ^
public 

record 
UpdateUserDto 
(  
[  !
Required! )
]) *
[* +
EmailAddress+ 7
]7 8
string8 >
Email? D
)D E
;E F
}

 �
�C:\Users\DuartePC\source\repos\HarvestHelper\HarvestHelper.Identity\src\HarvestHelper.Identity.Service\Entities\ApplicationRole.cs
	namespace 	
HarvestHelper
 
. 
Identity  
.  !
Service! (
.( )
Entities) 1
{ 
[ 
CollectionName 
( 
$str 
) 
] 
public 

class 
ApplicationRole  
:! "
MongoIdentityRole# 4
<4 5
Guid5 9
>9 :
{		 
} 
} �
�C:\Users\DuartePC\source\repos\HarvestHelper\HarvestHelper.Identity\src\HarvestHelper.Identity.Service\Entities\ApplicationUser.cs
	namespace 	
HarvestHelper
 
. 
Identity  
.  !
Service! (
.( )
Entities) 1
{ 
[ 
CollectionName 
( 
$str 
) 
] 
public 

class 
ApplicationUser  
:  !
MongoIdentityUser" 3
<3 4
Guid4 8
>8 9
{		 
} 
} �
tC:\Users\DuartePC\source\repos\HarvestHelper\HarvestHelper.Identity\src\HarvestHelper.Identity.Service\Extensions.cs
	namespace 	
HarvestHelper
 
. 
Identity  
.  !
Service! (
{ 
public 

static 
class 

Extensions "
{ 
public 
static 
UserDto 
AsDto #
(# $
this$ (
ApplicationUser) 8
user9 =
)= >
{		 	
return

 
new

 
UserDto

 
(

 
user 
. 
Id 
, 
user 
. 
UserName 
, 
user 
. 
Email 
, 
user 
. 
	CreatedOn 
) 
;  
} 	
} 
} �
�C:\Users\DuartePC\source\repos\HarvestHelper\HarvestHelper.Identity\src\HarvestHelper.Identity.Service\HealthChecks\MongoDbHealthCheck.cs
	namespace 	
HarvestHelper
 
. 
Identity  
.  !
Service! (
.( )
HealthChecks) 5
{ 
public		 

class		 
MongoDbHealthCheck		 #
:		$ %
IHealthCheck		& 2
{

 
private 
readonly 
MongoClient $
client% +
;+ ,
public 
MongoDbHealthCheck !
(! "
MongoClient" -
client. 4
)4 5
{ 	
this 
. 
client 
= 
client  
;  !
} 	
public 
async 
Task 
< 
HealthCheckResult +
>+ ,
CheckHealthAsync- =
(= >
HealthCheckContext> P
contextQ X
,X Y
CancellationTokenZ k
cancellationTokenl }
=~ 
default
� �
)
� �
{ 	
try 
{ 
await 
client 
. "
ListDatabaseNamesAsync 3
(3 4
cancellationToken4 E
)E F
;F G
return 
HealthCheckResult (
.( )
Healthy) 0
(0 1
)1 2
;2 3
} 
catch 
( 
	Exception 
ex  
)  !
{ 
return 
HealthCheckResult (
.( )
	Unhealthy) 2
(2 3
	exception3 <
:< =
ex> @
)@ A
;A B
} 
} 	
} 
} �'
�C:\Users\DuartePC\source\repos\HarvestHelper\HarvestHelper.Identity\src\HarvestHelper.Identity.Service\HostedServices\IdentitySeedHostedService.cs
	namespace

 	
HarvestHelper


 
.

 
Identity

  
.

  !
Service

! (
.

( )
HostedServices

) 7
{ 
public 

class &
IdentitySeedHostedServices +
:, -
IHostedService. <
{ 
private 
readonly  
IServiceScopeFactory -
serviceScopeFactory. A
;A B
private 
readonly 
IdentitySettings )
settings* 2
;2 3
public &
IdentitySeedHostedServices )
() * 
IServiceScopeFactory* >
serviceScopeFactory? R
,R S
IOptionsT \
<\ ]
IdentitySettings] m
>m n
identityOptionso ~
)~ 
{ 	
this 
. 
serviceScopeFactory $
=% &
serviceScopeFactory' :
;: ;
settings 
= 
identityOptions &
.& '
Value' ,
;, -
} 	
public 
async 
Task 

StartAsync $
($ %
CancellationToken% 6
cancellationToken7 H
)H I
{ 	
using 
var 
scope 
= 
serviceScopeFactory 1
.1 2
CreateScope2 =
(= >
)> ?
;? @
var 
roleManager 
= 
scope #
.# $
ServiceProvider$ 3
.3 4
GetRequiredService4 F
<F G
RoleManagerG R
<R S
ApplicationRoleS b
>b c
>c d
(d e
)e f
;f g
var 
userManager 
= 
scope #
.# $
ServiceProvider$ 3
.3 4
GetRequiredService4 F
<F G
UserManagerG R
<R S
ApplicationUserS b
>b c
>c d
(d e
)e f
;f g
await &
CreateRoleIfNotExistsAsync ,
(, -
Roles- 2
.2 3
Admin3 8
,8 9
roleManager: E
)E F
;F G
await &
CreateRoleIfNotExistsAsync ,
(, -
Roles- 2
.2 3
Player3 9
,9 :
roleManager; F
)F G
;G H
var!! 
	adminUser!! 
=!! 
await!! !
userManager!!" -
.!!- .
FindByEmailAsync!!. >
(!!> ?
settings!!? G
.!!G H
AdminUserEmail!!H V
)!!V W
;!!W X
if## 
(## 
	adminUser## 
==## 
null## !
)##! "
{$$ 
	adminUser%% 
=%% 
new%% 
ApplicationUser%%  /
{&& 
UserName'' 
='' 
settings'' '
.''' (
AdminUserEmail''( 6
,''6 7
Email(( 
=(( 
settings(( $
.(($ %
AdminUserEmail((% 3
})) 
;)) 
await++ 
userManager++ !
.++! "
CreateAsync++" -
(++- .
	adminUser++. 7
,++7 8
settings++9 A
.++A B
AdminUserPassword++B S
)++S T
;++T U
await,, 
userManager,, !
.,,! "
AddToRoleAsync,," 0
(,,0 1
	adminUser,,1 :
,,,: ;
Roles,,< A
.,,A B
Admin,,B G
),,G H
;,,H I
}-- 
}.. 	
public00 
Task00 
	StopAsync00 
(00 
CancellationToken00 /
cancellationToken000 A
)00A B
=>00C E
Task00F J
.00J K
CompletedTask00K X
;00X Y
private22 
static22 
async22 
Task22 !&
CreateRoleIfNotExistsAsync22" <
(22< =
string22= C
role22D H
,22H I
RoleManager22J U
<22U V
ApplicationRole22V e
>22e f
roleManager22g r
)22r s
{33 	
var44 

roleExists44 
=44 
await44 "
roleManager44# .
.44. /
RoleExistsAsync44/ >
(44> ?
role44? C
)44C D
;44D E
if66 
(66 
!66 

roleExists66 
)66 
{77 
await88 
roleManager88 !
.88! "
CreateAsync88" -
(88- .
new88. 1
ApplicationRole882 A
{88B C
Name88D H
=88I J
role88K O
}88O P
)88P Q
;88Q R
}99 
}:: 	
};; 
}<< �
qC:\Users\DuartePC\source\repos\HarvestHelper\HarvestHelper.Identity\src\HarvestHelper.Identity.Service\Program.cs
	namespace 	
HarvestHelper
 
. 
Identity  
.  !
Service! (
{ 
public 

class 
Program 
{ 
public		 
static		 
void		 
Main		 
(		  
string		  &
[		& '
]		' (
args		) -
)		- .
{

 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. "
ConfigureAzureKeyVault '
(' (
)( )
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} �
oC:\Users\DuartePC\source\repos\HarvestHelper\HarvestHelper.Identity\src\HarvestHelper.Identity.Service\Roles.cs
	namespace 	
HarvestHelper
 
. 
Identity  
.  !
Service! (
{ 
public 

static 
class 
Roles 
{ 
public 
const 
string 
Admin !
=" #
$str$ +
;+ ,
public 
const 
string 
Player "
=# $
$str% -
;- .
} 
} �
�C:\Users\DuartePC\source\repos\HarvestHelper\HarvestHelper.Identity\src\HarvestHelper.Identity.Service\Settings\IdentityServerSettings.cs
	namespace 	
HarvestHelper
 
. 
Identity  
.  !
Service! (
.( )
Settings) 1
{ 
public 

class "
IdentityServerSettings '
{ 
public		 
IReadOnlyCollection		 "
<		" #
ApiScope		# +
>		+ ,
	ApiScopes		- 6
{		7 8
get		8 ;
;		; <
init		= A
;		A B
}		B C
public

 
IReadOnlyCollection

 "
<

" #
ApiResource

# .
>

. /
ApiResources

0 <
{

= >
get

> A
;

A B
init

C G
;

G H
}

H I
public 
IReadOnlyCollection "
<" #
Client# )
>) *
Clients+ 2
{3 4
get4 7
;7 8
init9 =
;= >
}> ?
public 
IReadOnlyCollection "
<" #
IdentityResource# 3
>3 4
IdentityResources5 F
=>G I
new 
IdentityResource  
[  !
]! "
{ 
new 
IdentityResources %
.% &
OpenId& ,
(, -
)- .
,. /
new 
IdentityResources %
.% &
Profile& -
(- .
). /
,/ 0
new 
IdentityResource $
($ %
$str% ,
,- .
new/ 2
[2 3
]3 4
{4 5
$str5 ;
}; <
)< =
} 
; 
} 
} �	
�C:\Users\DuartePC\source\repos\HarvestHelper\HarvestHelper.Identity\src\HarvestHelper.Identity.Service\Settings\IdentitySettings.cs
	namespace 	
HarvestHelper
 
. 
Identity  
.  !
Service! (
.( )
Settings) 1
{ 
public 

class 
IdentitySettings !
{ 
public 
string 
AdminUserEmail $
{% &
get' *
;* +
init, 0
;0 1
}2 3
public 
string 
AdminUserPassword '
{( )
get* -
;- .
init/ 3
;3 4
}5 6
public		 
string		 
PathBase		 
{		  
get		  #
;		# $
init		% )
;		) *
}		+ ,
public 
string "
CertificateKeyFilePath ,
{- .
get. 1
;1 2
init3 7
;7 8
}9 :
public 
string "
CertificateCerFilePath ,
{- .
get. 1
;1 2
init3 7
;7 8
}9 :
} 
} �j
qC:\Users\DuartePC\source\repos\HarvestHelper\HarvestHelper.Identity\src\HarvestHelper.Identity.Service\Startup.cs
	namespace 	
HarvestHelper
 
. 
Identity  
.  !
Service! (
{ 
public 

class 
Startup 
{ 
private 
const 
string  
AllowedOriginSetting 1
=2 3
$str4 C
;C D
private 
readonly 
IHostEnvironment )
environment* 5
;5 6
public 
Startup 
( 
IConfiguration %
configuration& 3
,3 4
IHostEnvironment5 E
environmentF Q
)Q R
{   	
Configuration!! 
=!! 
configuration!! )
;!!) *
this"" 
."" 
environment"" 
="" 
environment"" *
;""* +
}## 	
public%% 
IConfiguration%% 
Configuration%% +
{%%, -
get%%. 1
;%%1 2
}%%3 4
public(( 
void(( 
ConfigureServices(( %
(((% &
IServiceCollection((& 8
services((9 A
)((A B
{)) 	
BsonSerializer** 
.** 
RegisterSerializer** -
(**- .
new**. 1
GuidSerializer**2 @
(**@ A
BsonType**A I
.**I J
String**J P
)**P Q
)**Q R
;**R S
var++ 
serviceSettings++ 
=++  !
Configuration++" /
.++/ 0

GetSection++0 :
(++: ;
nameof++; A
(++A B
ServiceSettings++B Q
)++Q R
)++R S
.++S T
Get++T W
<++W X
ServiceSettings++X g
>++g h
(++h i
)++i j
;++j k
var,, 
mongoDbSettings,, 
=,,  !
Configuration,," /
.,,/ 0

GetSection,,0 :
(,,: ;
nameof,,; A
(,,A B
MongoDbSettings,,B Q
),,Q R
),,R S
.,,S T
Get,,T W
<,,W X
MongoDbSettings,,X g
>,,g h
(,,h i
),,i j
;,,j k
services.. 
... 
	Configure.. 
<.. 
IdentitySettings.. /
>../ 0
(..0 1
Configuration..1 >
...> ?

GetSection..? I
(..I J
nameof..J P
(..P Q
IdentitySettings..Q a
)..a b
)..b c
)..c d
.// 
AddDefaultIdentity// #
<//# $
ApplicationUser//$ 3
>//3 4
(//4 5
)//5 6
.00 
AddRoles00 
<00 
ApplicationRole00 )
>00) *
(00* +
)00+ ,
.11 
AddMongoDbStores11 !
<11! "
ApplicationUser11" 1
,111 2
ApplicationRole113 B
,11B C
Guid11D H
>11H I
(22 
mongoDbSettings33 #
.33# $
ConnectionString33$ 4
,334 5
serviceSettings44 #
.44# $
ServiceName44$ /
)55 
;55 
services77 
.77 +
AddMassTransitWithMessageBroker77 4
(774 5
Configuration775 B
,77B C
retryConfigurator77D U
=>77V X
{88 
retryConfigurator99 !
.99! "
Interval99" *
(99* +
$num99+ ,
,99, -
TimeSpan99. 6
.996 7
FromSeconds997 B
(99B C
$num99C D
)99D E
)99E F
;99F G
}:: 
):: 
;:: 
AddIdentityServer<< 
(<< 
services<< &
)<<& '
;<<' (
services>> 
.>> %
AddLocalApiAuthentication>> .
(>>. /
)>>/ 0
;>>0 1
services@@ 
.@@ 
AddControllers@@ #
(@@# $
)@@$ %
;@@% &
servicesAA 
.AA 
AddHostedServiceAA %
<AA% &&
IdentitySeedHostedServicesAA& @
>AA@ A
(AAA B
)AAB C
;AAC D
servicesBB 
.BB 
AddSwaggerGenBB "
(BB" #
cBB# $
=>BB% '
{CC 
cDD 
.DD 

SwaggerDocDD 
(DD 
$strDD !
,DD! "
newDD# &
OpenApiInfoDD' 2
{DD3 4
TitleDD5 :
=DD; <
$strDD= ]
,DD] ^
VersionDD_ f
=DDg h
$strDDi m
}DDn o
)DDo p
;DDp q
}EE 
)EE 
;EE 
servicesGG 
.GG 
AddHealthChecksGG $
(GG$ %
)GG% &
.HH 

AddMongoDbHH 
(HH  
)HH  !
;HH! "
servicesJJ 
.JJ 
	ConfigureJJ 
<JJ #
ForwardedHeadersOptionsJJ 6
>JJ6 7
(JJ7 8
optionsJJ8 ?
=>JJ@ B
{KK 
optionsLL 
.LL 
ForwardedHeadersLL (
=LL) *
ForwardedHeadersLL+ ;
.LL; <
XForwardedForLL< I
|LLJ K
ForwardedHeadersLLL \
.LL\ ]
XForwardedProtoLL] l
;LLl m
optionsMM 
.MM 
KnownNetworksMM %
.MM% &
ClearMM& +
(MM+ ,
)MM, -
;MM- .
optionsNN 
.NN 
KnownProxiesNN $
.NN$ %
ClearNN% *
(NN* +
)NN+ ,
;NN, -
}OO 
)OO 
;OO 
}PP 	
publicSS 
voidSS 
	ConfigureSS 
(SS 
IApplicationBuilderSS 1
appSS2 5
,SS5 6
IWebHostEnvironmentSS7 J
envSSK N
)SSN O
{TT 	
appUU 
.UU 
UseForwardedHeadersUU #
(UU# $
)UU$ %
;UU% &
ifWW 
(WW 
envWW 
.WW 
IsDevelopmentWW !
(WW! "
)WW" #
)WW# $
{XX 
appYY 
.YY %
UseDeveloperExceptionPageYY -
(YY- .
)YY. /
;YY/ 0
appZZ 
.ZZ 

UseSwaggerZZ 
(ZZ 
)ZZ  
;ZZ  !
app[[ 
.[[ 
UseSwaggerUI[[  
([[  !
c[[! "
=>[[# %
c[[& '
.[[' (
SwaggerEndpoint[[( 7
([[7 8
$str[[8 R
,[[R S
$str[[T w
)[[w x
)[[x y
;[[y z
app]] 
.]] 
UseCors]] 
(]] 
builder]] $
=>]]% '
{^^ 
builder__ 
.__ 
WithOrigins__ '
(__' (
Configuration__( 5
[__5 6 
AllowedOriginSetting__6 J
]__J K
)__K L
.`` 
AllowAnyHeader`` '
(``' (
)``( )
.aa 
AllowAnyMethodaa '
(aa' (
)aa( )
;aa) *
}bb 
)bb 
;bb 
}cc 
appee 
.ee 
UseHttpsRedirectionee #
(ee# $
)ee$ %
;ee% &
appgg 
.gg 
Usegg 
(gg 
(gg 
contextgg 
,gg 
nextgg "
)gg" #
=>gg$ &
{hh 
varii 
identitySettingsii $
=ii% &
Configurationii' 4
.ii4 5

GetSectionii5 ?
(ii? @
nameofii@ F
(iiF G
IdentitySettingsiiG W
)iiW X
)iiX Y
.iiY Z
GetiiZ ]
<ii] ^
IdentitySettingsii^ n
>iin o
(iio p
)iip q
;iiq r
contextjj 
.jj 
Requestjj 
.jj  
PathBasejj  (
=jj) *
newjj+ .
	Microsoftjj/ 8
.jj8 9

AspNetCorejj9 C
.jjC D
HttpjjD H
.jjH I

PathStringjjI S
(jjS T
identitySettingsjjT d
.jjd e
PathBasejje m
)jjm n
;jjn o
returnkk 
nextkk 
(kk 
)kk 
;kk 
}ll 
)ll 
;ll 
appnn 
.nn 
UseStaticFilesnn 
(nn 
)nn  
;nn  !
apppp 
.pp 

UseRoutingpp 
(pp 
)pp 
;pp 
apprr 
.rr 
UseIdentityServerrr !
(rr! "
)rr" #
;rr# $
appss 
.ss 
UseAuthorizationss  
(ss  !
)ss! "
;ss" #
appuu 
.uu 
UseCookiePolicyuu 
(uu  
newuu  #
CookiePolicyOptionsuu$ 7
{vv !
MinimumSameSitePolicyww %
=ww& '
SameSiteModeww( 4
.ww4 5
Laxww5 8
}xx 
)xx 
;xx 
appzz 
.zz 
UseEndpointszz 
(zz 
	endpointszz &
=>zz' )
{{{ 
	endpoints|| 
.|| 
MapControllers|| (
(||( )
)||) *
;||* +
	endpoints}} 
.}} 
MapRazorPages}} '
(}}' (
)}}( )
;}}) *
	endpoints~~ 
.~~ (
MapHarvestHelperHealthChecks~~ 6
(~~6 7
)~~7 8
;~~8 9
} 
) 
; 
}
�� 	
private
�� 
void
�� 
AddIdentityServer
�� &
(
��& ' 
IServiceCollection
��' 9
services
��: B
)
��B C
{
�� 	
var
�� $
identityServerSettings
�� &
=
��' (
Configuration
��) 6
.
��6 7

GetSection
��7 A
(
��A B
nameof
��B H
(
��H I$
IdentityServerSettings
��I _
)
��_ `
)
��` a
.
��a b
Get
��b e
<
��e f$
IdentityServerSettings
��f |
>
��| }
(
��} ~
)
��~ 
;�� �
var
�� 
builder
�� 
=
�� 
services
�� "
.
��" #
AddIdentityServer
��# 4
(
��4 5
options
��5 <
=>
��= ?
{
�� 
options
�� 
.
�� 
Events
�� 
.
��  
RaiseSuccessEvents
�� 1
=
��2 3
true
��4 8
;
��8 9
options
�� 
.
�� 
Events
�� 
.
��  
RaiseFailureEvents
�� 1
=
��2 3
true
��4 8
;
��8 9
options
�� 
.
�� 
Events
�� 
.
�� 
RaiseErrorEvents
�� /
=
��0 1
true
��2 6
;
��6 7
options
�� 
.
�� 
KeyManagement
�� %
.
��% &
KeyPath
��& -
=
��. /
Path
��0 4
.
��4 5
GetDirectoryName
��5 E
(
��E F
Assembly
��F N
.
��N O
GetEntryAssembly
��O _
(
��_ `
)
��` a
.
��a b
Location
��b j
)
��j k
;
��k l
}
�� 
)
�� 
.
�� 
AddAspNetIdentity
�� 
<
�� 
ApplicationUser
�� .
>
��. /
(
��/ 0
)
��0 1
.
�� "
AddInMemoryApiScopes
�� !
(
��! "$
identityServerSettings
��" 8
.
��8 9
	ApiScopes
��9 B
)
��B C
.
�� %
AddInMemoryApiResources
�� $
(
��$ %$
identityServerSettings
��% ;
.
��; <
ApiResources
��< H
)
��H I
.
��  
AddInMemoryClients
�� 
(
��  $
identityServerSettings
��  6
.
��6 7
Clients
��7 >
)
��> ?
.
�� *
AddInMemoryIdentityResources
�� )
(
��) *$
identityServerSettings
��* @
.
��@ A
IdentityResources
��A R
)
��R S
.
�� +
AddDeveloperSigningCredential
�� *
(
��* +
)
��+ ,
;
��, -
if
�� 
(
�� 
!
�� 
environment
�� 
.
�� 
IsDevelopment
�� )
(
��) *
)
��* +
)
��+ ,
{
�� 
var
�� 
identitySettings
�� $
=
��% &
Configuration
��' 4
.
��4 5

GetSection
��5 ?
(
��? @
nameof
��@ F
(
��F G
IdentitySettings
��G W
)
��W X
)
��X Y
.
��Y Z
Get
��Z ]
<
��] ^
IdentitySettings
��^ n
>
��n o
(
��o p
)
��p q
;
��q r
var
�� 
cert
�� 
=
�� 
X509Certificate2
�� +
.
��+ ,
CreateFromPemFile
��, =
(
��= >
identitySettings
�� $
.
��$ %$
CertificateCerFilePath
��% ;
,
��; <
identitySettings
�� $
.
��$ %$
CertificateKeyFilePath
��% ;
)
�� 
;
�� 
builder
�� 
.
�� "
AddSigningCredential
�� ,
(
��, -
cert
��- 1
)
��1 2
;
��2 3
}
�� 
}
�� 	
}
�� 
}�� 