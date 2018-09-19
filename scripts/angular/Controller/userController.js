var path = 'http://103.239.146.251:8084/v1/';
app.controller('userCtrl', ['$rootScope', '$scope', '$window', '$http', '$location', '$stateParams', '$cookies', function ($rootScope, $scope, $window, $http, $location, $stateParams, $cookies) {
        var hash = window.location.hash.substr(1);

        if ($rootScope.userdata === undefined && $cookies.get('userdata') !== undefined) {
            $rootScope.userdata = $cookies.get('userdata');
        }

        $scope.userLogin = function () {
            $scope.submitted = true;
            if ($('#login_form').valid()) {
                data = {
                    emailuser: $scope.email,
                    password: $scope.password
                }
                $http({
                    method: "post",
                    url: path + 'users/checklogin/',
                    data: data,
                }).success(function (response) {
                    if (response && response.status == true) {
                        var user_detail = {};
                        user_detail.email = response.email;
                        user_detail.id = response.id;
                        user_detail.token = response.token;
                        $rootScope.userdata = user_detail;
                        $cookies.put('userdata', JSON.stringify($rootScope.userdata));
                        window.location.href = '#/dashboard';
                    } else {
                        $.alert(response.Message);
                    }
                }).error(function () {
                    $.alert('Internal server error!');
                });
            }
        }

        $scope.logout = function () {
            $rootScope.userdata = '';
            $cookies.put('userdata', '');
            window.location.replace('#');
        }

    }]);