 var mainApp = angular.module("frm", ['ngtimeago']);
         
         mainApp.controller('ListingController', function($scope,$http) {
            $scope.listings = []
            $scope.areas = []
            $scope.cities = []

            $http.get("/listings_json.json").success(function (data) {               
                angular.forEach(data,function (key) {
                    $scope.listings.push(key);                   
                });
            });  
            $http.get("/areas_json.json").success(function (data) {               
                angular.forEach(data,function (key) {
                    $scope.areas.push(key);                   
                });
            });  
            $http.get("/cities_json.json").success(function (data) {               
                angular.forEach(data,function (key) {
                    $scope.cities.push(key);                   
                });
            });    

             $scope.filter = {};
         });


