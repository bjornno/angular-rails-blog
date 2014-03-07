ReverseGeolocationService = ($q, $rootScope, $http) ->

  url = (latitude, longitude) ->
    "http://nominatim.openstreetmap.org/reverse?format=json&lat=#{latitude}&lon=#{longitude}&zoom=18&addressdetails=0"

  findAddress = (latitude, longitude) ->
    defer = $q.defer()
    $http(method: 'GET', url: url(latitude, longitude))
    .success (data) ->
      defer.resolve(data.display_name)
    .error (status) ->
        console.log("error")
        defer.reject(status)

    defer.promise

  {findAddress: findAddress}

ReverseGeolocationService.$inject = ["$q", "$rootScope", "$http"]
angular.module('Blog').factory "ReverseGeolocationService", ReverseGeolocationService