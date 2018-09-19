app.directive('header', function ($templateRequest, $compile) {
    return {
        restrict: 'A',
        controller: 'userCtrl',
        templateUrl: function (element, attrs) {
            return "views/header.html";
        }
    }
});

app.directive('sidebar', function () {
    return {
        restrict: 'A', //This menas that it will be used as an attribute and NOT as an element. I don't like creating custom HTML elements
        templateUrl: function (element, attrs) {
            return "views/sidebar.html";
        }
    }
});

app.directive('footer', function () {
    return {
        restrict: 'A', //This menas that it will be used as an attribute and NOT as an element. I don't like creating custom HTML elements
        templateUrl: function (element, attrs) {
            return "views/footer.html";
        }
    }
});