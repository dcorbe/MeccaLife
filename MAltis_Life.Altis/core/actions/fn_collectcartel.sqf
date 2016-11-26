#include <macro.h>
/*

Collect your cartel payment.

*/

_gang_id=life_gangid;
_query = format["collectCartel:%1",_gang_id];
waitUntil{!DB_Async_Active};
_queryres = [_query,2] call DB_fnc_asyncCall;
hint format{"%1",_queryres};


