var app = angular.module('myapp', ['ngRoute', 'ngCookies', 'ui.router']);
app.config(['$stateProvider', '$urlRouterProvider',
    function ($stateProvider, $urlRouterProvider) {
        /** @ngInject */
        $urlRouterProvider.otherwise("/index");
        $stateProvider.
                state('/index', {
                    url: '/index',
                    templateUrl: 'views/index.html',
                    controller: 'ticketController',
                    is_login: true
                }).
                state('/login', {
                    url: '/login',
                    templateUrl: 'views/login.html',
                    controller: 'userCtrl',
                    is_login: true
                }).
                state('/dashboard', {
                    url: '/dashboard',
                    templateUrl: 'views/dashboard.html',
                    controller: 'ticketController',
                    is_login: false
                }).
                state('/create-ticket', {
                    url: '/create-ticket',
                    templateUrl: 'views/create-ticket.html',
                    controller: 'ticketController',
                    is_login: false
                }).
                state('/edit-ticket?ticket_id', {
                    url: '/edit-ticket?ticket_id',
                    templateUrl: 'views/edit-ticket.html',
                    controller: 'editticketController',
                    is_login: false
                });
    }]);
app.run(['$rootScope', '$cookies', '$state', 'authorization', '$http', '$timeout', '$interval', '$stateParams', function ($rootScope, $cookies, $state, authorization, $http, $timeout, $interval, $stateParams) {
        $rootScope.$on('$stateChangeStart', function (event, toState) {
            if ($cookies.get('userdata') !== undefined && $cookies.get('userdata') != '') {
                $rootScope.userdata = JSON.parse($cookies.get('userdata'));
            } else {
                $rootScope.userdata = '';
            }

            if (toState.data !== undefined && toState.data.access !== undefined) {
                authorised = authorization.authorize(toState.data.access.requiredPermissions, toState.data.access.permissionCheckType);
                if (authorised === authorization.constants.loginRequired) {
                    event.preventDefault();
                    $state.go('/index');
                } else if (authorised === authorization.constants.notAuthorised) {
                    event.preventDefault();
                    $state.go('/dashboard');
                }
            }

        });

        $rootScope.$on('$stateChangeSuccess', function (event, toState) {

            if (toState.is_login !== undefined) {
                $rootScope.is_login = toState.is_login;
            }

            var hash = window.location.hash.substr(1);

            $rootScope.current_page = hash;

            if ($rootScope.current_page == '/login' && $rootScope.userdata !== undefined && $rootScope.userdata !== "") {
                window.location.href = '#/dashboard';
            }
            if ((($rootScope.userdata == undefined || $rootScope.userdata == "") && $rootScope.current_page !== '/login')) {
                window.location.href = '#/index';
            }
        });
    }]);
