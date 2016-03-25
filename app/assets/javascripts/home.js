 var mainApp = angular.module("frm", ['ngtimeago']);
         
         mainApp.controller('ListingController', function($scope,$http) {
            $scope.listings = []

            $http.get("/rooms.json").success(function (data) {
               
                angular.forEach(data,function (key) {
                    $scope.listings.push(key);
                    console.log(key)
                });
            });    
         });


