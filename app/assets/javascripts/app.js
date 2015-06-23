angular.module('shellhub', [])
.controller('CommentController', [
    '$scope',
    function($scope){
    }])
    .controller('StarController',['$scope', '$http', function($scope, $http){
        $scope.giveSnippetAStar=function(snippetId){
            console.debug("pop " + snippetId);
            $http.put('/snipets/' + snippetId + '/star.json', {}).success(function(data){
            $scope.starred = data.starred;
            });
            //$http.put('/snipets/' + snippetId + '/star.json',function(success){
            //    $scope.pop = success.data;
            //});
        };
    }]);
