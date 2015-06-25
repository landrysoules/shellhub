angular.module('shellhub', [])

    .controller('CommentController', ['$scope', function($scope){

    }])

    .controller('StarController',['$scope', '$http', '$location', function($scope, $http, $location){
        var url = $location.absUrl();
        console.debug("url", url);
        var regex = /\d+$/;
        var result = regex.exec(url)[0];
        $scope.authUser = false;
        $http.get('/snipets/' + result + '/star_info.json', {})
            .success(function(data){
                    $scope.starred = data.starred;
                    $scope.starCount = data.star_count || '';
                    $scope.authUser = data.auth_user;
                });
        $scope.giveSnippetAStar = function(snippetId){
            if($scope.authUser)
                $http.put('/snipets/' + snippetId + '/star.json', {})
                    .success(function(data){
                        $scope.starred = data.starred;
                        $scope.starCount = data.star_count || '';
                    });
        };
    }]);
