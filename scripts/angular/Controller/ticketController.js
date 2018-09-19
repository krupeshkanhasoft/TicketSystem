var path = 'http://103.239.146.251:8084/v1/';
app.controller('ticketController', ['$rootScope', '$scope', '$window', '$http', '$location', '$stateParams', '$cookies', function ($rootScope, $scope, $window, $http, $location, $stateParams, $cookies) {
        var hash = window.location.hash.substr(1);

        /*
         * Check user data in cookies and assign in rootScope to use globally 
         */

        if ($rootScope.userdata === undefined && $cookies.get('userdata') !== undefined) {
            $rootScope.userdata = $cookies.get('userdata');
        }

        /*
         * Get list of all submitted tickets 
         */
        $scope.TicketList = {}

        $http({
            method: "get",
            url: path + 'Tickets/GetAllTicketAdmin/',
            headers: {
                "AUTHORIZATION": "Token " + $rootScope.userdata.token
            },
        }).success(function (response) {
            if (response && response.status == true) {
                $scope.TicketList = response.data.Ticket;
            }
        });

        /*
         * Master Data for select options 
         */
        $rootScope.status = {};
        $rootScope.type = {};
        $rootScope.urgency = {};

        $http({
            method: "get",
            url: path + 'Tickets/getMasterData/',
        }).success(function (response) {
            if (response && response.status == true) {
                $rootScope.status = response.data.status;
                $rootScope.type = response.data.type;
                $rootScope.urgency = response.data.urgency;
            }
        })

        /*
         * Create ticket when user is logged in, token is passed to heder for authentication
         */

        $scope.CreateAuthrizedTicket = function () {
            if ($('#submit_ticket').valid()) {
                $http({
                    method: "post",
                    url: path + 'Tickets/CreateTicketAdmin/',
                    data: $scope.Ticket,
                    headers: {
                        "AUTHORIZATION": "Token " + $rootScope.userdata.token
                    },
                }).success(function (response) {
                    if (response && response.status == true) {
                        $scope.Ticket = {};
                        $.alert(response.Message);
                        window.location.href = '#/dashboard';
                    } else {
                        $.alert(response.Message);
                    }
                }).error(function () {
                    $.alert('Internal server error!');
                });
            }
        };

        /*
         * Create ticket as a anonymous user
         */

        $scope.CreateGuestTicket = function () {
            if ($('#submit_ticket').valid()) {
                $http({
                    method: "post",
                    url: path + 'Tickets/CreateTicket/',
                    data: $scope.Ticket,
                }).success(function (response) {
                    if (response && response.status == true) {
                        $scope.Ticket = {};
                        $.alert(response.Message);
                    } else {
                        $.alert(response.Message);
                    }
                }).error(function () {
                    $.alert('Internal server error!');
                });
            }
        };

        /*
         * Delete ticket from ticket listing
         */

        $scope.delete_ticket = function (ticket_id) {
            $.confirm({
                title: 'Confirm!',
                content: 'Are you sure you want to delete Ticket?',
                buttons: {
                    confirm: function () {
                        $http({
                            method: "post",
                            url: path + 'Tickets/DeleteTicketAdmin/',
                            data: {id: ticket_id},
                            headers: {
                                "AUTHORIZATION": "Token " + $rootScope.userdata.token
                            },
                        }).success(function (response) {
                            if (response && response.status == true) {
                                $scope.TicketList = response.data.Ticket;
                                $.alert(response.Message);
                            } else {
                                $.alert(response.Message);
                            }
                        }).error(function () {
                            $.alert('Internal server error!');
                        });
                    },
                    cancel: function () {
                    }
                }
            });
        }

        /*
         * Update ticket status
         */

        $scope.update_status = function (ticket_id, status_id) {
            $http({
                method: "post",
                url: path + 'Tickets/UpdateTicketStatusAdmin/',
                data: {id: ticket_id, status: status_id},
                headers: {
                    "AUTHORIZATION": "Token " + $rootScope.userdata.token
                },
            }).success(function (response) {
                if (response && response.status == true) {
                    $.alert(response.Message);
                    $scope.TicketList = response.data.Ticket;
                } else {
                    $.alert(response.Message);
                }
            }).error(function () {
                $.alert('Internal server error!');
            });
        };

        /*
         * Add comments to ticket
         */

        $scope.addCommentModal = function (ticket_id) {
            $scope.Ticket = {};
            $scope.Ticket.ticketid = ticket_id;
            $http({
                method: "get",
                url: path + 'Tickets/GetTicket/' + ticket_id + "/",
                data: $scope.Ticket,
                headers: {
                    "AUTHORIZATION": "Token " + $rootScope.userdata.token
                },
            }).success(function (response) {
                if (response && response.status == true) {
                    $scope.Ticket.comments = response.data[0].comment;
                    $('#EditNoteModal').modal('toggle');
                } else {
                    $.alert(response.Message);
                }
            }).error(function () {
                $.alert('Internal server error!');
            });
        };

        /*
         * Save Ticket comments from user
         */

        $scope.saveComment = function () {
            if ($('#submit_comment').valid()) {
                $http({
                    method: "post",
                    url: path + 'Tickets/CreateTicketCommentAdmin/',
                    data: $scope.Ticket,
                    headers: {
                        "AUTHORIZATION": "Token " + $rootScope.userdata.token
                    },
                }).success(function (response) {
                    if (response && response.status == true) {
                        var Comment = {
                            comment: $scope.Ticket.comment,
                            user: {
                                email: $rootScope.userdata.email,
                                id: $rootScope.userdata.id,
                                username: $rootScope.userdata.email}
                        };
                        $scope.Ticket.comments.push(Comment);
                        $scope.Ticket.comment = '';
                        $.alert(response.Message);
                    } else {
                        $.alert(response.Message);
                    }
                }).error(function () {
                    $.alert('Internal server error!');
                });
            }
        };


        /*
         * Edit submitted ticket
         */

        $scope.EditTicket = function (ticket_id) {
            window.location.href = '#/edit-ticket?ticket_id=' + ticket_id;

        };
    }]).controller('editticketController', ['$rootScope', '$scope', '$window', '$http', '$location', '$stateParams', '$cookies', function ($rootScope, $scope, $window, $http, $location, $stateParams, $cookies) {
        /*
         * Master Data for select options 
         */
        $rootScope.status = {};
        $rootScope.type = {};
        $rootScope.urgency = {};

        $http({
            method: "get",
            url: path + 'Tickets/getMasterData/',
        }).success(function (response) {
            if (response && response.status == true) {
                $rootScope.status = response.data.status;
                $rootScope.type = response.data.type;
                $rootScope.urgency = response.data.urgency;
            }
        });

        /*
         * Open edit form to update record
         */

        if ($stateParams.ticket_id !== '') {
            $scope.Ticket = {};
            $http({
                method: "get",
                url: path + 'Tickets/GetTicket/' + $stateParams.ticket_id + "/",
                headers: {
                    "AUTHORIZATION": "Token " + $rootScope.userdata.token
                },
            }).success(function (response) {
                if (response && response.status == true) {
                    $scope.Ticket = response.data[0];

                } else {
                    $.alert(response.Message);
                }
            }).error(function () {
                $.alert('Internal server error!');
            });
        }

        /*
         * Update ticket
         */
        $scope.UpdateTicket = function () {
            if ($('#submit_ticket').valid()) {
                $scope.updateTicket = {};
                $scope.updateTicket.id = $scope.Ticket.id;
                $scope.updateTicket.name = $scope.Ticket.name;
                $scope.updateTicket.email = $scope.Ticket.email;
                $scope.updateTicket.subject = $scope.Ticket.subject;
                $scope.updateTicket.urgency = (typeof ($scope.Ticket.urgency.id) != "undefined") ? $scope.Ticket.urgency.id : $scope.Ticket.urgency;
                $scope.updateTicket.type = (typeof ($scope.Ticket.type) == "undefined") ? $scope.Ticket.tickettype.id : $scope.Ticket.type;
                $scope.updateTicket.status = $scope.Ticket.status.id;
                $scope.updateTicket.message = $scope.Ticket.message;
                $http({
                    method: "post",
                    url: path + 'Tickets/UpdateTicketAdmin/',
                    data: $scope.updateTicket,
                    headers: {
                        "AUTHORIZATION": "Token " + $rootScope.userdata.token
                    },
                }).success(function (response) {
                    if (response && response.status == true) {
                        $scope.updateTicket = {};
                        $scope.Ticket = {};
                        window.location.href = '#/dashboard';
                        $.alert(response.Message);
                    } else {
                        $.alert(response.Message);
                    }
                }).error(function () {
                    $.alert('Internal server error!');
                });
            }
        };
    }]);