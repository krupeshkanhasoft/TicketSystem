// This is to prevent unauthorized access.authorization by user level.
app.factory('authorization', authorization);
function authorization($rootScope) {
    var service = {
        authorize: authorize,
        constants: {
            authorised: 0,
            notAuthorised: 2
        }
    };
    return service;
    function authorize(requiredPermissions, permissionCheckType) {
        var result = service.constants.authorised,
                user = $rootScope.userdata,
                loweredPermissions = [],
                hasPermission = true,
                permission;

        permissionCheckType = permissionCheckType || 'atLeastOne';

        if ($rootScope.userdata == null) {
            return false;
        }
        if (requiredPermissions) {
            loweredPermissions = [];
            loweredPermissions.push(user.role_id);

            for (var i = 0; i < requiredPermissions.length; i += 1) {
                permission = requiredPermissions[i].toLowerCase();

                if (permissionCheckType === 'combinationRequired') {
                    hasPermission = hasPermission && loweredPermissions.indexOf(permission) > -1;
                    // if all the permissions are required and hasPermission is false there is no point carrying on
                    if (hasPermission === false) {
                        break;
                    }
                } else if (permissionCheckType === 'atLeastOne') {
                    hasPermission = loweredPermissions.indexOf(permission) > -1;
                    // if we only need one of the permissions and we have it there is no point carrying on
                    if (hasPermission) {
                        break;
                    }
                }
            }

            result = hasPermission ?
                    service.constants.authorised :
                    service.constants.notAuthorised;
        }
        return result;
    }
}